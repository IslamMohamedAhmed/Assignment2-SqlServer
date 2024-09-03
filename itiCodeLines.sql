


-- part 1 -- 1)	From The Previous Assignment insert at least 2 rows per table.

insert into course values 
('c++','3 month','c++ basics with OOP and DS',null),
('c','1 month','c basics',null),
('c#','1 month','c# basics',null)



insert into department values
('Prog','10/30/2010',null)



insert into department values
('graphics','10/30/2016',null),
('Network','10/30/2015',null)


insert into instructor values
('islam','cairo',500,10000,320.36,20),
('mohamed','alexandria',300,7000,120.36,30)

insert into student values
('Leon','Kennedy',30,'Berlin',20),
('Chris','Redfield',30,'Paris',30)


insert into course_instructor values
(1,2,35),
(2,1,49)

insert into stud_course values
(1,3,99),
(2,3,88)
insert into topic values ('data types'),('variables')


/*
2) Data Manipulation Language:

1.Insert your personal data to the student table as a new Student in department number 30.
*/

insert into student (FName,LName,age,Address,dep_id) values ('islam','mohamed',25,'shubra',30)

/*
2) Data Manipulation Language:

2.Insert Instructor with personal data of your friend as new Instructor in department number 30, Salary= 4000, but don’t enter any value for bonus.
*/

insert into instructor (name,Address,salary,hour_rate,depID) values ('mostafa','wael',10000,540.234,30)
update instructor 
set Address = 'shubra' 
where id = 4

/*
2) Data Manipulation Language:

3.Upgrade Instructor salary by 20 % of its last value.
*/

update instructor
set bonus  = .2*salary
where id = 4


update instructor
set bonus  =  0
where id = 4

update instructor 
set salary *= 1.2
where id = 4

/* part 1 end -----------------------------------------------------------------------------------------------------------*/

/*

part 2
1.	Display all the employees Data.

*/
-- 1st we change the query from iti to MyCompany
select * from Employee


/*

part 2
2.	Display the employee First name, last name, Salary and Department number
*/

select Fname, Lname, Salary, Dno
from Employee

/*

part 2
3.	Display all the projec 	ts names, locations and the department which is responsible for it.
*/

select p.Pname, p.Plocation, d.Dname
from Project p inner join Departments d
on d.Dnum = p.Dnum

/*

part 2
4.	If you know that the company policy is to pay an annual commission for each employee with specific percent equals 10% of his/her annual salary 
.Display each employee full name and his annual commission in an ANNUAL COMM column (alias).
*/

select Fname+' '+Lname as [Full Name] , Salary*.1 as [ANNUAL COMM]  --(10% annual commision)
from Employee


/*

part 2
5.	Display the employees Id, name who earns more than 1000 LE monthly.
*/
select SSN, Fname+' '+Lname as [Full Name]
from Employee
where Salary > 1000

/*

part 2
6.	Display the employees Id, name who earns more than 10000 LE annually.
*/
select SSN, Fname+' '+Lname as [Full Name]
from Employee
where Salary*12.1 > 10000   --(12 months + 10% annual commision)

/*

part 2
7.	Display the names and salaries of the female employees 
*/

select Fname+' '+Lname as [Full Name], Salary
from Employee
where Sex = 'F' 

/*

part 2
8.	Display each department id, name which is managed by a manager with id equals 968574. 
*/
select Dnum,Dname
from Departments
where MGRSSN = 968574
/*

part 2
9.	Display the ids, names and locations of  the projects which are controlled with department 10.
*/
select Pnumber,Pname,Plocation
from Project
where Dnum = 10

/* part 2 end ----------------------------------------------------------*/



/* Part 3 1st we need to restore the database */


/*

Part 3

1.	Get all instructors Names without repetition

*/

select distinct Ins_Name
from Instructor


/*

Part 3

2.	Display instructor Name and Department Name 
Note: display all the instructors if they are attached to a department or not

*/

select i.Ins_Name,d.Dept_Name 
from Instructor i left outer join Department d
on d.Dept_Id = i.Dept_Id



/*

Part 3
3.	Display student full name and the name of the course he is taking
For only courses which have a grade
*/
select s.St_Fname + ' ' + s.St_Lname as [Full Name], c.Crs_Name
from Student s,Stud_Course sc, Course c
where s.St_Id = sc.St_Id and  c.Crs_Id = sc.Crs_Id and sc.Grade is not null




/* part 3 end -------------------------------------- */

/* 
Part 4
1.	Display the Department id, name and id and the name of its manager.
*/
select d.Dnum,d.Dname,e.SSN,e.Fname
from Departments d inner join Employee e
on e.SSN = d.MGRSSN


/* 
Part 4
2.	Display the name of the departments and the name of the projects under its control.
*/

select d.Dname,p.Pname
from Project p inner join Departments d
on d.Dnum = p.Dnum

/* 
Part 4
3.	Display the full data about all the dependence associated with the name of the employee they depend on .
*/
select d.*,e.Fname+' '+e.Lname as [Emp Full Name]
from Dependent d inner join Employee e
on e.SSN = d.ESSN


/* 
Part 4
4.	Display the Id, name and location of the projects in Cairo or Alex city
*/
select Pnumber,Pname,Plocation
from Project
where City  in ('Alex','Cairo')

/* 
Part 4
5.	Display the Projects full data of the projects with a name starting with "a" letter.*/
select *
from Project
where Pname like 'a%'

/*
Part 4
6.	display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
*/
select *
from Employee e
where Dno = 30 and Salary>=1000 and Salary <=2000

/*
Part 4
7.Retrieve the names of all employees in department 10 who work more than or equal 10 hours per week on the "AL Rabwah" project.
*/
select e.Fname+' '+e.Lname as [Full Name]
from  Employee e inner join Works_for wf
on e.SSN = wf.ESSn inner join Project p
on p.Pnumber = wf.Pno where p.Pname = 'AL Rabwah' and e.Dno = 10


/*
Part 4
8.	Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name.
*/
select e.Fname+' '+e.Lname as [Full Name],p.Pname
from  Employee e inner join Works_for wf
on e.SSN = wf.ESSn inner join Project p
on p.Pnumber = wf.Pno
/*
Part 4
9.	For each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate.
*/
select p.Pname,d.Dname,e.Lname,e.Address,e.Bdate
from Project p inner join Departments d 
on p.Dnum = d.Dnum inner join Employee e
on d.MGRSSN = e.SSN where p.City = 'Cairo'










