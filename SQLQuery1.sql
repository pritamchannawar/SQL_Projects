
/* Joins Examples: */


/*1 - List the names of students along with the course ID of the courses that they taught */
select name, course_idfrom  student, takeswhere student.ID = takes.ID

select name, course_idfrom student join takes on student.ID = takes.ID


/* Left Outer Joins Examples: 
 List the course_id, title, dept_name, credits, prereq_id*/

select course.course_id, title, dept_name, prereq.prereq_id 
from course left outer join prereq  
on course.course_id = prereq.course_id

/* Right Outer Joins Examples: 
 List the course_id, title, dept_name, credits, prereq_id*/
select course.course_id, title, dept_name, prereq.prereq_id 
from course right outer join prereq  
on course.course_id = prereq.course_id

/* Full Outer Joins Examples: 
 List the course_id, title, dept_name, credits, prereq_id*/
select course.course_id, title, dept_name, prereq.prereq_id 
from course full outer join prereq  
on course.course_id = prereq.course_id

/* Full Inner Joins Examples: 
 List the course_id, title, dept_name, credits, prereq_id*/
 select course.course_id, title, dept_name, prereq.prereq_id , course.course_id 
 from course inner join prereq 
 on course.course_id = prereq.course_id

 /* Views Examples: 
 Creating a view on instructor table*/

create view instructor_view as
	select ID, name, dept_name
	from instructor

 /* Views Examples: 
 Querying View to get the name of the faculty who works in Biology Department*/
select name
from faculty
where dept_name = 'Biology'

 /* Views Examples: 
 Creating a view by Querying a table to get the Department total salary*/

 create view departments_total_salary(dept_name, total_salary) as
 select dept_name, sum (salary)
 from instructor
 group by dept_name;

 select * from departments_total_salary

 /* Views Examples: 
 Creating and Querying View to get the course.course_id, sec_id, building, room_number for physics dept of fall 2007*/

 create view physics_fall_2007 as
 select course.course_id, sec_id, building, room_number
 from course, section
 where course.course_id = section.course_id
		and course.dept_name = 'Physics' 
		and section.semester = 'Fall'
		and section.year = 2007

select * from physics_fall_2007

/* Views Examples: 
 Creating and Querying View on a view*/
 create view physics_fall_2007_lamberton as    
 select course_id, room_number    
 from physics_fall_2007    
 where building= 'Lamberton';

select * from physics_fall_2007_lamberton


select * from course
select * from section
/* Views Examples: 
INSERTING DATA IN View */
create view course_view as
select course_id, credits 
from course

select * from course_view

insert into course_view values('102', 3)
select * from course

/* Commit and Rollback : insert records and commit and then we will rollback */
BEGIN TRANSACTION

insert into course_view values('102', 3)
insert into course_view values('103', 3)

Commit

select * from course_view

BEGIN TRANSACTION

delete from course 
where course_id = '102'

rollback;

select * from course_view

/* Integrity Constraints : CHECK 
Altering table to 'student' to add new column 'age' and a contraint to make sure students age > 18 */
ALTER TABLE student 
add age numeric(2,0)
check (age > 18)

insert into student values('81885', 'John', null, 96, 19);

/* This line of code will give error as age < 18*/
insert into student values('81886', 'David', null, 96, 17);

/* Creating user defined data type with length of 5 whole part and 3 decimal places*/

create type dbo.fee from numeric(5,3)


create table fee_details
	(ID			varchar(5), 
	 paid_fee fee
	);

insert into fee_details values ('AB', 18);

select * from fee_details

/* Index Creation : In Below example we are creating index  on student ID of student table*/

create index studentID_index on student(ID)

/* Authorizations */
/*User login creation */

/* Create role */

create role faculty


