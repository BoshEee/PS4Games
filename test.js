const router = require("./router");
const homeHandler = require("./Handlers/home");

const test = require("tape");
const supertest = require("supertest");

test("Initialise", t => {
    let num = 2;
    t.equal(num, 2, "should return 2");
    t.end();
});

test("Home route returns status code 200", t => {
    supertest(router)
    .get("/")
    .expect(200)
    .end((err, res) => {
        t.error(err);
        t.equal(res.status, 200);
        t.end();
    });
});



