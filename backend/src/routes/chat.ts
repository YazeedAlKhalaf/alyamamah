import { Router } from "../deps.ts";

const chatRouter = new Router({
  prefix: "/chat",
});

chatRouter.get("/", (ctx) => {
  ctx.response.body = "this is chat route!";
});

export { chatRouter };
