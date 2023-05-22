import { Request, Response } from "express";
import Controller from "./controller";
import EdugateApiService from "../services/edugate_api_service";
import Validators from "../core/validators";
import * as expressValidator from "express-validator";
import Utils from "../core/utils";

class AuthController extends Controller {
  public path: string = "/auth";

  private edugateApiService: EdugateApiService;

  constructor() {
    super();

    this.edugateApiService = new EdugateApiService(
      "https://edugate.yu.edu.sa/yu"
    );
  }

  protected initRoutes(): void {
    this.router.post(
      "/login",
      ...Validators.validateLogin(),
      this.login.bind(this)
    );
  }

  private async login(req: Request, res: Response) {
    // get username and password from body.
    const validationResult = expressValidator.validationResult(req);
    if (!validationResult.isEmpty()) {
      return res.status(400).end();
    }

    const { username, password } = req.body;
    const shouldGiveUserJwt = await this.edugateApiService.checkUserCredentials(
      username,
      password
    );

    if (shouldGiveUserJwt) {
      // make the jwt and return it.
      const jwt = Utils.generateJwtToken(username);
      res.status(200).json({ accessToken: jwt, message: null });
    } else {
      res.status(401).json({
        accessToken: null,
        message: "invalid username or password",
      });
    }
  }
}

export default AuthController;
