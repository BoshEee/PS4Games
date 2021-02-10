const db = require("../database/connection");
const fs = require("fs");
const path = require("path");


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


function showPosts(req, response) {

    db.query(
            `SELECT * FROM blog`

        )
        .then((result) => {
            response.end(JSON.stringify(result.rows));

        })
        .catch((e) => {
            response.writeHead(200, { "content-type": "text/html" });
            response.end(`<h1>Something went wrong \n ${e.message}</h1>`);
            console.log(e);
        });




}


module.exports = { showPosts, blogPage };