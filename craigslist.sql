DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

-- USERS

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  location TEXT NOT NULL
);

INSERT INTO users
(name,location)
VALUES
  ('Chris','San Francisco'),
  ('Jenn','Detroit'),
  ('Nick','Paris');

-- POSTS

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users ON DELETE CASCADE,
  content TEXT NOT NULL
);

INSERT INTO posts
(user_id, content)
VALUES
  (1,'Selling bicycle'),
  (2,'Renting apartment'),
  (3,'Offering a job');

  -- CATEGORIES

CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  post_id INTEGER REFERENCES posts ON DELETE CASCADE,
  cat_name TEXT NOT NULL
);

INSERT INTO categories
(post_id, cat_name)
VALUES
  (1,'For sale'),
  (2,'For rent'),
  (3,'Hiring');