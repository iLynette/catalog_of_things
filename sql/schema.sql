CREATE DATABASE catalog_of_things;

CREATE TABLE label(
 id INTEGER GENERATED ,
 title VARCHAR(50),
 color VARCHAR(50),
 PRIMARY KEY(id)
);