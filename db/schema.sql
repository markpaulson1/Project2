-- DROP DATABASE IF EXISTS newdads;
-- CREATE DATABASE newdads;
-- \c newdads
DROP TABLE IF EXISTS users, messages, comments;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  email VARCHAR NOT NULL,
  password VARCHAR NOT NULL,
  created_at TIMESTAMP NOT NULL
);


CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(id),
  topic VARCHAR NOT NULL,
  message VARCHAR NOT NULL,
  created_at TIMESTAMP NOT NULL
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  message_id INTEGER NOT NULL REFERENCES messages(id),
  user_id INTEGER NOT NULL REFERENCES users(id),
  comment VARCHAR NOT NULL,
  created_at TIMESTAMP NOT NULL
);