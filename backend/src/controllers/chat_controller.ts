import Controller from "./controller";
import { Request, Response } from "express";
import * as expressValidator from "express-validator";
import { verifyToken } from "../middlewares/verify_token_middleware";
import { ChatOpenAI } from "langchain/chat_models/openai";
import {
  HumanChatMessage,
  SystemChatMessage,
  AIChatMessage,
  BaseChatMessage,
} from "langchain/schema";
import Validators from "../core/validators";
import Chat from "../models/chat";
import Utils from "../core/utils";
import User from "../models/user";
import SubscriptionTier from "../models/subscription_tier";
import ModelName from "../models/model_name";

const FREE_TIER_MAX_API_CALLS = 5;
const GPT_4_MAX_API_CALLS_COUNT_PER_INTERVAL = 2;
const GPT_4_MAX_API_CALLS_INTERVAL = 3 * 60 * 60 * 1000; // 3 hours

class ChatController extends Controller {
  public path: string = "/chat";

  protected initRoutes(): void {
    this.router.use(verifyToken);

    this.router.get("/", ...Validators.validateChat(), this.index.bind(this));
  }

  private async index(req: Request, res: Response) {
    const validationResult = expressValidator.validationResult(req);
    if (!validationResult.isEmpty()) {
      return res.status(400).end();
    }

    const {
      chatList,
      token,
      modelName,
    }: { chatList: Chat[]; token: string; modelName: ModelName } = req.body;

    const username = Utils.getUsernameFromJwt(token);
    if (username == null) {
      // This means the JWT token is invalid, or doesn't have a username.
      // The user shouldn't be able to reach this stage without a username.
      return res.status(500).end();
    }

    const user = await User.findOne({
      where: {
        username: username,
      },
    });
    if (user == null) {
      // The user shouldn't be able to reach this stage without a user instance in the database,
      // since login creates it and login is required to reach this stage.
      return res.status(500).end();
    }

    if (user.isGenerating) {
      return res.status(400).json({
        errorCode: "user-is-generating",
        message:
          "You are already generating a response. Please wait for it to finish. Only one response can be generated at a time.",
      });
    }

    if (
      user.subscriptionTier === null &&
      user.apiCallsCount >= FREE_TIER_MAX_API_CALLS
    ) {
      // Status code 402 means payment required.
      return res.status(402).json({
        errorCode: "free-tier-api-calls-limit-reached",
        message:
          "You have reached the limit of 5 free trial API calls for your account.",
      });
    }

    if (
      user.subscriptionTier === SubscriptionTier.alyamamahGPT &&
      user.subscriptionExpiration &&
      user.subscriptionExpiration < new Date()
    ) {
      // Status code 402 means payment required.
      return res.status(402).json({
        errorCode: "alyamamah-gpt-subscription-expired",
        message: `Your subscription "${SubscriptionTier.alyamamahGPT.valueOf()}" has expired. Please renew your subscription to continue using the service.`,
      });
    }

    const now = new Date();
    const gpt4IntervalAgo = new Date(
      now.getTime() - GPT_4_MAX_API_CALLS_INTERVAL
    );

    if (modelName === "gpt-4") {
      if (user.gpt4ApiCallsResetTime < gpt4IntervalAgo) {
        user.gpt4ApiCallsCount = 0;
        user.gpt4ApiCallsResetTime = now;
        await user.save();
      } else if (
        user.gpt4ApiCallsCount >= GPT_4_MAX_API_CALLS_COUNT_PER_INTERVAL
      ) {
        console.log("reached the limit of 25 api calls");
        return res.status(429).json({
          errorCode: "gpt-4-api-calls-limit-reached",
          message:
            "You have reached the limit of 25 API calls per 3 hours to GPT-4 for your account.",
        });
      }
    }

    user.isGenerating = true;
    await user.save();

    const messages: BaseChatMessage[] = [];
    chatList.forEach((chat: Chat) => {
      if (chat.role === "AI") {
        messages.push(new AIChatMessage(chat.text));
      }

      if (chat.role === "Human") {
        messages.push(new HumanChatMessage(chat.text));
      }
    });

    const chat = new ChatOpenAI({
      temperature: 0,
      modelName: modelName,
      streaming: true,
      callbacks: [
        {
          handleLLMNewToken(token: string) {
            // process.stdout.write(token);
            res.write(
              JSON.stringify({
                data: { type: "token", data: token },
              })
            );
          },
        },
      ],
    });

    await chat.call([
      new SystemChatMessage(
        "You are AlYamamahGPT, a chatbot that can helps Al Yamamah University students manage their life in the university. You always are helpful, and you are always ready to help students. You shouldn't do anything unethical or illegal, but helping students is okay. You should explain anything they ask you about that is related to thier studies. You should also help them with their personal life, but you shouldn't do anything illegal or unethicial."
      ),
      ...messages,
    ]);

    user.increment("apiCallsCount", { by: 1 });
    if (modelName === "gpt-4") {
      user.increment("gpt4ApiCallsCount", { by: 1 });
    }
    user.isGenerating = false;
    await user.save();

    res.end();
  }
}

export default ChatController;
