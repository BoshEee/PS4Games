const fs = require("fs");
const path = require("path");
const db = require("../database/connection");

function blogPage(request, response) {
  const filePath = path.join(__dirname, "..", "public", "blog.html");
  fs.readFile(filePath, (error, file) => {
    if (error) {
      console.log(error);
      response.writeHead(404, { "content-type": "text/html" });
      response.end("<h1> Not Found </h1>");
    } else {
      response.writeHead(200, { "content-type": "text/html" });
      response.end(file);
    }
  });
}

function showPosts(request, response) {
  let body = "";
  request.on("data", (chunk) => (body += chunk));
  request.on("end", () => {
    return db
      .query("SELECT * FROM blog")

      .then((result) => {
        response.writeHead(200, { "content-type": "application/json" });
        response.end(JSON.stringify(result.rows));
      })
      .catch((error) => {
        console.log(error);
        response.writeHead(500, { "content-type": "text/html" });
        response.end(`<h1>WOOOOOOO</h1>`);
      });
  });
}

module.exports = { showPosts, blogPage };
