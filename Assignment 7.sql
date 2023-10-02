use Assignment

select * from [dbo].[Studies]

select * from [dbo].[Software]

select * from [dbo].[Programmer]

--******************************************************************************************************************************************************
--Answer 1: Find out the selling cost average for packages developed in Pascal. 

select avg(Dcost) from Software
where DEVELOPIN = 'Pascal'

--******************************************************************************************************************************************************
--Answer 2: Display the names and ages of all programmers. 

alter table Programmer
add Age int

select DATEDIFF(year, DOB, (Current_timestamp)) as Age
from Programmer

update Programmer
set Age = 57 where PNAME = 'Anand' 

update Programmer
set Age = 59 where PNAME = 'Altaf' 

update Programmer
set Age = 63 where PNAME = 'Juliana' 

update Programmer
set Age = 55 where PNAME = 'Kamala' 

update Programmer
set Age = 53 where PNAME = 'Mary' 

update Programmer
set Age = 38 where PNAME = 'Nelson' 

update Programmer
set Age = 58 where PNAME = 'Pattrick' 

update Programmer
set Age = 58 where PNAME = 'Qadir' 

update Programmer
set Age = 56 where PNAME = 'Ramesh' 

update Programmer
set Age = 56 where PNAME = 'Rebecca' 

update Programmer
set Age = 53 where PNAME = 'Remitha' 

update Programmer
set Age = 54 where PNAME = 'Revathi' 

update Programmer
set Age = 58 where PNAME = 'Vijaya' 

select PNAME, Age from Programmer

--******************************************************************************************************************************************************
--Answer 3: Display the names of those who have done the DAP Course. 

select PNAME from Studies
where COURSE = 'DAP'

--******************************************************************************************************************************************************
--Answer 4: Display the names and date of birth of all programmers born in January. 

select PNAME, DOB from Programmer
where MONTH(DOB) = 1

--******************************************************************************************************************************************************
--Answer 5: What is the highest number of copies sold by a package? 

select Top 1 * from Software 

--******************************************************************************************************************************************************
--Answer 6: Display lowest course fee. 

select MIN(COURSE_FEE) as Lowest_Fee from Studies 

--******************************************************************************************************************************************************
--Answer 7: How many programmers have done the PGDCA Course?

Select PNAME from Studies where COURSE = 'PGDCA'

--******************************************************************************************************************************************************
--Answer 8: How much revenue has been earned through sales of packages developed in C? 

select sum(scost * sold) as Total_Revenue
from software
where developin = 'c'

--******************************************************************************************************************************************************
--Answer 9: Display the details of the software developed by Ramesh. 

select * from software
where PNAME = 'Ramesh'

--******************************************************************************************************************************************************
--Answer 10: How many programmers studied at Sabhari? 

select count(Pname) from Studies
where INSTITUTE = 'Sabhari'

--******************************************************************************************************************************************************
--Answer 11: Display details of packages whose sales crossed the 2000 mark.

select * from software
where (DCOST * sold) > 2000

--******************************************************************************************************************************************************
--Answer 12: Display the details of packages for which development costs have been recovered. 

select * from software
where (SCOST * sold) >= DCOST

--******************************************************************************************************************************************************
--Answer 13: What is the cost of the costliest software development in Basic? 

select Max(DCOST) as 'Costliest' from Software
where DEVELOPIN = 'Basic'

--******************************************************************************************************************************************************
--Answer 14: How many packages have been developed in dBase? 

select count(DEVELOPIN) as 'No_of_Packages' from Software
where DEVELOPIN = 'Dbase'

--******************************************************************************************************************************************************
--Answer 15: How many programmers studied in Pragathi? 

select count(Pname) from Studies
where INSTITUTE = 'Pragathi'

--******************************************************************************************************************************************************
--Answer 16: How many programmers paid 5000 to 10000 for their course? 

select count(Pname) as 'No_of_Programmers' from Studies
where COURSE_FEE between 5000 and 10000

--******************************************************************************************************************************************************
--Answer 17: What is the average course fee? 

select avg(COURSE_FEE) as 'Average_Fee' from Studies

--******************************************************************************************************************************************************
--Answer 18: Display the details of the programmers knowing C. 

select * from Programmer
where PROF1 = 'C' or PROF2 = 'C'

