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

    const { chatList }: { chatList: Chat[] } = req.body;

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
    });

    const response = await chat.call([
      new SystemChatMessage(
        "You are AlYamamahGPT, a chatbot that can helps Al Yamamah University students manage their life in the university. You always are helpful, and you are always ready to help students. You shouldn't do anything unethical or illegal, but helping students is okay. You should explain anything they ask you about that is related to thier studies. You should also help them with their personal life, but you shouldn't do anything illegal or unethicial."
      ),
      ...messages,
    ]);

    res.json({
      chatList: [...chatList, <Chat>{ role: "AI", text: response.text }],
    });
  }
}

export default ChatController;
