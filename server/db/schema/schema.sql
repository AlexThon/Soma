DROP TABLE IF EXISTS institutions CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS specializations CASCADE;
DROP TABLE IF EXISTS questions CASCADE;
DROP TABLE IF EXISTS users_specializations CASCADE;

CREATE TABLE institutions (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  location VARCHAR(255) NOT NULL
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  picture VARCHAR(2000),
  mentor BOOLEAN NOT NULL,
  institution_id INTEGER REFERENCES institutions(id) ON DELETE CASCADE,
  bio VARCHAR(2000),
  last_active DATE
);

CREATE TABLE specializations (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  description VARCHAR(255)
);

CREATE TABLE questions (
  id SERIAL PRIMARY KEY NOT NULL,
    student_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    question VARCHAR(255) NOT NULL,
    answer VARCHAR(255) NOT NULL
);

CREATE TABLE users_specializations (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  specialization_id INTEGER REFERENCES specializations(id) ON DELETE CASCADE
 );