--******************************************************************************************************************************************************
--Answer 19: How many programmers know either COBOL or Pascal? 

select count(Pname) as 'Programmers' from Programmer
where PROF1 = 'Cobol' or PROF2 = 'Pascal' 
or 
PROF1 = 'Pascal' or PROF2 = 'Cobol'

--******************************************************************************************************************************************************
--Answer 20: How many programmers know either COBOL or Pascal? 

SELECT DISTINCT COUNT(pname) 
AS num_programmers
FROM programmer
WHERE prof1 != 'PASCAL' 
AND prof1 != 'C' 
AND prof2 != 'PASCAL'
AND prof2 != 'C'

--************************************************************************************************************************************************
--Answer 21: How old is the oldest male programmer? 

SELECT MAX(DATEDIFF(YEAR, DOB,Current_timestamp)) 
AS OLDEST_MALE_PROGRAMMER 
FROM PROGRAMMER 
WHERE GENDER = 'M'

--************************************************************************************************************************************************
--Answer 22: What is the average age of female programmers? 

SELECT Avg(DATEDIFF(YEAR, DOB, Current_timestamp)) 
AS Average_Female_Age 
FROM PROGRAMMER 
WHERE GENDER = 'F'

--************************************************************************************************************************************************
--Answer 23: Calculate the experience in years for each programmer and display with their names in descending order. 

Select PNAME,
Datediff(Year, DOJ, Getdate()) 
AS Experience
From Programmer
Order by Experience Desc;

--************************************************************************************************************************************************
--Answer 24: Who are the programmers who celebrate their birthdays during the current month? 

SELECT PNAME
FROM programmer
WHERE Month(DOB) = '08'

--************************************************************************************************************************************************
--Answer 25: How many female programmers are there? 

select count(PNAME) from Programmer where Gender = 'F'

--************************************************************************************************************************************************
--Answer 26: What are the languages studied by male programmers? 

select prof1 from programmer where gender = 'M' 
union 
select prof2 from programmer where gender = 'M'

--************************************************************************************************************************************************
--Answer 27: What is the average salary? 

select avg(SALARY) from Programmer 

--************************************************************************************************************************************************
--Answer 28: How many people draw a salary between 2000 to 4000? 

select count(Pname) as 'No_of_Programmers' from Programmer
where SALARY between 2000 and 4000

--************************************************************************************************************************************************
--Answer 29: Display the details of those who don’t know Clipper, COBOL or Pascal.

SELECT DISTINCT PNAME
FROM programmer
WHERE prof1 != 'PASCAL' 
AND prof1 != 'Clipper'
AND prof1 != 'Cobol'
AND prof2 != 'PASCAL'
AND prof2 != 'Clipper'
AND prof2 != 'Cobol'

--************************************************************************************************************************************************
--Answer 30: Display the cost of packages developed by each programmer. 

SELECT PName, Sum(DCOST) as 'Package_Cost' FROM Software
group by PNAME

--************************************************************************************************************************************************
--Answer 31: Display the sales value of the packages developed by each programmer. 

SELECT PName, Sum(Scost * Sold) as Sales_Value FROM Software
group by PNAME

--************************************************************************************************************************************************
--Answer 32: Display the number of packages sold by each programmer. 

SELECT PName, Sum(Scost * Sold) as Sales_Value FROM Software
group by PNAME

--************************************************************************************************************************************************
--Answer 33: Display the sales cost of the packages developed by each programmer language wise. 

SELECT DEVELOPIN, Sum(Scost) as Total_Scost FROM Software
group by Developin

--************************************************************************************************************************************************
--Answer 34: Display each language name with the average development cost, average selling cost and average price per copy. 

SELECT DEVELOPIN, Avg(Scost) as Avg_Scost, Avg(Dcost) as Avg_Dcost, 
AVG(CASE 
WHEN sold = 0 THEN 0 
ELSE Scost/Sold End) as Avg_SalesCost_PerCopy 
FROM Software
group by Developin

--************************************************************************************************************************************************
--Answer 35: Display each programmer’s name and the costliest and cheapest packages developed by him or her.

SELECT PNAME, MAX(DCOST) as Costliest, MIN(DCOST) as Cheapest FROM SOFTWARE 
GROUP BY PNAME

--************************************************************************************************************************************************
--Answer 36: Display each institute’s name with the number of courses and the average cost per course. 

