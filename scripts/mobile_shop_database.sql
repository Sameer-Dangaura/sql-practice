/*  Here, we gonna practice model question. 
*/

CREATE DATABASE mobile_shop;
USE mobile_shop;


-- creating customer table:
CREATE TABLE customer(
Cno INT PRIMARY KEY,
Cname VARCHAR(50),
Caddress VARCHAR(50),
Ccontact INT 
);

INSERT INTO customer
(Cno, Cname, Caddress, Ccontact)
VALUES
(1, "Ram", "mnr", 9801111111),
(2, "Sameer", "Daiji", 9802222222),
(3, "Dipak", "Dhangadi", 9803333333),
(4, "Pawan", "Dodhara", 9804444444);

SELECT * FROM customer;


-- creating product table:
CREATE TABLE product(
Pid INT PRIMARY KEY,
Pname VARCHAR(50),
price INT NOT NULL,
quantity INT
);

INSERT INTO product
(Pid, Pname, price, quantity)
VALUES
(101, "Dell laptop", 100000, 4),
(102, "Apple mobile", 80000, 3),
(103, "Watch", 500, 3);

SELECT * FROM product;


-- creating purchase table:
CREATE TABLE purchase(
Cno INT,
FOREIGN KEY (Cno) REFERENCES customer(Cno)
ON DELETE CASCADE
ON UPDATE CASCADE,

Pid INT,
FOREIGN KEY (Pid) REFERENCES product(Pid)
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT INTO purchase
(Cno, Pid)
VALUES
(1, 101),
(1, 102),
(1, 103),
(2, 101),
(3, 102),
(4, 103);

SELECT * FROM purchase;


-- a) Find the names of all products having price greater than 1000.
SELECT Pname FROM product 
WHERE price > 1000;


-- b) Find the name of those customers who purchased Dell Laptop
-- ans:
-- Method-1: using Pid:
-- At 1st select all:
SELECT * FROM purchase			
INNER JOIN customer
ON purchase.Cno = customer.Cno
WHERE Pid = 101;

-- now, find name only:
SELECT Cname FROM purchase
INNER JOIN customer
ON purchase.Cno = customer.Cno
WHERE Pid = 101;

-- Method-2: using Pname:
-- alternate way: This is the actual way the examineer wanted:
SELECT * FROM customer
NATURAL JOIN purchase 		-- for 'NATURAL JOIN' ON and condition is not needed as INNER JOIN
NATURAL JOIN product		-- for more about NATURAL JOIN you can visit GFGs. 
WHERE Pname = "Dell Laptop";

-- for name only:
SELECT Cname FROM customer
NATURAL JOIN purchase 
NATURAL JOIN product
WHERE Pname = "Dell Laptop";




-- c) Find the total number of products purchased by customer ‘Ram’
-- ans:
-- Method-1: using Cno:
SELECT COUNT(Pid) FROM purchase
WHERE Cno = 1;

-- Method-2: using Cname:
-- Actual way what the examineer wanted:
-- step-1:
SELECT Cno FROM customer
WHERE Cname = "Ram";
-- step-2:
SELECT COUNT(Pid)
FROM purchase
WHERE Cno IN (
			SELECT Cno FROM customer
			WHERE Cname = "Ram");


-- d) Increase price of all products by 5%
SET SQL_SAFE_UPDATES = 0;

UPDATE product 
SET price = price + price * 0.05;

SELECT * FROM product;


-- e) Find total price of Apple Mobiles.
-- Method-1: using Pid:
SELECT SUM(quantity*price) AS Total_price
FROM product
WHERE Pid = 102;

-- Method-2: using Pname:
-- This is the actual way the examineer wanted:
SELECT SUM(price * quantity) 
FROM product
WHERE Pname = "Apple Mobile";

