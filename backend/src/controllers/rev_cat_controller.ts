import { stringToSubscriptionTier } from "../models/subscription_tier";
import User from "../models/user";
import Controller from "./controller";
import { Request, Response, NextFunction } from "express";

class RevCatController extends Controller {
  public path: string = "/rev-cat";

  protected initRoutes(): void {
    this.router.use(this.revCatAuth);

    this.router.post("/", this.index.bind(this));
  }

  private revCatAuth(req: Request, res: Response, next: NextFunction): void {
    if (req.headers.authorization != process.env.REV_CAT_AUTH) {
      res.status(401).end();
      return;
    }

    next();
  }

  private async index(req: Request, res: Response) {
    console.log(req.body);

    const { event } = req.body;
    const { environment, type } = event;
    console.log(`got webhook of type: ${type}`);
    if (environment === "SANDBOX" && process.env.NODE_ENV === "production") {
      console.log("Sandbox webhook received successfully");
      return res.status(200).json(req.body).end();
    }

    switch (type) {
      case "TEST":
        console.log("Test webhook received successfully");
        return res.status(200).json(req.body).end();
      case "INITIAL_PURCHASE":
        console.log("Initial purchase webhook received successfully");
        const initialUser = await User.findOne({
          where: {
            username: event.app_user_id,
          },
        });
        if (initialUser == null) {
          console.log("user not found");
          return res
            .status(400)
            .json({
              error: "user not found",
            })
            .end();
        }

        initialUser.subscriptionTier = stringToSubscriptionTier(
          event.product_id
        );
        initialUser.subscriptionExpiration = new Date(event.expiration_at_ms);
        await initialUser.save();

        return res.status(200).json(req.body).end();

      case "RENEWAL":
        console.log("Renewal webhook received successfully");
        const renewalUser = await User.findOne({
          where: {
            username: event.app_user_id,
          },
        });
        if (renewalUser == null) {
          console.log("user not found");
          return res
            .status(400)
            .json({
              error: "user not found",
            })
            .end();
        }

        renewalUser.subscriptionTier = stringToSubscriptionTier(
          event.product_id
        );
        renewalUser.subscriptionExpiration = new Date(event.expiration_at_ms);
        await renewalUser.save();

        return res.status(200).json(req.body).end();

      case "EXPIRATION":
        const expiredUser = await User.findOne({
          where: {
            username: event.app_user_id,
          },
        });
        if (expiredUser == null) {
          console.log("user not found");
          return res
            .status(400)
            .json({
              error: "user not found",
            })
            .end();
        }

        expiredUser.subscriptionTier = null;
        expiredUser.subscriptionExpiration = null;
        await expiredUser.save();

        return res.status(200).json(req.body).end();

      case "CANCELLATION":
      case "UNCANCELLATION":
      case "NON_RENEWING_PURCHASE":
      case "SUBSCRIPTION_PAUSED":
      case "BILLING_ISSUE":
      case "PRODUCT_CHANGE":
      case "TRANSFER":
      default:
        return res
          .status(400)
          .json({
            error: `unhandled or invalid webhook type: ${type}`,
          })
          .end();
    }
  }
}

export default RevCatController;
