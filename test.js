const router = require("./router");
const test = require("tape");
const supertest = require("supertest");

const nock = require("nock");

const firstTest = nock('https://ps4gamesapinodejs.herokuapp.com/')
    .get('/server.js')
    .reply(200, { id: '123ABC' })

nock('https://ps4gamesapinodejs.herokuapp.com')
    .get('/ps4')
    .reply(200, [{ name: 'Until' }])

test("let's Nock the status", t => {
    supertest(router)
        .get("/ps4/?name=Until&Dawn")
        .expect(200)
        .end((err, res) => {
            t.error(err);
            t.equal(res.status, 200);
            t.end();

        })
})


nock('https://ps4gamesapinodejs.herokuapp.com')
    .get('/ps4')
    .reply(200, [{ name: 'Until' }])

test("let's Nock the object", t => {
    supertest(router)
        .get("/ps4/?name=Until&Dawn")
        .expect(200)
        .end((err, res) => {
            t.error(err);
            // console.log(JSON.parse(res.text)[0].name);
            t.equal(JSON.parse(res.text)[0].name, "Until Dawn");
            t.end();

        })
})

// test("Initialise", t => {
//     let num = 2;
//     t.equal(num, 2, "should return 2");
//     t.end();
// });

// test("Home route returns status code 200", t => {
//     supertest(router)
//     .get("/")
//     .expect(200)
//     .end((err, res) => {
//         t.error(err);
//         t.equal(res.status, 200);
//         t.end();
//     });
// });