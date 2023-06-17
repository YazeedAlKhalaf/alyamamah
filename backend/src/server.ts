import App from "./core/app";
import express from "express";
import dotenv from "dotenv";
import * as unleash from "unleash-server";

import AuthController from "./controllers/auth_controller";
import ChatController from "./controllers/chat_controller";
import RevCatController from "./controllers/rev_cat_controller";

dotenv.config();

// App - the main server
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

// Unleash - feature flagging server
unleash
  .start({
    db: {
      ssl: false,
      host: process.env.UNLEASH_DB_HOST as string,
      port: (process.env.UNLEASH_DB_PORT ?? 5432) as number,
      database: process.env.UNLEASH_DB_NAME as string,
      user: process.env.UNLEASH_DB_USER as string,
      password: process.env.UNLEASH_DB_PASSWORD as string,
    },
    server: {
      port: 4242,
    },
  })
  .then((unleash) => {
    console.log(
      `Unleash started on https://localhost:${unleash.app.get("port")}`
    );
  })
  .catch((error) => {
    console.error("Unable to start Unleash:", error);
  });
