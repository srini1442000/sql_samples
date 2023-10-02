

use AdventureWorks2022

----------Case Study--------------

create table location_1 (location_1_ID int primary key, City varchar(30))

insert into location_1 values
(122, 'New York'),
(123, 'Dallas'),
(124, 'Chicago'),
(167, 'Boston')


create table department(Department_Id int primary key, Name varchar(30), location_1_ID int
foreign key references location_1(location_1_ID))

insert into department values
(10, 'Accounting', 122),
(20, 'Sales',124),
(30, 'Research', 123),
(40, 'Operations', 167)

select * from department

create table Job (Job_ID int primary key, Designation varchar(30))

insert into job values 
(667, 'Clerk'),
(668, 'Staff'),
(669, 'Analyst'),
(670, 'Sales Person'),
(671, 'Manager'),
(672, 'President')

select * from job

create table employee(employee_id int primary key, last_name varchar(30), first_name varchar(30),
middle_name varchar(30), job_id int foreign key references job(job_id), manager_id int, hire_date date, salary int,
comm int, department_id int foreign key references department(department_id))




insert into employee values 
(7369, 'SMITH', 'JOHN', 'Q', 667, 7902, '1984/12/17', 800, NULL, 20),
(7499, 'ALLEN', 'KEVIN', 'J', 670, 7698, '1985/02/20', 1600, 300, 30),
(7505, 'DOYLE', 'JEAN', 'K', 671, 7839, '1985/04/04', 2850 ,NULL ,30),
(7506, 'DENNIS', 'LYNN', 'S', 671, 7839, '1985/05/15' ,2750, NULL, 30),
(7507, 'BAKER', 'LESLIE', 'D', 671, 7839, '1985/06/10', 2200, NULL, 40),
(7521, 'WARK', 'CYNTHIA', 'D', 670, 7698, '1985/06/20', 1250, 500, 30)

select * from employee

select * from location_1

select * from employee

select * from department

select * from job


--Simple Queries:

--1. List all the employee details.

select * from employee

--2. List all the department details.

select * from department

--3. List all job details. 

select * from Job

--4. List all the location_1s.

select * from location_1

--5. List out the First Name, Last Name, Salary, Commission for all Employees.

select first_name,last_name,salary,comm
from employee

--6. List out the Employee ID, Last Name, Department ID for all employees and alias
--Employee ID as "ID of the Employee", Last Name as "Name of theEmployee", Department ID as "Dep_id".

select employee_id as [ID OF THE EMP],last_name as [NAME OF THE EMP] ,department_id as 'dept_id'
from employee

--7. List out the annual salary of the employees with their names only. 

select concat(First_name , ' ' , middle_name ,  ' ' , last_name) as names ,(salary*12) as [ annual salary]
from employee

--WHERE Condition:

--1. List the details about "Smith".

select * from employee
where last_name='SMITH'

--2. List out the employees who are working in department 20.

Select * from employee
where department_id=20

--3. List out the employees who are earning salaries between 2000 and 3500.

select * from employee
where salary between 2000 and 3500

--4. List out the employees who are working in department 10 or 20.

select * from employee
where department_id in (10,20)

--or

select * from employee
where department_id=10 or department_id=20

--5. Find out the employees who are not working in department 10 or 30.

select * from employee
where department_id NOT IN (10,30)


--6. List out the employees whose name starts with 'S'.

select * from employee
where  last_name like 'S%'

--7. List out the employees whose name starts with 'S' and ends with'H'.

select * from employee
where last_name LIKE 'S%H'

--8. List out the employees whose name length is 4 and start with 'S'. 

select * from employee
where last_name like 'S%'
and len(last_name)=5

--or

select * from employee
where last_name like 's____'

--9. List out employees who are working in department 30 and drawsalaries more than 2000.

select * from employee
where department_id=30 and salary>2000

--10. List out the employees who are not receiving commission.

SELECT * FROM employee
WHERE comm IS null

--Order By 

--1. List out the Employee ID and Last Name in ascending order based on the Employee ID. 
SELECT employee_id,last_name
FROM employee
ORDER BY employee_id



--2. List out the Employee ID and Name in descending order based on salary.
SELECT *
FROM employee
ORDER BY salary ,FIRST_NAME DESC


