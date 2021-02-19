-- 1.

CREATE TABLE mrFrumbleData (
  name VARCHAR(50),
  discount VARCHAR(50),
  month VARCHAR(50),
  price INT
);


-- 2.

-- First FD: month --> discount
-- discount changes along with month when viewing the result
SELECT month, discount
FROM mrFrumbleData
ORDER BY month, discount;

-- Secong FD: name --> price
-- price changes along with name when viewing the result
SELECT name, price
FROM mrFrumbleData
ORDER BY name, price;


-- FD that doesn;t exist: name --> discount
-- We can easily see from the top 12 rows, name "bar1" has three different kinds of discounts.
SELECT name, discount
FROM mrFrumbleData
ORDER BY name, discount;

-- 3.
/* BCNF
R(name, discount, month, price)

month --> discount (bad FD)
R1(name, price, month)
R2(month, discount)

name --> price (bad FD)
R2(month, discount)
R3(name, month)
R4(name, price)
*/

CREATE TABLE NameMonth (
  name VARCHAR(50),
  month VARCHAR(50),
  PRIMARY KEY (name, month)
);

CREATE TABLE MonthDiscount (
  month VARCHAR(50) REFERENCES NameMonth(month),
  discount VARCHAR(50),
  PRIMARY KEY (month)
);

CREATE TABLE NamePrice (
  name VARCHAR(50) REFERENCES NameMonth(name),
  price INT,
  PRIMARY KEY (name)
);

-- 4.
INSERT INTO NameMonth (name, month)
SELECT name, month
FROM mrFrumbleData
ORDER BY name, month;

INSERT INTO MonthDiscount (month, discount)
SELECT month, discount
FROM mrFrumbleData
GROUP BY month, discount;

INSERT INTO NamePrice (name, price)
SELECT name, price
FROM mrFrumbleData
GROUP BY name, price;

SELECT count(*) FROM NameMonth; -- count = 426
SELECT count(*) FROM MonthDiscount; -- count = 12
SELECT count(*) FROM NamePrice; -- count = 36
