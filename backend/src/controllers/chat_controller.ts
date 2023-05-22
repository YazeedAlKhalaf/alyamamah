import Controller from "./controller";
import { verifyToken } from "../middlewares/verify_token_middleware";

class ChatController extends Controller {
  public path: string = "/chat";

  protected initRoutes(): void {
    this.router.use(verifyToken);

    this.router.get("/", (req, res) => {
      res.send("Hello from chat controller, you are authenticated!");
    });
  }
}

export default ChatController;
