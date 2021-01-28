const fs = require("fs");
const path = require("path");

function searchHandler(req, response) {
    console.log(req.url);
  const filePath = path.join(__dirname, "..", "ps4api.json");
  fs.readFile(filePath, {encoding:"utf-8"}, (err, file) => {
    if (err) {
      console.log(err);
      response.writeHead(404, { "content-type": "text/html" });
      response.end("<h1> Not Found </h1>");
    } else {
      response.writeHead(200, { "content-type": "application/json" });
      response.end(JSON.stringify(file));
    }
  });
}

module.exports = searchHandler;

