const db = require("../database/connection");

function autoComplete(req, response) {
    const params = new URLSearchParams(req.url.split("?")[1]);
    const gameName = params.get("name");

    db.query(
            `SELECT title FROM games WHERE title LIKE $1 || '%' `, [gameName]

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

module.exports = autoComplete;