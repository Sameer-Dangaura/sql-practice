/* Practice question:
Q. In the student table:
a) Change the name of column "name" to "full_name".
b) Delete all the students scored marks less than 80.
c) Delete the column for grades. 
*/

-- Here we gonna copy the data of "iit_college" database in "medical_college" database. 

CREATE DATABASE  medical_college;
USE medical_college;

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

-- a)
ALTER TABLE student CHANGE name full_name VARCHAR(50);
SELECT * FROM student;

-- b)
-- at first turn off the safe mode:
SET SQL_SAFE_UPDATES = 0;
DELETE FROM student WHERE marks < 80;
SELECT * FROM student;
/* Here we got:
102	Bhumika	93	A	Mumbai
103	Chetan	85	B	Mumbai
104	Dhruv	96	A	Delhi
106	Farah	82	B	Delhi
*/

-- c)
ALTER TABLE student DROP COLUMN grade;
SELECT * FROM student;
