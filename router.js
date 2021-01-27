const homeHandler = require("./Handlers/home");
const missingHandler = require("./Handlers/missing");
const publicHandler = require("./Handlers/public");

function router( request, response) {
    const url = request.url;
    if ( url === "/") {
        homeHandler(request, response);
    } else if (url.includes("public")) {
        publicHandler(request, response);
    } else {
        missingHandler(request, response);
    }
}

module.exports = router;