--3. List out the employee details according to their Last Name in ascending-order.

SELECT * FROM employee
ORDER BY last_name 


--4. List out the employee details according to their Last Name
----in ascending order and then Department ID in descending order


SELECT * FROM employee
ORDER BY last_name asc ,department_id DESC

SELECT * FROM employee
ORDER BY last_name DESC



--GROUP BY and HAVING Clause:

--1. How many employees are in different departments in the organization?

SELECT department_id,COUNT(employee_id) AS COUNT_DEP
FROM employee
GROUP BY department_id

SELECT * FROM employee

--2. List out the department wise maximum salary, minimumsalary and average salary of the employees. 

SELECT  department_id,MAX(SALARY) AS [MAX SALARY],MIN(SALARY) AS [MIN SALARY],AVG(SALARY) AS [AVG SALARY] 
FROM employee
GROUP BY department_id



--3. List out the job wise maximum salary, minimum salary and average salary of the employees. 

select job_id, max(salary) as [max sal], min(salary) as [min sal], avg(salary) as [avg sal]
from EMPLOYEE
group by job_id

--4. List out the number of employees who joined each month in ascending order.

SELECT DATENAME(MONTH,HIRE_DATE) AS MONTHS,COUNT(EMPLOYEE_ID) AS [NO OF EMP]
FROM employee
GROUP BY DATENAME(MONTH,HIRE_DATE)


--5. List out the number of employees for each month and year in
--ascending order based on the year and month. 


SELECT YEAR(HIRE_DATE) AS YEAR,DATENAME(MONTH,HIRE_DATE) AS MONTHS,COUNT(EMPLOYEE_ID) AS [NO OF EMP]
FROM employee
GROUP BY DATENAME(MONTH,HIRE_DATE),YEAR(HIRE_DATE)
ORDER by  DATENAME(MONTH,HIRE_DATE),YEAR(HIRE_DATE)

--6. List out the Department ID having at least four employees. 

SELECT department_id
FROM employee
GROUP BY department_id
HAVING COUNT(EMPLOYEE_ID)>=4

--7. How many employees joined in the month of APRIL?

SELECT COUNT(EMPLOYEE_ID) AS [EMP COUNT] ,dATENAME(MONTH,hire_date) AS [MONTH]
FROM employee
GROUP BY dATENAME(MONTH,hire_date)
HAVING dATENAME(MONTH,hire_date)='APRIL'


--8. How many employees joined in the month of APRIL,MAY?

SELECT * FROM employee

SELECT COUNT(EMPLOYEE_ID) AS [EMP COUNT] ,MONTH(HIRE_DATE) AS [MONTH]
FROM employee
GROUP BY MONTH(hire_date)
HAVING MONTH(HIRE_DATE) IN (4,5)


--9. How many employees joined in 1985?

SELECT COUNT(EMPLOYEE_ID) AS [EMP COUNT] ,YEAR(HIRE_DATE) AS [YEAR]
FROM employee
GROUP BY YEAR(HIRE_DATE)
HAVING YEAR(HIRE_DATE) = '1985'

--10. How many employees joined each month in 1985?

select  count(employee_id) as [ no. of employee] ,
datename(month, hire_date) as [ joining month],
year(hire_date) as [ joining year]
from employee 
group by datename(month, hire_date),year(hire_date)
having year(hire_date) = 1985 


--11. How many employees joined in March 1985?

select  count(employee_id) as [ no. of employee] ,
datename(month, hire_date) as [ joining month],
year(hire_date) as [ joining year]
from employee 
group by datename(month, hire_date),year(hire_date)
having year(hire_date) = 1985  AND datename(month, hire_date)= 'MARCH'

--12. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?

select department_id,count(employee_id)  from employee
where YEAR(hire_date)=1985 and datename(month,hire_date)='june'
group by department_id
having count(employee_id) >= 1


--Joins:


--1. List out employees with their department names.

select employee.first_name,employee.last_name,employee.middle_name,department.Name as department_name from employee
inner join department on department.Department_Id=employee.department_id

--2. Display employees with their designations.

