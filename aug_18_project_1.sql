--3. Perform the following with help of the above database:




--a. Get all the details from the person table including email ID, phone
--number and phone number type
select * from [Person].[Person]
select * from [Person].[EmailAddress]
select * from [Person].[PersonPhone]
select * from [Person].[PhoneNumberType]

select p.FirstName,p.LastName,e.EmailAddress,pp.PhoneNumber,ppt.PhoneNumberTypeID
from [Person].[Person] p
inner join
[Person].[EmailAddress] e
on
p.BusinessEntityID=e.BusinessEntityID
inner join
[Person].[PersonPhone] pp
on 
e.BusinessEntityID=pp.BusinessEntityID
inner join
[Person].[PhoneNumberType] ppt
on 
pp.PhoneNumberTypeID=ppt.PhoneNumberTypeID





--b. Get the details of the sales header order made in May 2011
select * from [Sales].[SalesOrderHeader]
where year (OrderDate)=2011
and MONTH(orderdate)=05


--c. Get the details of the sales details order made in the month of May
--2011
select * from [Sales].[SalesOrderHeader]
select *from [Sales].[SalesOrderDetail]

select *from [Sales].[SalesOrderDetail] sd
inner join 
 [Sales].[SalesOrderHeader] sh
 on
 sd.SalesOrderID=sh.SalesOrderID
 where sh.OrderDate between ('2011-05-01') and ('2011-05-31')



--d. Get the total sales made in May 2011
select * from [Sales].[SalesOrderHeader]
select *from [Sales].[SalesOrderDetail]


select sum(sd.linetotal) as [total sum] from [Sales].[SalesOrderDetail] sd
inner join
 [Sales].[SalesOrderHeader] sh
 on
 sd.SalesOrderID=sh.SalesOrderID
 where sh.OrderDate between ('2011-05-01') and ('2011-05-31')


--e. Get the total sales made in the year 2011 by month order by
--increasing sales

select * from [Sales].[SalesOrderHeader]
select *from [Sales].[SalesOrderDetail]


select sum(sd.linetotal) as totalsales,month(orderdate) as sale_month,year(orderdate) as year_date
from [Sales].[SalesOrderDetail] sd
inner join [Sales].[SalesOrderHeader] sh
on
sd.SalesOrderID=sh.SalesOrderID
where year(orderdate)=2011
group by month(orderdate) ,year(orderdate)
order by totalsales

select * from [Sales].[SalesPerson]



--f. Get the total sales made to the customer with FirstName='Gustavo'
--and LastName ='Achong'
select SUM(LINETOTAL) AS TOTALSALES, YEAR(ORDERDATE) AS YEAROFSALES, FIRSTNAME, 
LASTNAME FROM [Sales].[SalesOrderDetail] SD INNER JOIN [Sales].[SalesOrderHeader] SH ON
SD.SalesOrderID = SH.SalesOrderID INNER JOIN SALES.Customer C ON 
SH.CustomerID = C.CustomerID INNER JOIN [Person].[Person] P ON
C.PersonID = P.BusinessEntityID
WHERE LASTNAME = 'ACHONG' AND FIRSTNAME = 'GUSTAVO'
GROUP BY YEAR(ORDERDATE), FIRSTNAME, LASTNAME















