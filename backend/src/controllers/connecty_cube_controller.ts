import { Request, Response } from "express";
import Controller from "./controller";
import Validators from "../core/validators";
import * as expressValidator from "express-validator";
import AdminConnectyCubeApiService from "../services/admin_connecty_cube_api_service";
import { verifyToken } from "../middlewares/verify_token_middleware";
import Utils, { JwtAudience } from "../core/utils";

class ConnectyCubeController extends Controller {
  public path: string = "/connecty-cube";

  private adminConnectyCubeApiService: AdminConnectyCubeApiService;

  constructor() {
    super();

    this.adminConnectyCubeApiService = new AdminConnectyCubeApiService(
      "https://admin.connectycube.com"
    );
  }

  protected initRoutes(): void {
    this.router.use(verifyToken);

    this.router.post(
      "/sync-chats",
      ...Validators.validateSyncChats(),
      this.syncChats.bind(this)
    );
  }

  private async syncChats(req: Request, res: Response) {
    const validationResult = expressValidator.validationResult(req);
    if (!validationResult.isEmpty()) {
      return res.status(400).json({
        error: validationResult,
      });
    }

    const {
      token,
      semester,
      sections,
    }: { token: string; semester: string; sections: string[] } = req.body;

    const username = Utils.getUsernameFromJwt(token, JwtAudience.alyamamah);
    if (username == null) {
      console.log("username is null");
      // This means the JWT token is invalid, or doesn't have a username.
      // The user shouldn't be able to reach this stage without a username.
      return res.status(500).end();
    }

    const occupantId = await this.adminConnectyCubeApiService.getIdByUsername(
      username
    );

    for (let idx = 0; idx < sections.length; idx++) {
      const section = sections[idx];
      const dialogName = `${semester}-${section}`;

      console.log("Checking if a group dialog exists for section", section);
      const dialogId = await this.adminConnectyCubeApiService.getDialogIdByName(
        dialogName
      );
      if (dialogId != null) {
        console.log("a group dialog already exists for section", section);
        console.log(
          `updating the group dialog with id ${dialogId} for section ${section}`
        );
        const didUpdate =
          await this.adminConnectyCubeApiService.updateGroupDialog(dialogId, [
            occupantId,
          ]);
        if (didUpdate) {
          console.log(
            `updated the group dialog with id ${dialogId} for section ${section}`
          );
        } else {
          console.log(
            `failed to update the group dialog with id ${dialogId} for section ${section}`
          );
        }
      } else {
        console.log("a group dialog doesn't exist for section", section);
        console.log("creating a group dialog for section", section);
        const didCreate =
          await this.adminConnectyCubeApiService.createGroupDialog(dialogName, [
            occupantId,
          ]);
        if (didCreate) {
          console.log("created a group dialog for section", section);
        } else {
          console.log("failed to create a group dialog for section", section);
        }
      }
    }

    res.status(200).end();
  }
}

export default ConnectyCubeController;
