import { Sequelize } from "sequelize";
import Utils from "./utils";
import dotenv from "dotenv";

dotenv.config();

const connectionUri = Utils.postgresConnectionUri(
  process.env.DB_USER as string,
  process.env.DB_PASSWORD as string,
  process.env.DB_HOST as string,
  process.env.DB_PORT as string,
  process.env.DB_NAME as string
);
const sequelize = new Sequelize(connectionUri);
sequelize.authenticate().then(() => {
  console.log("Connection has been established successfully.");
});

sequelize
  .authenticate()
  .then(() => {
    console.log("Connection has been established successfully.");
  })
  .catch((error) => {
    console.error("Unable to connect to the database:", error);
  });

sequelize
  .sync()
  .then(() => {
    console.log("Database synced successfully.");
  })
  .catch((error) => {
    console.error("Unable to sync the database:", error);
  });

export default sequelize;
