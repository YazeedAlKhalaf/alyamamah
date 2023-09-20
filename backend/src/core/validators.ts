import * as expressValidator from "express-validator";

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

  private fcmTokenValidator = expressValidator
    .body("fcmToken")
    .optional()
    .isString()
    .isLength({ max: 500 });

  static validateLogin(): Array<expressValidator.ValidationChain> {
    const validators = new Validators();

    return [
      validators.usernameValidator,
      validators.passwordValidator,
      validators.fcmTokenValidator,
    ];
  }

  private semesterValidator = expressValidator
    .body("semester")
    .notEmpty()
    .isString()
    .isLength({ min: 5, max: 5 });

  private sectionsValidator = expressValidator
    .body("sections")
    .notEmpty()
    .isArray()
    .isLength({ max: 20 });

  static validateSyncChats(): Array<expressValidator.ValidationChain> {
    const validators = new Validators();

    return [validators.semesterValidator, validators.sectionsValidator];
  }
}

export default Validators;
