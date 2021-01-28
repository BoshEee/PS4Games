const homeHandler = require("./Handlers/home");
const missingHandler = require("./Handlers/missing");
const publicHandler = require("./Handlers/public");
const searchHandler = require("./Handlers/search");

function router( request, response) {
    const url = request.url;
    if ( url === "/") {
        homeHandler(request, response);
    } else if (url.includes("public")) {
        publicHandler(request, response);
    } else if (url.includes("/ps4")) {
        searchHandler(request, response);
    } else {
        missingHandler(request, response);
    }
}

module.exports = router;