select Institute, count(Course) as 'No_of_Courses', 
avg(Course_Fee) as Average_Cost_Per_Course from Studies
group by INSTITUTE

--************************************************************************************************************************************************
--Answer 37: Display each institute’s name with the number of students. 38. Display names of male and female programmers along with their gender. 

Select Institute, count(Pname) as 'No_of_Students' from studies
group by INSTITUTE

 --************************************************************************************************************************************************
--Answer 38: Display names of male and female programmers along with their gender.

SELECT PNAME, GENDER FROM programmer
ORDER BY gender

 --************************************************************************************************************************************************
--Answer 39: Display the name of programmers and their packages. 

select PNAME,SALARY
from Programmer
Order by PNAME

 --************************************************************************************************************************************************
--Answer 40: Display the number of packages in each language except C and C++. 

select DEVELOPIN, count(Developin) as 'No_of_Packages' from Software
where DEVELOPIN not in ('C', 'C++')
group by DEVELOPIN

 --************************************************************************************************************************************************
--Answer 41: Display the number of packages in each language for which development cost is less than 1000. 

SELECT COUNT(SOLD), DEVELOPIN
FROM software
WHERE DCOST < 1000
GROUP BY DEVELOPIN;

 --************************************************************************************************************************************************
--Answer 42: Display the average difference between SCOST and DCOST for each package.

select TITLE, Avg(Scost - Dcost) as 'Avg_difference' from Software
group by TITLE

 --************************************************************************************************************************************************
--Answer 43: Display the total SCOST, DCOST and the amount to be recovered for each programmer whose cost has not yet been recovered.

select pname, scost, dcost, dcost - (scost * sold)
as Amount_to_be_Recovered
from software
where dcost - (scost * sold) > 0

 --************************************************************************************************************************************************
--Answer 44: Display the highest, lowest and average salaries for those earning more than 2000. 

select Pname, max(salary) as 'Highest_Salary',
			  min(Salary) as 'Lowest_Salary',
	          avg(Salary) as 'Avergae_Salary' 
from Programmer
where Salary > 2000 
group by Pname

 --************************************************************************************************************************************************
--Answer 45: Who is the highest paid C programmer? 

select top 1 Pname, Salary from Programmer
where PROF1 = 'C' or Prof2 = 'C'
order by Salary desc

 --************************************************************************************************************************************************
--Answer 46: Who is the highest paid female COBOL programmer? 

select top 1 Pname, Salary from Programmer
where Gender = 'F' and PROF1 = 'Cobol' or Prof2 = 'Cobol' 
order by Salary desc

 --************************************************************************************************************************************************
--Answer 47: Display the names of the highest paid programmers for each language. 

WITH CTC AS (
  SELECT PNAME, SALARY, PROF1 AS PROF FROM programmer
  UNION 
  SELECT PNAME, SALARY, PROF2 FROM programmer
)
SELECT p1.PNAME, p1.PROF, p1.SALARY
FROM CTC as p1
LEFT JOIN CTC as 
p2
  ON p1.PROF = p2.PROF AND p1.SALARY < p2.SALARY
WHERE p2.PNAME IS NULL;


---Daljeet sir
WITH RankedProgrammers AS (
    SELECT PNAME,
           PROF1 AS Language,
           SALARY,
           ROW_NUMBER() OVER ( ORDER BY SALARY DESC) AS Rank
    FROM Programmer
    WHERE PROF1 IS NOT NULL
    UNION
    SELECT PNAME,
           PROF2 AS Language,
           SALARY,
           ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS Rank
    FROM Programmer
    WHERE PROF2 IS NOT NULL
)
SELECT Language, PNAME AS HighestPaidProgrammer
FROM RankedProgrammers
WHERE Rank = 1;


 --************************************************************************************************************************************************
--Answer 48: Who is the least experienced programmer?

select * from Programmer

SELECT top 1 Pname, min(DateDIFF(YEAR,DOB,DOJ)) AS LEAST_EXPERIENCE FROM PROGRAMMER
group by PNAME
order by LEAST_EXPERIENCE


 --************************************************************************************************************************************************
--Answer 49: Who is the most experienced male programmer knowing PASCAL? 

