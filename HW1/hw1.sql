-- Homework 1

-- Q2.1
CREATE TABLE Edges(
  Source INT,
  Destination INT);

-- Q2.2
insert into Edges
  values
    (10,5),
    (6,25),
    (1,3),
    (4,4);

-- Q2.3
SELECT *
  FROM Edges;

-- Q2.4
SELECT Source
  FROM Edges;

-- Q2.5
SELECT Source
  FROM Edges
  WHERE Source > Destination;

-- Q2.6
-- I do not get an error.
-- Most known SQL database engines other than SQLite uses static, rigid typing.
-- With static typing, the datatype of a value is determined by its container.
-- However, SQLite uses a more general dynamic type system.
-- The datatype of a value is associated with the value itself, not with its container.
-- Therefore, even though we insert a string instead of integer, we don't get an error.

-- Q3
CREATE TABLE MyRestaurants(
  Name VARCHAR(100),
  FoodType VARCHAR(100),
  Distance INT,
  Date VARCHAR(100),
  Preference INT);

-- Q4
insert into MyRestaurants
  values ('Ding Tea','Drinks', 5, '2021-01-05', 1);
insert into MyRestaurants
  values ('Korean Tofu House','Korean Food', 10, '2020-12-23', 1);
insert into MyRestaurants
  values ('Sizzling Pot King','Chinese Food', 35, '2021-01-03', 1);
insert into MyRestaurants
  values ('Xian Noodles','Chinese Food', 8, '2020-12-30', 0);
insert into MyRestaurants (Name, FoodType, Distance, Date)
  values ('Shake Shack','Anerican Food', 20, '2020-12-27');

-- Q5.1
.headers on
-- comma-seperated form
.separator ","
SELECT * FROM MyRestaurants;
-- delimited by "|"
.separator "|"
SELECT * FROM MyRestaurants;
-- column mode
.mode column
.width 15 15 15 15 15
SELECT * FROM MyRestaurants;

-- Q5.2
.headers off
.mode list
-- comma-seperated form
.separator ","
SELECT * FROM MyRestaurants;
-- delimited by "|"
.separator "|"
SELECT * FROM MyRestaurants;
-- column mode
.mode column
.width 15 15 15 15 15
SELECT * FROM MyRestaurants;

-- Q6
SELECT Name, Distance
  FROM MyRestaurants
  WHERE Distance <= 20
  ORDER BY Name;

-- Q7
SELECT Name
  FROM MyRestaurants
  WHERE Date < date('now', '-3 month')
    AND Preference = 1;

-- Q8
SELECT Name
  FROM MyRestaurants
  WHERE Distance <= 10;