select employee.first_name,employee.last_name,employee.middle_name,job.Designation from employee
inner join job on job.Job_ID=employee.job_id

--3. Display the employees with their department names and regional groups.
select employee.first_name,employee.last_name,employee.middle_name,department.Name as department_name,location_1.City from employee
inner join department on department.Department_Id=employee.department_id
inner join location_1 on location_1.location_1_ID=department.Locationss_ID


--4. How many employees are working in different departments? Display with
--department names.
select count(*) as no_of_employees,department.Name from employee
inner join department on department.Department_Id=employee.department_id
group by department.Name

--5. How many employees are working in the sales department?
select count(*) as no_of_employees,department.Name from employee
inner join department on department.Department_Id=employee.department_id
 where department.name='sales'
 group by department.Name

--6. Which is the department having greater than or equal to 5
--employees? Display the department names in ascending
--order.
select count(*) as no_of_employees,department.Name from employee
inner join department on department.Department_Id=employee.department_id
group by department.Name
having count(*)>5
order by no_of_employees

--7. How many jobs are there in the organization? Display with designations.


select count(*),Designation from Job
inner join employee on employee.job_id=Job.Job_ID
group by Designation
--8. How many employees a re working in "New York"?

select city ,count(*) [no of employee] from employee
inner join department on department.Department_Id=employee.department_id
inner join location_1 on location_1.location_1_ID=department.Locationss_ID

group by city 
having City='new york'



--9. Display the employee details with salary grades. Use conditional statement to create a grade column.
SELECT *,
CASE
	WHEN salary between 1 and 1000 THEN 'A'
    WHEN salary between 1000 and 2000 THEN 'B'
    WHEN salary between 2000 and 3000 THEN 'C'
    ELSE 'F'
END AS Grade
FROM employee
order by salary 

--10. List out the number of employees grade wise. Use conditional statementto create a grade column.

SELECT count(*) as employees,
CASE
	WHEN salary between 1 and 1000 THEN 'A'
    WHEN salary between 1000 and 2000 THEN 'B'
    WHEN salary between 2000 and 3000 THEN 'C'
    ELSE 'F'
END AS Grade

FROM employee
group by 
	CASE
	WHEN salary between 1 and 1000 THEN 'A'
    WHEN salary between 1000 and 2000 THEN 'B'
    WHEN salary between 2000 and 3000 THEN 'C'
    ELSE 'F'
END  
order by Grade desc




--11. Display the employee salary grades and the number of employees
--between 2000 to 5000 range of salary.


SELECT * ,
CASE
	WHEN salary between 1 and 1000 THEN 'A'
    WHEN salary between 1000 and 2000 THEN 'B'
    WHEN salary between 2000 and 3000 THEN 'C'
    ELSE 'F'
END AS Grade

FROM employee
where salary between 2000 and 5000
order by Grade




--12. Display all employees in sales or operation departments.

select * from employee
inner join department on department.Department_Id=employee.department_id
where department.Name= 'sales' or department.Name= 'operations'



--SET Operators:


select * from location_1

select * from employee

select * from department

select * from job
--1. List out the distinct jobs in sales and accounting departments.

SELECT Designation
      FROM JOB WHERE JOB_ID IN(SELECT JOB_ID FROM EMPLOYEE
      WHERE DEPARTMENT_ID=(SELECT DEPARTMENT_ID FROM DEPARTMENT
	  WHERE NAME='SALES'))
      UNION
      SELECT Designation
      FROM JOB WHERE JOB_ID IN(SELECT JOB_ID FROM EMPLOYEE
	  WHERE DEPARTMENT_ID=(SELECT DEPARTMENT_ID FROM DEPARTMENT      
	  WHERE NAME='accounting'))
	 
--2. List out all the jobs in sales and accounting departments.

SELECT Designation
      FROM JOB WHERE JOB_ID IN(SELECT JOB_ID FROM EMPLOYEE
      WHERE DEPARTMENT_ID=(SELECT DEPARTMENT_ID FROM DEPARTMENT
	  WHERE NAME='SALES'))
      UNION all
      SELECT Designation
      FROM JOB WHERE JOB_ID IN(SELECT JOB_ID FROM EMPLOYEE
	  WHERE DEPARTMENT_ID=(SELECT DEPARTMENT_ID FROM DEPARTMENT      
	  WHERE NAME='accounting'))
