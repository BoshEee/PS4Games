const fs = require("fs");
const path = require("path");

function aboutHandler(request, response) {
  const filePath = path.join(__dirname, "..", "public", "about.html");
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

module.exports = aboutHandler;
