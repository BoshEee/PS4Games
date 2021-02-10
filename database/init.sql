BEGIN;
/* DROP TABLE IF EXISTS users, bolg_posts CASCADE; */

CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  user_name VARCHAR(255) NOT NULL,
  user_pass VARCHAR(255) NOT NULL,
  role VARCHAR(255)
);

CREATE TABLE games (
    game_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genres VARCHAR(255),
    price VARCHAR,
    release_date DATE,
    rate DECIMAL,
    poster VARCHAR,
    screenshots TEXT []
);

CREATE TABLE blog (
    blog_id SERIAL PRIMARY KEY,
    /* CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES users(user_id), */
    user_id integer REFERENCES users(user_id),
    blog_title VARCHAR(255),
    blog_dec VARCHAR(255),
    comments TEXT,
    tags TEXT
);

CREATE TABLE comments (
    comment_id SERIAL PRIMARY KEY,
    user_id integer REFERENCES users(user_id),
    game_id integer REFERENCES games(game_id),
    comment_text TEXT
);


COMMIT;