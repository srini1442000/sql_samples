-assignment-5-

--1--
select *from orders
order by amount desc

--2--
create table employee_detailes1
(
emp_id int,
emp_name varchar(20),
emp_salary int)

 insert into employee_detailes1  values
 (1,'Faran',50000),
 (2,'Nadim',60000),
 (3,'Raja',45000),
 (4,'Rohit',70000),
 (5,'Sunil',80000)

 create table Employee_details2(Emp_id int,Emp_Name varchar(20),Emp_Salary int)
 
 insert into Employee_details2 values
 (1,'Aditya',45000),
 (2,'Anil',86000),
 (3,'Ishika',48600),
 (4,'Swetha',97000),
 (5,'Sunil',80000),
 (6,'Faran',50000)

 select * from employee_detailes1
 select * from Employee_details2

 --3--

 select * from employee_detailes1
 union all
 select * from Employee_details2


 --4--

 
 select * from employee_detailes1
 intersect
 select * from Employee_details2

 --5--

 
 select * from employee_detailes1
 except
 select * from Employee_details2