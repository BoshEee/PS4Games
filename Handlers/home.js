const path = require("path");
const fs = require("fs");
const missingHandler = require("./missing");
const db = require("../database/connection");

function homeHandler(request, response) {
  const filePath = path.join(__dirname, "..", "public", "index.html");
  fs.readFile(filePath, (error, file) => {
    if (error) {
      console.log(error);
      missingHandler(request, response);
    } else {
      response.writeHead(200, { "content-type": "text/html" });
      response.end(file);
    }
  });
}

function gamesHome(req, response) {
  db.query(`SELECT title,poster FROM games`)
    .then((result) => {
      response.end(JSON.stringify(result.rows));
    })
    .catch((e) => {
      missingHandler(req, response);
      console.log("Error at gameInfo handler");
    });
}

module.exports = { homeHandler, gamesHome };
