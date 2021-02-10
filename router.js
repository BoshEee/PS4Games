const homeHandler = require("./Handlers/home");
const missingHandler = require("./Handlers/missing");
const publicHandler = require("./Handlers/public");
const searchHandler = require("./Handlers/search");
const aboutHandler = require("./Handlers/aboutus");
const signUpHandler = require("./Handlers/signUpHandler");

const blogHandler = require("./Handlers/blog");


const gameInfo = require("./Handlers/gameInfo");


function router(request, response) {
  const url = request.url;

  if (url === "/") {
    homeHandler(request, response);
  } else if (url.includes("public")) {
    publicHandler(request, response);
  } else if (url.includes("/ps4")) {
    searchHandler(request, response);
  } else if (url.includes("/search")) {
    getByGenreHandler(request, response);
  } else if (url.includes("/signup") && request.method === "GET") {
    signUpHandler.signUpHandler(request, response);
  } else if (url.includes("/signup") && request.method === "POST") {
    signUpHandler.createUser(request, response);
  } else if (url.includes("about")) {
    aboutHandler(request, response);
  } else if (url.includes("/gameInfo") && request.method === "GET") {
    gameInfo.gameInfo(request, response);
  } else if (url.includes("/gameInfo") && request.method === "POST") {
    gameInfo.PostComment(request, response);
    }else if (url.includes("blog")) {
        blogHandler(request, response); }
  else {
    missingHandler(request, response);


}

module.exports = router;
