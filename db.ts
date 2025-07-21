const { Sequelize } = require("sequelize");
const mysql2 = require("mysql2");
require("dotenv").config();

const sequelize = new Sequelize({
  dialect: "mysql",
  dialectModule: mysql2,
  host: "localhost",
  port: 3306,
  username: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});

try {
  sequelize.authenticate();
  console.log("Connection has been established successfully.");
} catch (error) {
  console.error("Unable to connect to the database:", error);
}
