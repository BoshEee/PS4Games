const db = require("../database/connection");
const missingHandler = require("./missing");

function gameInfo(req, response) {
  const params = new URLSearchParams(req.url.split("?")[1]);
  const gameName = params.get("name");
  console.log("lct " + gameName);
  db.query(`SELECT * FROM games WHERE title ILIKE $1 || '%' `, [gameName])
    .then((result) => {
      console.log("result " + JSON.stringify(result.rows));
      response.end(JSON.stringify(result.rows));
    })
    .catch((e) => {
      missingHandler(req, response);
      console.log("Error at gameInfo handler");
    });
}

module.exports = gameInfo;
