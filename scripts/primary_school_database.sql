
CREATE DATABASE primary_school;
USE primary_school;

CREATE TABLE student(
student_id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO student
(student_id, name)
VALUES
(101, "Adam"),
(102, "Bob"),
(103, "Casey");

SELECT * FROM student;

CREATE TABLE course(
id INT PRIMARY KEY,
course VARCHAR(50)
);

INSERT INTO course
(id, course)
VALUES
(102, "English"),
(105, "Math"),
(103, "Science"),
(107, "Computer Science");

SELECT * FROM course;


/* > Joins in SQL:
-> Join is used to combine rows from two or more tables, based on a related column between them. 
Example: |
----------
Employee 						Salary
-----------------				----------------
| id | name		|				| id | salary  |
|---------------|				|--------------|
|101 | Jack     |				|102 | 24,000  |
|102 | Rome     |				|103 | 30,000  |
-----------------				----------------
Here, we can perform any type of join. 
Let's say we perform INNER JOIN, the we got:

Result for Employee.id = Salary.id
---------------------------------
| id | name		| id  | salary  |
|---------------|-----|---------|
|102 |   Rome   | 102 | 24,000  |
---------------------------------
*/

-- 1) Inner Join -> returns records that have matching values in both tables. 
SELECT * FROM student 
INNER JOIN course
ON student.student_id = course.id;
--           |_________________|   is the Join condition...

-- we can use alias(alternate name) also with above:
SELECT * FROM student as s
INNER JOIN course as c
ON s.student_id = c.id;


-- 2) Left Join 
SELECT * FROM student
LEFT JOIN course 
ON student.student_id = course.id;

-- 3) Right Join
SELECT * FROM student 
RIGHT JOIN course
ON student.student_id = course.id;

/* 4) FULL Join -> we cannot perform directly FULL JOIN. we have to use UNION between 
LEFT JOIN and RIGHT JOIN.   */
SELECT * FROM student
LEFT JOIN course
ON student.student_id = course.id
UNION
SELECT * FROM student
RIGHT JOIN course 
ON student.student_id = course.id;

