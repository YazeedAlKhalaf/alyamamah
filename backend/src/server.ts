import App from "./core/app";
import express from "express";
import dotenv from "dotenv";

import AuthController from "./controllers/auth_controller";
import ChatController from "./controllers/chat_controller";
import RevCatController from "./controllers/rev_cat_controller";

dotenv.config();

const app = new App({
  port: 3000,
  middlewares: [express.json(), express.urlencoded({ extended: true })],
  controllers: [
    new AuthController(),
    new ChatController(),
    new RevCatController(),
  ],
});

app.listen();
