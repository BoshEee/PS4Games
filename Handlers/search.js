const db = require("../database/connection");
const missingHandler = require("./missing");

function autoComplete(req, response) {
  const params = new URLSearchParams(req.url.split("?")[1]);
  const gameName = params.get("name");
  console.log("lct " + gameName);
  db.query(`SELECT title FROM games WHERE title ILIKE $1 || '%' `, [gameName])
    .then((result) => {
      console.log("result " + JSON.stringify(result.rows));
      response.end(JSON.stringify(result.rows));
    })
    .catch((e) => {
      missingHandler(req, response);
      console.log("Error at search handler");
    });
}

module.exports = autoComplete;
