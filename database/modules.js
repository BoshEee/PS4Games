const db = require("../database/connection");

function getAllGames() {
  return db.query(`SELECT title,poster FROM games`).then((result) => {
    result.rows;
  });
}

function newsFeed() {
  return db.query(`SELECT * FROM blog`).then((result) => {
    result.rows;
  });
}

module.exports = { getAllGames, newsFeed };
