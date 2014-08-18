-- 
-- Created by SQL::Translator::Producer::SQLite
-- Created on Mon Jun 30 16:01:02 2014
-- 

;
BEGIN TRANSACTION;
--
-- Table: authors
--
CREATE TABLE authors (
  id INTEGER PRIMARY KEY NOT NULL,
  name varchar(255) NOT NULL
);
--
-- Table: books
--
CREATE TABLE books (
  id INTEGER PRIMARY KEY NOT NULL,
  author_id integer NOT NULL,
  title text NOT NULL,
  purchase_date datetime,
  FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE INDEX books_idx_author_id ON books (author_id);
COMMIT;
