
create database iit_college;
use iit_college;

create table student(
rollno int primary key,
name varchar(50),
marks int not null,
grade varchar(1),
city varchar(20)
);

insert into student 
(rollno, name, marks, grade, city)
values
(101, "Anil", 78, "C", "Pune"),
(102, "Bhumika", 93, "A", "Mumbai"),
(103, "Chetan", 85, "B", "Mumbai"),
(104, "Dhruv", 96, "A", "Delhi"),
(105, "Emanuel", 12, "F", "Delhi"),
(106, "Farah", 82, "B", "Delhi");

select * from student;	-- selecting all the fields available in table.

select name, marks from student;	-- selecting only name and marks from the table.

select city from student;	-- selecting all cities from the table.

select distinct city from student;	-- selecting distinct cities only from the table.


-- using where clause:
select * from student where marks > 80;	-- selecting all the fields using where marks > 80.

select * from student where city = "Mumbai"; -- selecting all the fields using where city = "Mumbai".

-- we can concatenate above both where clause:
select * from student where marks > 80 and city = "Mumbai";	-- using more operators in where clause.

select * from student where marks+10 > 100;	-- using more operators in where clause.


-- using limit clause:
select * from student where marks > 75 limit 3;

-- using order by clause:
select * from student order by city asc;

select * from student order by marks desc;

-- selecting only top 3 students:
select * from student order by marks desc limit 3;

-- selecting marks only:
select marks from student;

/* using aggregate function: */
-- 1: max
select max(marks) from student;

-- 2: min
select min(marks) from student;

-- 3: avg
select avg(marks) from student;

-- 4: count
select count(rollno) from student;


-- before using group by clause:
select city from student group by city;

-- group by clause:
select city, count(rollno) from student group by city;	/* it's easy to use group by clause:
we just |__________________________________________| need same to make group and use aggregate function.*/


select city, avg(marks) from student group by city;	-- average marks per city.



/* Task: write the query to find average marks in each city in ascending order? */
select city, avg(marks) from student group by city order by city asc;
--      |______________________________________|______________|


-- using group by clause to count student in each grade:
select grade, count(rollno) from student group by grade order by grade asc;
--       |__________________________________________|______________|


/* Having clause: */
-- we use having clause when we want to apply condition upon groups or where cannot use where clause.
-- Task: count number of students in each city where max marks cross 90.
select city, count(rollno) from student group by city having max(marks) > 90;

/* General order: 
SELECT column(s)
FROM table_name
WHERE condition
GROUP BY column(s)
HAVING condition
ORDERED BY column(s) ASC;
*/

-- WHERE ---> rows
-- HAVING ---> groups

-- e.g:
SELECT city FROM student WHERE grade = "A" GROUP BY city HAVING MAX(marks) > 93;
SELECT city, count(rollno) FROM student WHERE grade = "A" GROUP BY city HAVING MAX(marks) >= 93;



-- Table related queries: UPDATE -> to update existing rows
UPDATE student SET grade = "O" WHERE grade = "A";

SELECT * FROM student;	-- now check, is it updated or not.

-- Here, we are not able to update because safe mode is on i.e. set to 1. 
-- To update we need to off the safe mode.
SET SQL_SAFE_UPDATES = 0;
-- you can again on safe mode by setting to 1.

-- Now, try to update
UPDATE student SET grade = "O" WHERE grade = "A";	-- update each students grade="A" to "O". 
SELECT * FROM student;

-- let's assume "Emanuel" named person's marks is misscalculated and we need to update it to 92.
UPDATE student SET marks = 92, grade = "O" WHERE rollno = 105;
SELECT * FROM student;

/* Then "student" table looks like:

rollno name 	marks grade city
101		Anil	78		C	Pune
102		Bhumika	93		O	Mumbai
103		Chetan	85		B	Mumbai
104		Dhruv	96		O	Delhi
105		Emanuel	92		O	Delhi
106		Farah	82		B	Delhi
				
*/


/* let's assume that "iit_college" recognizes one mcq question has been given wrong and decided to increase 
 one marks per student: */
UPDATE student SET marks = marks + 1;
SELECT * FROM student;

/* Then "student" table looks like:

rollno name 	marks grade city
101		Anil	79	C	Pune
102		Bhumika	94	O	Mumbai
103		Chetan	86	B	Mumbai
104		Dhruv	97	O	Delhi
105		Emanuel	93	O	Delhi
106		Farah	83	B	Delhi
				
*/



-- Table related queries: DELETE -> to delete existing rows
-- ! Be careful while deleting data from database because once it deleted it cannot be recovered.
-- let's first of all insert another student's data:
INSERT INTO student values(107, "Bikram", 30, "F", "Chennai");
SELECT * FROM student;
-- Now delete it:
DELETE FROM student WHERE marks < 33;
SELECT * FROM student;

/* what will happen if we run this query: DELETE FROM student;    
: it will delete every data of the student table. 
So be careful while deleting... */ 



-- *>Table related queries: ALTER -> to change the schema  -> desing(columns,datatype,constraints)
-- i) ADD column  ii) DROP column  iii) RENAME table
-- iv) CHANGE column(rename) -> to change column name, or datatype of column
-- v) MODIFY column(modify datatype/constraint) -> 

-- ADD:
ALTER TABLE student ADD COLUMN age INT;
SELECT * FROM student;

-- DROP 
ALTER TABLE student DROP COLUMN age;	
SELECT * FROM student;

-- let's try to ADD column again:
ALTER TABLE student ADD COLUMN age INT NOT NULL DEFAULT 19;	-- we added age column. 
SELECT * FROM student;

-- now MODIFY it:
ALTER TABLE student MODIFY COLUMN age VARCHAR(2);	-- we modified datatype of age.
SELECT * FROM student;
-- Here we didnot saw any changes in table but it is modified on to the datatype only. 
-- let's try to insert some old person's data:
INSERT INTO student
(rollno, name, marks, age)
VALUES
(107, "Sujal", 59, "100");	 -- we got Error(: Data too long for 'age') Becoz we modified it. 

-- now CHANGE it: name "age" -> stu_age,  and datatype also. 
ALTER TABLE student CHANGE age stu_age INT;
-- now insert again previous person's data:
INSERT INTO student
(rollno, name, marks, stu_age)
VALUES
(107, "Sujal", 59, 100);	-- Done... 
SELECT * FROM student;

-- now DROP it:
ALTER TABLE student DROP COLUMN stu_age;
SELECT * FROM student;



-- *>Table related queries: TRUNCATE -> to delete table's all data 
-- Hope you understand the difference between the  TRUNCATE TABLE  and  DROP TABLE. 
-- TRUNCATE TABLE student -> deletes table's all data only.
-- DROP TABLE student -> deletes the whole table. 

