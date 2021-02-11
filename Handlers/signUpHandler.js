const fs = require("fs");
const path = require("path");
const db = require("../database/connection");


function signUpHandler(request, response) {
    const filePath = path.join(__dirname, "..", "public", "signUp.html");
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

function createUser(request, response) {

    let body = "";
    request.on("data", chunk => (body += chunk));
    request.on("end", () => {
        const searchParams = new URLSearchParams(body);
        const data = Object.fromEntries(searchParams);
        const values = [data.user_name, data.user_pass];
        return db.query(
            "INSERT INTO users(user_name, user_pass) VALUES($1, $2)",
            values
        )

        .then(() => {
                response.writeHead(302, { location: "/" });
                response.end();
            })
            .catch(error => {
                console.log(error);
                response.writeHead(500, { "content-type": "text/html" });
                response.end(`<h1>Something went wrong saving your data</h1>`);
            });
    });
}

module.exports = { signUpHandler, createUser };