SELECT top 1 pname, min(abs(DATEDIFF(YEAR,DOB,DOJ))) AS Most_EXPERIENCE FROM PROGRAMMER
where Gender ='M' and PROF1 = 'Pascal' or PROF2 = 'Pascal'
group by PNAME

 --************************************************************************************************************************************************
--Answer 50: . Which language is known by only one programmer?

SELECT One_Language
FROM 
(
SELECT PNAME, PROF1 AS One_Language FROM Programmer WHERE PROF1 IS NOT NULL
UNION 
SELECT PNAME, PROF2 AS One_Language FROM Programmer WHERE PROF2 IS NOT NULL
) AS Languages
GROUP BY One_Language
HAVING COUNT(DISTINCT PNAME) = 1 

 --************************************************************************************************************************************************
--Answer 51: Who is the above programmer referred in 50? 

Create TABLE Prof_Language(PROF VARCHAR(20))

Select * from Prof_Language

INSERT INTO Prof_Language
SELECT PROF1 FROM programmer 
GROUP BY PROF1 HAVING
PROF1 NOT IN (SELECT PROF2 FROM programmer) 
AND COUNT(PROF1)=1
UNION
SELECT PROF2 FROM programmer 
GROUP BY PROF2 HAVING
PROF2 NOT IN (SELECT PROF1 FROM programmer) 
AND COUNT(PROF2)=1

SELECT PNAME, PROF FROM programmer 
INNER JOIN Prof_Language ON
PROF=PROF1 OR PROF=PROF2

 --************************************************************************************************************************************************
--Answer 52: Who is the youngest programmer knowing dBase?

SELECT top 1 Pname, min(DateDIFF(YEAR,DOB,DOJ)) AS Yongest_Programmer FROM PROGRAMMER
where PROF1 = 'Dbase' or PROF2 = 'Dbase'
group by PNAME
order by Yongest_Programmer

 --************************************************************************************************************************************************
--Answer 53: Which female programmer earning more than 3000 does not know C, C++, Oracle or dBase? 

SELECT * FROM PROGRAMMER 
WHERE GENDER = 'F' 
AND SALARY >3000 
AND 
prof1 not in ('c', 'C++', 'Oracle', 'Dbase')
AND 
prof2 not in ('c', 'C++', 'Oracle', 'Dbase')

 --************************************************************************************************************************************************
--Answer 54: Which institute has the most number of students? 

select top 1 institute, count(*) as num_of_students  
from studies
group by institute
order by count(*) desc

--************************************************************************************************************************************************
--Answer 55: What is the costliest course? 

select top 1 Course, Course_fee as Costliest_Course  
from studies
order by course_fee desc

--************************************************************************************************************************************************
--Answer 56: Which course has been done by the most number of students? 

select * from studies order by course_fee

Create TABLE Course_Most_Students (Course_Name VARCHAR(20), Num_Student INT)

INSERT INTO Course_Most_Students
SELECT COURSE,COUNT(PNAME) FROM studies GROUP BY COURSE

select * from Course_Most_Students

SELECT Course_Name,Num_Student AS Most_Students FROM Course_Most_Students  
WHERE Num_Student = (SELECT MAX(Num_Student) FROM Course_Most_Students)

--************************************************************************************************************************************************
--Answer 57: Which institute conducts the costliest course? 

select top 1 Institute, Course_fee as Costliest_Course  
from studies
order by course_fee desc

--************************************************************************************************************************************************
--Answer 58: Display the name of the institute and the course which has below average course fee.

select Institute, Course, Course_fee from studies
where Course_fee < (select avg(Course_fee)
from studies)

--************************************************************************************************************************************************
--Answer 59: Display the names of the courses whose fees are within 1000 (+ or -) of the average fee. 

SELECT COURSE
FROM Studies
WHERE ABS(COURSE_FEE - (SELECT AVG(COURSE_FEE) FROM Studies)) <= 1000

--************************************************************************************************************************************************
--Answer 60: Which package has the highest development cost? 

Select * from software order by Dcost

SELECT TOP 1 TITLE, DCOST AS Highest_Dcost
FROM Software
ORDER BY DCOST DESC

--************************************************************************************************************************************************
--Answer 61: Which course has below average number of students? 

CREATE TABLE Below_Avg_Students (Course VARCHAR(20), Pname_count INT)

INSERT INTO Below_Avg_Students

SELECT COURSE, COUNT(PNAME) as Total_Students
FROM studies 
GROUP BY COURSE

