import { Request, Response } from "express";
import Controller from "./controller";
import EdugateApiService from "../services/edugate_api_service";
import Validators from "../core/validators";
import * as expressValidator from "express-validator";
import Utils from "../core/utils";
import User from "../models/user";

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
    const validationResult = expressValidator.validationResult(req);
    if (!validationResult.isEmpty()) {
      return res.status(400).end();
    }

    const { username, password, fcmToken } = req.body;

    const shouldGiveUserJwt = await this.edugateApiService.checkUserCredentials(
      username,
      password
    );

    if (shouldGiveUserJwt) {
      const users = await User.findAll({
        where: {
          username: username,
        },
      });

      let user: User = users[0] || null;
      if (user == null) {
        user = await User.create({
          username: username,
          fcmToken: fcmToken,
        });
      }

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
