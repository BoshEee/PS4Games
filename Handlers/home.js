const path = require("path");
const fs = require("fs");
const missingHandler = require("./missing");
const { getAllGames } = require("../database/modules");

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

function gamesHome(request, response) {
  getAllGames()
    .then((result) => {
      response.writeHead(200, { "content-type": "application/json" });
      console.log(result);
      response.write(JSON.stringify(result));
      response.end();
    })
    .catch((error) => {
      response.writeHead(200, { "content-type": "text/html" });
      response.end(`<h1>Something went wrong \n ${error.message}</h1>`);
      console.log(error);
    });
}

module.exports = { homeHandler, gamesHome };