SELECT Course,Pname_Count 
FROM Below_Avg_Students 
WHERE Pname_Count <=(SELECT AVG(Pname_Count) FROM Below_Avg_Students)

--************************************************************************************************************************************************
--Answer 62: Which package has the lowest selling cost? 

SELECT TOP 1 TITLE, SCOST AS Lowest_Selling_Cost
FROM Software
ORDER BY SCOST 

--************************************************************************************************************************************************
--Answer 63: Who developed the package that has sold the least number of copies? 

select * from software

SELECT TOP 1 PNAME,TITLE,SOLD 
FROM Software
ORDER BY SOLD ASC

--************************************************************************************************************************************************
--Answer 64: Which language has been used to develop the package which has the highest sales amount? 

SELECT DEVELOPIN,SCOST FROM SOFTWARE 
WHERE SCOST = (SELECT MAX(SCOST) FROM SOFTWARE)

--************************************************************************************************************************************************
--Answer 65: How many copies of the package that has the least difference between development and selling cost were sold?

SELECT SOLD,TITLE FROM SOFTWARE 
WHERE TITLE = (SELECT TITLE FROM SOFTWARE
WHERE (DCOST-SCOST)=(SELECT MIN(DCOST-SCOST) FROM SOFTWARE));

--************************************************************************************************************************************************
--Answer 66: Which is the costliest package developed in Pascal?

Select top 1 Title, Dcost as 'Costliest_Package'
from software
where Developin = 'Pascal'
order by Dcost desc

--************************************************************************************************************************************************
--Answer 67: Which language was used to develop the most number of packages?

select * from software order by sold desc

Select top 1 Developin, Sold as 'Most_Packages'
from software
order by Sold desc

SELECT DEVELOPIN FROM SOFTWARE GROUP BY DEVELOPIN  HAVING DEVELOPIN = (SELECT MAX(DEVELOPIN) FROM SOFTWARE)
--************************************************************************************************************************************************
--Answer 68: Which programmer has developed the highest number of packages?

Select top 1 Pname, Developin, Sold as 'Highest_Packages'
from software
order by Pname desc

--************************************************************************************************************************************************
--Answer 69: Who is the author of the costliest package?

Select top 1 Pname, DCOST as 'Authour_Highest_Packages'
from software
order by Dcost desc

--************************************************************************************************************************************************
--Answer 70: Display the names of the packages which have sold less than the average number of copies.

Select Title from software
where Sold < (select avg(Sold) from software) 

--************************************************************************************************************************************************
--Answer 71. Who are the authors of the packages which have recovered more than double the development cost?

SELECT  distinct PNAME, Developin 
FROM SOFTWARE 
WHERE SOLD*SCOST > 2*DCOST

--************************************************************************************************************************************************
--Answer 72. Display the programmer names and the cheapest packages developed by them in each language.

SELECT PNAME, Title
FROM SOFTWARE 
WHERE Dcost in (select min(Dcost) from software
group by Developin)

--************************************************************************************************************************************************
--Answer 73. Display the language used by each programmer to develop the highest selling and lowest selling package.

SELECT PNAME, DEVELOPIN FROM SOFTWARE 
WHERE SOLD IN (SELECT MAX(SOLD) FROM SOFTWARE GROUP BY PNAME)
union
SELECT PNAME, DEVELOPIN FROM SOFTWARE 
WHERE SOLD IN (SELECT MIN(SOLD) FROM SOFTWARE GROUP BY PNAME)

--************************************************************************************************************************************************
--Answer 74: Who is the youngest male programmer born in 1965?

select top 1 Pname from Programmer 
where Gender = 'M' and Year (dob) = '1965'
order by DOB 

--************************************************************************************************************************************************
--Answer 75: Who is the oldest female programmer who joined in 1992?select top 1 Pname, DOB, Age from Programmer 
where Gender = 'F' and Year (DOJ) = '1992'
order by DOB asc

select top 1 pname, 2023-year(dob) as Age from programmer 
where year(doj)= '1992' and Gender ='F' 
order by age desc

--************************************************************************************************************************************************
--Answer 76: In which year was the most number of programmers born?

select * from programmer 

select count(year (DOB)) as Most_Born, year (DOB) as Birth_Year from Programmer
Group by year(dob)
order by count (*) desc

