/* Here we gonna perform some SQL Sub queries: */
-- -> SQL Subquery or Inner query or a Nested query is a query within another SQL query. 
-- -> It involves 2 select statements. 

-- ->There are 3 ways to write subquery: 
-- 1) SELECT  2) FROM  3) WHERE

CREATE DATABASE  iit1_college;
USE iit1_college;

CREATE TABLE student(
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);


INSERT INTO student 
(rollno, name, marks, grade, city)
VALUES
(101, "Anil", 78, "C", "Pune"),
(102, "Bhumika", 93, "A", "Mumbai"),
(103, "Chetan", 85, "B", "Mumbai"),
(104, "Dhruv", 96, "A", "Delhi"),
(105, "Emanuel", 12, "F", "Delhi"),
(106, "Farah", 82, "B", "Delhi");

SELECT * FROM student;



/* Q1. Get names of all students who scored more than class average? */
-- ans: 
-- method-1: without using SQL subquery:

-- step-1: Find the avg of the class:
SELECT AVG(marks) 
FROM student;
-- we got avg marks: 74.3333

-- step-2: Find the names of students with marks > avg
SELECT name, marks
FROM student
WHERE marks > 74.333;


-- method-2: using SQL subquery:  --> which is dynamic. 
SELECT name as stu_name, marks
FROM student
WHERE marks > (SELECT AVG(marks) FROM student);




/* Q2. Find the names of all students with even roll numbers? */
-- ans:
-- method-1: without using SQL subquery:

-- step-1: Find the even roll numbers
SELECT rollno 
FROM student
WHERE rollno % 2 = 0;
/* Displays:
102
104
106

*/

-- step-2: Find the names of students with even roll no
SELECT name 
FROM student 
WHERE rollno IN (102, 104, 106);


-- method-2: using SQL subquery:
SELECT name 
FROM student
WHERE rollno IN (SELECT rollno FROM student WHERE rollno % 2 = 0);

-- above query without using subquery that means only using WHERE clause:
SELECT name 
FROM student
WHERE rollno % 2 = 0;




/* Q3. Find the max marks from the students of Delhi? */
-- ans:
-- method-1: using sql subquery using    FROM method:
SELECT MAX(marks), city
FROM (SELECT * FROM student WHERE city = "Delhi") AS temp; -- alias is mendatory using this method;

-- method-2: without using sql subquery:
SELECT city, MAX(marks)
FROM student
WHERE city = "Delhi";

--  can we select name also with above query?
-- ans: 
/*
No, you cannot directly select name with the above query because name is not part of an aggregate function or the GROUP BY clause.
 If you want to select the name of the student(s) with the highest marks in Delhi, you can achieve this by using a subquery to find 
 the maximum marks first, and then retrieving the student(s) who have that mark.
*/
SELECT name, marks, city
FROM student
WHERE city = "Delhi" AND marks = (SELECT MAX(marks) FROM student WHERE city = "Delhi");
/* 
Displays:

Dhruv	96	Delhi

*/

