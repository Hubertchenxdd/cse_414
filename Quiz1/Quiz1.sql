-- Q1.1

CREATE TABLE Books (
  isbn INT PRIMARY KEY,
  title VARCHAR(50),
  author VARCHAR(50),
  genre VARCHAR(50),
  publisher VARCHAR(50)
);

CREATE TABLE Members (
  id INT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE Lending (
  isbn INT REFERENCES Books,
  id INT REFERENCES Members,
  checkout DATETIME,
  returned DATETIME,
  PRIMARY KEY (isbn, id, checkout)
);


-- Q1.2

SELECT b.title, m.name
  FROM Books b, Members m, Lending l
 WHERE b.isbn = l.isbn AND
       m.id = l.id AND
       l.returned IS NULL
 ORDER BY m.name, b.title;

-- Q1.3

SELECT b.title, m.name, count(*) as cnt
  FROM Books b, Members m, Lending l
 WHERE b.isbn = l.isbn AND
       m.id = l.id
 GROUP BY b.title, m.id, m.name
HAVING cnt > 1;


-- Q1.4

SELECT b.genre, count(l.checkout) as cnt
  FROM Books b
  LEFT OUTER JOIN Lending l
    ON b.isbn = l.isbn
 GROUP BY b.genre
 ORDER BY cnt DESC;


-- Q1.5
SELECT DISTINCT m.id, m.name
  FROM Members m
 WHERE m.id in (SELECT l1.id
                  FROM Books b1, Lending l1
                 WHERE b1.isbn = l1.isbn AND
                       b1.title = 'Leaves of Grass') AND
       m.id in (SELECT l2.id
                  FROM Books b2, Lending l2
                 WHERE b2.isbn = l2.isbn AND
                       b2.title = 'Harmonium.');
