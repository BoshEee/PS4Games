const pg = require('pg');
let connectionString = 'postgres://userji:987654321@localhost:5432/jiba99'
if (process.env.NODE_ENV === 'production') {
    connectionString = process.env.DATABASE_URL;
}
const db = new pg.Pool({ connectionString });


db.query("SELECT * FROM USERS").then((result) => console.log(result));


module.exports = db;