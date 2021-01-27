const fs = require("fs");

fs.readFile("./ps4api.json", "utf-8", (err, jsonString) => {
  if (err) {
    console.log(err);
  } else {
    const data = JSON.parse(jsonString);
    console.log(data.games[1].name);
  }
});
module.exports = searchHandler;
