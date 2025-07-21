const { Sequelize, DataTypes } = require("sequelize");
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

const Book = sequelize.define("Book", {
  title: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  author: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  bookAuthor: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  year: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  isbn: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true,
  },
  dateRead: {
    type: DataTypes.DATE,
    allowNull: true,
  },
});

try {
  sequelize.authenticate();
  console.log("Connection has been established successfully.");
  sequelize.sync({ force: true }).then(() => {
    console.log("Database & tables created!");
  });
} catch (error) {
  console.error("Unable to connect to the database:", error);
}
