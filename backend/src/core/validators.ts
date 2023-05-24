import * as expressValidator from "express-validator";
import Chat from "../models/chat";

class Validators {
  private usernameValidator = expressValidator
    .body("username")
    .notEmpty()
    .isString()
    .isLength({ max: 100 });

  private passwordValidator = expressValidator
    .body("password")
    .notEmpty()
    .isString()
    .isLength({ max: 100 });

  static validateLogin(): Array<expressValidator.ValidationChain> {
    const validators = new Validators();

    return [validators.usernameValidator, validators.passwordValidator];
  }

  private chatListValidator = expressValidator
    .body("chatList")
    .notEmpty()
    .isArray()
    .isLength({ max: 100 })
    .custom((chatList: Chat[]) => {
      for (const chat of chatList) {
        if (
          typeof chat !== "object" ||
          !chat.hasOwnProperty("role") ||
          !chat.hasOwnProperty("text") ||
          (chat.role !== "AI" && chat.role !== "Human") ||
          typeof chat.text !== "string"
        ) {
          throw new Error(
            `Invalid chat object in list. Each chat object should be in the form {"role": "AI" | "Human", "text": "SOME_TEXT"}`
          );
        }
      }

      return true;
    });

  static validateChat(): Array<expressValidator.ValidationChain> {
    const validators = new Validators();

    return [validators.chatListValidator];
  }
}

export default Validators;
