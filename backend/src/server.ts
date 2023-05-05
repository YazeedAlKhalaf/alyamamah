import { Application } from "./deps.ts";
import { chatRouter } from "./routes/chat.ts";

const app = new Application();

app.use(chatRouter.routes());
app.use((ctx) => {
  ctx.response.body = "Hello world!";
});

const port = parseInt(Deno.env.get("PORT") || "8000", 10);
console.log(`🚀 Server listening on port: ${port}`);
await app.listen({ port: port });
