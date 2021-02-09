BEGIN;

DROP TABLE IF EXISTS users, games, blog, comments, blog_posts CASCADE; 

CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  user_name VARCHAR(255) NOT NULL,
  user_pass VARCHAR(255) NOT NULL,
  role VARCHAR(255)
);

CREATE TABLE games (
    game_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genres TEXT [] NOT NULL,
    price INTEGER,
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

INSERT INTO users (user_name, user_pass, role) VALUES
  ('Khaled', 123421, 'user'),
  ('Bushra', 9876789, 'user'),
  ('May', 41114, 'user'),
  ('Jihad', 727272, 'user')
  
;

INSERT INTO games (title, genres, price, release_date, rate, poster, screenshots) VALUES
  ('The Last Of Us 2', '{"Action", "Adventure"}', '59', '06-19-2020', '7.5','https://cdn.europosters.eu/image/1300/posters/the-last-of-us-2-ellie-i76718.jpg','{"https://images.hive.blog/DQma2kAk1M1hQar7RrPafrgzvRDk8gdL4rBgm22vk5fcCBg/maxresdefault.jpg",
        "https://www.playstationlifestyle.net/assets/uploads/2020/04/The-last-of-us-part-2-new-screenshots-indefinite-delay-4.jpg",
        "https://i.imgur.com/IEs2DzP.jpg"}')
        
  
  
;

COMMIT;