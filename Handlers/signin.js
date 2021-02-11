const path = require("path");
const fs = require("fs");
const missingHandler = require("./missing");

function signinHandler(request, response) {
  const filePath = path.join(__dirname, "..", "public", "login.html");
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

module.exports = signinHandler;
