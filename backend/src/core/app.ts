import express, {
  Application,
  ErrorRequestHandler,
  RequestHandler,
} from "express";
import Controller from "../controllers/controller";
import rateLimit from "express-rate-limit";

class App {
  public app: Application;
  public port: number;

  constructor(appInit: {
    port: number;
    middlewares: Array<RequestHandler | ErrorRequestHandler>;
    controllers: Array<Controller>;
  }) {
    this.app = express();
    this.port = appInit.port;

    const apiLimiter = rateLimit({
      windowMs: 15 * 60 * 1000, // 15 minutes in milliseconds
      max: 100,
      message: "Too many requests from this IP, please try again later",
    });
    this.app.use(apiLimiter);

    this.middlewares(appInit.middlewares);
    this.routes(appInit.controllers);
  }

  public listen() {
    this.app.disable("x-powered-by");

    const _port = process.env.PORT || this.port;
    this.app.listen(_port, () => {
      console.log(`🚀 Server listening on: http://localhost:${_port}`);
    });
  }

  private middlewares(
    middlewares: Array<RequestHandler | ErrorRequestHandler>
  ) {
    middlewares.forEach((middleware: RequestHandler | ErrorRequestHandler) => {
      this.app.use(middleware);
    });
  }

  private routes(controllers: Array<Controller>) {
    controllers.forEach((controller: Controller) => {
      this.app.use(controller.path, controller.router);
    });
  }
}

export default App;
