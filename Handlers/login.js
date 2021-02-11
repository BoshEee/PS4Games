const db = require("../database/connection");

function loginHandler(request, response) {
  let username = new URL(`http://${request.url}`).searchParams.get("user_name");
  let password = new URL(`http://${request.url}`).searchParams.get("user_pass");
  getuser(username, password)
    .then((user) => {
      if (user.rows.length > 0) {
        //if exsist user
        response.writeHead(200, { "content-type": "application/json" });
        response.end(JSON.stringify(user.rows));
      } else {
        //if not exist
        response.writeHead(404, { "content-type": "text/html" });
        response.end("<h1>Not Found</h1>");
      }
    })
    .catch((error) => {
      response.writeHead(500, { "content-type": "text/html" });
      response.end(`<h1>${error}</h1>`);
    });
}

function getuser(username, password) {
  return db.query(
    `select * from users where user_name='${username}' and user_pass='${password}';`
  );
}
module.exports = { loginHandler, getuser };
