-- if you are a beginner to this, do visit at first "college" database for basic understanding.


-- creating a database for "facebook" company:


create database facebook;
use facebook;

create table employeeinfo(
id int primary key,
name varchar(50),
salary int 
);

select * from employeeinfo;

drop table employeeinfo;		-- droped "employeeinfo" named table.


create table employee(
id int primary key,
name varchar(50),
salary int 
);								-- created new table named as "employee".

select * from employee;

insert into employee
(id, name, salary)
values
(1, "Adam", 25000),
(2, "Bob", 30000),
(3, "Casey", 40000);

select * from employee;


/* Then our "facebook" database's "employee" table will contain:

id	name	salary
1	Adam	25000
2	Bob		30000
3	Casey	40000

*/