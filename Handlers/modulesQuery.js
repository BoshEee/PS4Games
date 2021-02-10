const db = require("../database/connection");

function getAllGames(request, response) {
  db.query("SELECT title FROM games").then((result) => {
    const game = result.rows;
    const gameList = game.map((gam) => `<li>${gam.title}</li>`);
    console.log(gameList);
    response.writeHead(200, { "content-type": "text/html" });
    response.end(`<ul>${gameList.join("")}`);
  });
}

module.exports = getAllGames;
