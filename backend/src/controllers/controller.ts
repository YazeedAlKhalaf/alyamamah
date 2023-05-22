import { Router } from "express";

abstract class Controller {
  public abstract path: string;
  public router: Router;

  constructor() {
    this.router = Router();
    this.initRoutes();
  }

  protected abstract initRoutes(): void;
}

export default Controller;
