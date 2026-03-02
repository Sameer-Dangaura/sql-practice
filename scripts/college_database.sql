-- single line comments.
/* multiline commnets. */

-- Here we executed for each line.


create database college;	-- creating a college database.
use college;				-- using "college" database.

create table student (
rollno int primary key,
name varchar(50)
);							-- creates table called "student" under "college" database.

select * from student;		-- displays "student" table, if( use college ) is used.

insert into student
(rollno, name)
values
(1,"Karan"),
(2,"Arjun");				-- inserting two people infromation.

select * from student;		-- displays "student" table, if( use college ) is used.

insert into student values(3,"Shyam");	-- inserts single person information.

select * from student;		-- displays "student" table, if( use college ) is used.


/* Then our "college" database's "student" table will contain: 

rollno	name
1		Karan
2		Arjun
3		Shyam

*/