--************************************************************************************************************************************************
--Answer 77: In which month did the most number of programmers join?

select count(month (DOJ)) as Most_Joining_Month, month (DOJ) as 'Month' from Programmer
Group by month(DOJ)
order by count (*) 

--************************************************************************************************************************************************
--Answer 78: In which language are most of the programmer’s proficient?

SELECT TOP 1 Language, COUNT(*) AS P_Count
FROM (
    SELECT PNAME, PROF1 AS Language FROM Programmer WHERE PROF1 IS NOT NULL
    UNION ALL
    SELECT PNAME, PROF2 AS Language FROM Programmer WHERE PROF2 IS NOT NULL
) AS Languages
GROUP BY Language
ORDER BY COUNT(*) DESC

--************************************************************************************************************************************************
--Answer 79: Who are the male programmers earning below the average salary of female programmers?

SELECT PNAME, SALARY
FROM Programmer
WHERE GENDER = 'M' AND SALARY < (SELECT AVG(SALARY) FROM Programmer WHERE GENDER = 'F')

--************************************************************************************************************************************************
--Answer 80: Who are the female programmers earning more than the highest paid?

SELECT PNAME, SALARY
FROM Programmer
WHERE GENDER = 'F' AND SALARY > (SELECT MAX(SALARY) FROM Programmer where Gender = 'M')

--************************************************************************************************************************************************
--Answer 81: Which language has been stated as the proficiency by most of the programmers?

SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 HAVING PROF1 = (SELECT MAX(PROF1) FROM PROGRAMMER)
union
SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING PROF2 = (SELECT MAX(PROF2) FROM PROGRAMMER)

--************************************************************************************************************************************************
--Answer 82: Display the details of those who are drawing the same salary.

Select * From PROGRAMMER 
Where Salary in (Select Salary From PROGRAMMER 
Group by Salary 
Having Count(Salary ) > 1)

--************************************************************************************************************************************************
--Answer 83: Display the details of the software developed by the male programmers earning more than 3000

select * from programmer as P, software as S
where p.pname=s.pname and salary>3000 and gender = 'M'

--************************************************************************************************************************************************
--Answer 84: Display the details of the packages developed in Pascal by the female programmers.

select * from programmer as P, software as S
where P.PNAME = S.PNAME and Gender = 'F' and DEVELOPIN = 'Pascal'

--************************************************************************************************************************************************
--Answer 85: Display the details of the programmers who joined before 1990.

select * from Programmer
where year(DOJ) < 1990

--************************************************************************************************************************************************
--Answer 86: Display the details of the software developed in C by the female programmers at Pragathi.

select S.* from SOFTWARE S,STUDIES ST,PROGRAMMER P
where S.pname=st.pname and p.pname=s.pname and Gender='F' and INSTITUTE='Pragathi'

--************************************************************************************************************************************************
--Answer 87: Display the number of packages, number of copies sold and sales value of each programmer institute wise. 

Select studies.institute, count(software.developin) AS developin, count(software.sold) As Sold, sum(software.sold*software.scost) AS sales from software, studies
where software.pname =studies.pname 
group by studies.institute

--************************************************************************************************************************************************
--Answer 88: Display the details of the software developed in dBase by male programmers who belong to the institute in which the most number of programmers studied.

SELECT s.PNAME, s.TITLE, s.DEVELOPIN, s.SCOST, s.DCOST, s.SOLD
FROM Software s
INNER JOIN Programmer p ON s.PNAME = p.PNAME
INNER JOIN Studies st ON p.PNAME = st.PNAME
WHERE s.DEVELOPIN = 'DBASE' AND p.GENDER = 'M'
    AND st.INSTITUTE = (
        SELECT TOP 1 INSTITUTE
        FROM Studies
        GROUP BY INSTITUTE
        ORDER BY COUNT(*) DESC
    )

--************************************************************************************************************************************************
--Answer 89: Display the details of the software developed by the male programmers born before 1965 and female programmers born after 1975.

SELECT S.*, YEAR(DOB),GENDER FROM Programmer p,Software s 
WHERE s.PNAME=p.PNAME AND 
((GENDER='M' AND YEAR(DOB)<1965) OR (GENDER='F' AND YEAR(DOB)>1975))

--************************************************************************************************************************************************
--Answer 90: Display the details of the software that has been developed in the language which is neither the first nor the second proficiency of the programmers

