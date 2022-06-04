CREATE DATABASE catalog_of_things;

CREATE TABLE label(
 id INTEGER GENERATED ,
 title VARCHAR(50),
 color VARCHAR(50),
 PRIMARY KEY(id)
);

CREATE TABLE book(
  id INT GENERATED ALWAYS AS IDENTITY,
  publisher VARCHAR(50),
  cover_state VARCHAR(15),
  publish_date DATE,
  archived BOOLEAN,
  label_id  INT,
  FOREIGN KEY (label_id) REFERENCES label(id),
  PRIMARY KEY(id)
);

CREATE TABLE genre(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  PRIMARY KEY(id)
);

CREATE TABLE music_album(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  on_spotify BOOLEAN,
  publish_date DATE,
  archived BOOLEAN,
  PRIMARY KEY(id)
);

CREATE TABLE author (
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE game (
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    publish_date DATE,
    archived BOOLEAN,
    multiplayer BOOLEAN,
    last_played_at DATE,
    author_id INTEGER,
    CONSTRAINT fkey_author FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE CASCADE,
    PRIMARY KEY(id)
);

CREATE TABLE source (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  movie_name VARCHAR(255),
  PRIMARY KEY(id)
)

CREATE TABLE movie (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  movie_name VARCHAR(255),
  publish_date DATE,
  silet BOOLEAN,
  approved BOOLEAN
  source_id INTEGER,
  CONSTRAINT fkey_source FOREIGN KEY (source_id) REFERENCES source(id) ON DELETE CASCADE
  PRIMARY KEY(id)
)