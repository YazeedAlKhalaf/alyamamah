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

  static validateLogin(): Array<expressValidator.ValidationChain> {
    const validators = new Validators();

    return [validators.usernameValidator, validators.passwordValidator];
  }
}

export default Validators;