--3. List out the common jobs in research and accounting
--departments in ascending order.


SELECT Designation
      FROM JOB WHERE JOB_ID IN(SELECT JOB_ID FROM EMPLOYEE
      WHERE DEPARTMENT_ID=(SELECT DEPARTMENT_ID FROM DEPARTMENT
	  WHERE NAME='SALES'))
      intersect
      SELECT Designation
      FROM JOB WHERE JOB_ID IN(SELECT JOB_ID FROM EMPLOYEE
	  WHERE DEPARTMENT_ID=(SELECT DEPARTMENT_ID FROM DEPARTMENT      
	  WHERE NAME='accounting'))








--Subqueries:


select * from location_1

select * from employee

select * from department

select * from job
--1. Display the employees list who got the maximum salary.
SELECT * FROM EMPLOYEE
WHERE SALARY IN (SELECT MAX(SALARY) FROM EMPLOYEE
                 WHERE SALARY=(SELECT MAX(SALARY) FROM EMPLOYEE))
--2. Display the employees who are working in the sales department.
  SELECT * FROM EMPLOYEE
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM DEPARTMENT
                        WHERE NAME='SALES')

--3. Display the employees who are working as 'Clerk'.
SELECT * FROM EMPLOYEE
 WHERE JOB_ID IN (SELECT JOB_ID FROM JOB
                  WHERE Designation='CLERK')



--4. Display the list of employees who are living in "New York".
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT_ID IN(SELECT DEPARTMENT_ID FROM DEPARTMENT
            WHERE Locationss_ID IN (SELECT LOCATION_1_ID FROM location_1
                            WHERE city='new york'))


--5. Find out the number of employees working in the sales department.
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM DEPARTMENT
                                    WHERE NAME='SALES')




--6. Update the salaries of employees who are working as clerks on the basis of 10%.

UPDATE EMPLOYEE SET SALARY=(SALARY+SALARY*10/100)
WHERE JOB_ID IN(SELECT JOB_ID FROM JOB
                WHERE Designation='CLERK')





--7. Delete the employees who are working in the accounting department.

DELETE FROM EMPLOYEE
WHERE DEPARTMENT_ID IN(SELECT DEPARTMENT_ID FROM DEPARTMENT
                       WHERE NAME='ACCOUNTING')





--8. Display the second highest salary drawing employee details.

SELECT * FROM EMPLOYEE
WHERE SALARY IN(SELECT MAX(SALARY) FROM EMPLOYEE
                WHERE SALARY <(SELECT MAX(SALARY) FROM EMPLOYEE))




--9. Display the nth highest salary drawing employee details.

SELECT A.SALARY FROM EMPLOYEE A
WHERE (SELECT COUNT(DISTINCT(B.SALARY)) FROM EMPLOYEE B
             WHERE A.SALARY<B.SALARY )IN(1)
			 --or--
SELECT * FROM(
SELECT employee.first_name, salary, DENSE_RANK() 
over(ORDER BY salary DESC) AS ranking FROM employee) AS k
WHERE ranking=1;

--10. List out the employees who earn more than every employee in department 30.
 SELECT * FROM EMPLOYEE
WHERE SALARY>all(SELECT min(SALARY) FROM EMPLOYEE
                 WHERE DEPARTMENT_ID=30)



--11. List out the employees who earn more than the lowest salary in department.

 SELECT * FROM EMPLOYEE
WHERE SALARY>ANY(SELECT MIN(SALARY) FROM EMPLOYEE)

 

--12. Find out which department has no employees.

  SELECT DEPARTMENT_ID,NAME FROM DEPARTMENT
WHERE DEPARTMENT_ID NOT IN(SELECT DEPARTMENT_ID FROM EMPLOYEE)



--13. Find out the employees who earn greater than the average salary for
--their department.

SELECT * FROM EMPLOYEE 
WHERE SALARY>(SELECT AVG(SALARY) FROM EMPLOYEE
                    WHERE DEPARTMENT_ID=employee.DEPARTMENT_ID
              GROUP BY DEPARTMENT_ID)




