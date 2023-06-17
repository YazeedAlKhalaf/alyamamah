import {
  Model,
  DataTypes,
  InferAttributes,
  InferCreationAttributes,
  CreationOptional,
} from "sequelize";
import sequelize from "../core/database";
import SubscriptionTier from "./subscription_tier";

class User extends Model<InferAttributes<User>, InferCreationAttributes<User>> {
  declare id: CreationOptional<string>;
  declare username: string;
  declare apiCallsCount: CreationOptional<number>;
  declare gpt4ApiCallsCount: CreationOptional<number>;
  declare gpt4ApiCallsResetTime: CreationOptional<Date>;
  declare subscriptionTier: SubscriptionTier | null;
  declare subscriptionExpiration: Date | null;
  declare isGenerating: CreationOptional<boolean>;
  declare fcmToken: CreationOptional<string>;
}

User.init(
  {
    id: {
      type: DataTypes.UUID,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
    },
    username: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
    },
    apiCallsCount: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 0,
    },
    gpt4ApiCallsCount: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 0,
    },
    gpt4ApiCallsResetTime: {
      type: DataTypes.DATE,
      allowNull: true,
      defaultValue: new Date(),
    },
    subscriptionTier: {
      type: DataTypes.ENUM(...Object.values(SubscriptionTier)),
      allowNull: true,
    },
    subscriptionExpiration: {
      type: DataTypes.DATE,
      allowNull: true,
    },
    isGenerating: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
      defaultValue: false,
    },
    fcmToken: {
      type: DataTypes.STRING,
      allowNull: true,
    },
  },
  { sequelize, tableName: "users" }
);

export default User;
