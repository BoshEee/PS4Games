const pg = require("pg");
const dotenv = require("dotenv");

dotenv.config();

let connectionString = process.env.DEV_DATABASE_URL;

if (process.env.NODE_ENV === "production") {
  connectionString = process.env.DATABASE_URL;
}

const db = new pg.Pool({
  connectionString,
  ssl: { rejectUnauthorized: false },
});

// db.query("SELECT * FROM USERS").then((result) => console.log(result.rows));

db.query("SELECT * FROM comments").then((result) => console.log(result.rows));

module.exports = db;