select s.* from programmer p,software s
where s.pname=p.pname and (developin <> prof1 and developin <> prof2)

--************************************************************************************************************************************************
--Answer 91: Display the details of the software developed by the male students at Sabhari

select s.* from software s,studies st,programmer p 
where s.pname=st.pname and p.pname=s.pname and gender='m' and institute='Sabhari'

--************************************************************************************************************************************************
--Answer 92: Display the names of the programmers who have not developed any packages.

select pname from programmer
where pname not in(select pname from software)

--************************************************************************************************************************************************
--Answer 93: What is the total cost of the software developed by the programmers of Apple?

select sum(scost) as Total_Cost from software s,studies st
where s.pname=st.pname and institute='apple'

--************************************************************************************************************************************************
--Answer 94: Who are the programmers who joined on the same day?

select a.pname,a.doj from programmer a,programmer b
where a.doj=b.doj and a.pname <> b.pname

--************************************************************************************************************************************************
--Answer 95: Who are the programmers who have the same Prof2?

select distinct(a.pname),a.prof2 from programmer a,programmer b
where a.prof2=b.prof2 and a.pname <> b.pname

--************************************************************************************************************************************************
--Answer 96: Display the total sales value of the software institute wise.

select studies.institute, sum(software.sold*software.scost) as Total_Sales from software,studies
where studies.pname=software.pname 
group by studies.institute

--************************************************************************************************************************************************
--Answer 97: In which institute does the person who developed the costliest package studied.

select institute from software st,studies s
where s.pname=st.pname 
group by institute, dcost 
having dcost = (select max(dcost) from software)

--************************************************************************************************************************************************
--Answer 98: Which language listed in Prof1, Prof2 has not been used to develop any package?

select prof1 from programmer 
where prof1 not in(select developin from software) 
union
select prof2 from programmer 
where prof2 not in(select developin from software)

--************************************************************************************************************************************************
--Answer 99: How much does the person who developed the highest selling package earn and what course did he/she undergo?

select p1.salary,s2.course from programmer p1,software s1,studies s2
where p1.pname=s1.pname and s1.pname=s2.pname and scost=(select max(scost) from software)

--************************************************************************************************************************************************
--Answer 100: What is the average salary for those whose software sales is more than 50,000?

select avg(salary) as Avg_Salary from programmer as P ,software as S
where p.pname = s.pname and sold * scost > 50000

--************************************************************************************************************************************************
--Answer 101: How many packages were developed by students who studied in institutes that charge the lowest course fee?

select s.pname, count(title) As packages from software s,studies st
where s.pname=st.pname 
group by s.pname, COURSE_FEE 
having min(COURSE_FEE) = (select min(COURSE_FEE) from studies)

--************************************************************************************************************************************************
--Answer 102: How many packages were developed by the person who developed the cheapest package? Where did he/she study?

select count(developin) as Total_Packages from programmer p,software s
where s .pname=p.pname 
group by developin 
having min(dcost) = (select min(dcost) from software)

--************************************************************************************************************************************************
--Answer 103: How many packages were developed by female programmers earning more than the highest paid male programmer?select count(developin) as Total_Packages from programmer p,software s
where s.pname=p.pname and gender='F' 
and 
salary > (select max(salary) from programmer p,software s
where s.pname = p.pname and gender='M')--************************************************************************************************************************************************
--Answer 104: How many packages are developed by the most experienced programmers from BDPS?select count(*) as Total_Packages from software s,programmer p
where p.pname=s.pname 
group by doj 
having min(doj)=(select min(doj)
from studies st,programmer p, software s
where p.pname=s.pname and st.pname=p.pname and (institute='bdps'))--************************************************************************************************************************************************
--Answer 105: List the programmers (from the software table) and the institutes they studied at.select pname,institute from studies
where pname not in(select pname from software)

--************************************************************************************************************************************************
--Answer 106: List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF. 

select count(*) as Total_Programmers, sum(scost*sold-dcost) "PROFIT" from software
where developin in (select prof1 from programmer) 
group by developin

--************************************************************************************************************************************************
--Answer 107: List the programmer names (from the programmer table) and No. Of Packages each has developed.

select s.pname, count(developin) as Total_Packages from programmer p,software s
where p.pname=s.pname group by s.pname