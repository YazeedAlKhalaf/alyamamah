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

const FREE_TIER_MAX_API_CALLS = 5;

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

    const { chatList, token }: { chatList: Chat[]; token: string } = req.body;

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
        message: `Your subscription "${SubscriptionTier.alyamamahGPT.valueOf()}" has expired. Please renew your subscription to continue using the service.`,
      });
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
      modelName: "gpt-3.5-turbo",
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
    user.isGenerating = false;
    await user.save();

    res.end();
  }
}

export default ChatController;
