
-- Here we will learn about: Foreign key and so on...

CREATE DATABASE school;
USE school;

CREATE TABLE department(	-- Table for department:
id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE teacher(		-- Table for teacher:
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES department(id)		-- making dept_id as a foreign key.
ON DELETE CASCADE	-- If any deletion happen to "department" table here also will be change. 
ON UPDATE CASCADE	-- If any updation happen to "department" table here also will be change.
);

/* DROP TABLE teacher;	 we did drop table since we used later:
ON DELETE CASCADE ON UPDATE CASCADE  after the table and data has been inserted.
So we again created(using DELETE and UPDATE CASCADE) and inserted. */ 

/* After this you can visit "school_database" model which we have created. 
To see how they are connected. */ 


-- let's now insert into "department" table:
INSERT INTO department 
VALUES
(101, "English"),
(102, "IT");

SELECT * FROM department;


-- let's insert into "teacher" table also:
INSERT INTO teacher
VALUES
(1, "Adam", 101),
(2, "Eve", 102);

SELECT * FROM teacher;


-- Now let's try to Update into "department" does it cascades or not into "teacher".
UPDATE department SET id = 103 WHERE id = 102;
-- Now chech:
SELECT * FROM teacher;
/* yes it does. 
1	Adam	101
2	Eve		103
*/

