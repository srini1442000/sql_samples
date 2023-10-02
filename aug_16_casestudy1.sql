use AdventureWorks2022
select * from [dbo].[Location]
select * from [dbo].Product
select * from [dbo].fact



select count (Distinct state) as [count of state] from [Location]

--2--
select count(product)as [count of product] from [product]
where type='regular'


--3--
select sum(marketing) as [sum of market]
from[fact]
where productid=1 

--4--
select min(sales) as [min of sales] 
from [fact]

--5--
select max(cogs) as [cost per good]
from fact 
--6--
select *from Product
where product_type='coffee'
--7--
select *from fact
where total_expenses>40
--8--
select avg(sales) as [avg sales value]
from fact
where area_code=719
--9--
select * from Location

select sum(profit) as [sum of profit]
from fact F
inner join
Location L
on
F.Area_Code=L.Area_Code
where state='colorado'

--10--
select avg(inventory) as[avg inventory],productid
from fact
group by productid
order by productid 


--11--
select *from location
order by state


--12--
select productid,avg(budget_margin)as [budget margin]
from fact
group by ProductId
having avg(budget_margin)>100
order by [budget margin]

-13--

select sum(sales) from fact
where date ='2010-01-01'

--14--
select date,productid,avg(total_expenses)
from fact
group by date,productid
order by date,productid




--15--
select f.date,p.ProductId,p.Product_Type,p.Product,f.Sales,f.Profit,l.State,l.Area_Code
from fact f
inner join
location l
on
f.Area_Code=l.Area_Code
inner join 
product p
on
p.productid=f.ProductId

--16--
select date,productid,sales,profit,area_code,DENSE_RANK()over(order by sales asc)
as sales_rank
from fact

--17--
select state,sum(Profit)as[profit],sum(sales) as sales_value
from fact f
inner join location l
on
f.Area_Code=l.Area_Code
group by state
order by state

--18--
select state,sum(Profit)as[profit],sum(sales) as sales_value,p.Product
from fact f
inner join location l
on
f.Area_Code=l.Area_Code
inner join
product p
on
f.ProductId=p.ProductId
group by l.state,p.Product
order by l.state,p.Product



--19--
select sales,(sales*1.05)
as [increase in sales] from fact 

--20--
select p.ProductId,p.Product_Type,MAX(profit)
from fact f
inner join
product p
on
f.ProductId=p.ProductId
group by p.ProductId,p.Product_Type

--21--
create proc ptype(@prod_type varchar(20))
as
begin
select *from Product
where product_type=@prod_type
end
ptype @prod_type='coffee'
exec ptype  @prod_type='coffee'
execute  ptype  @prod_type='tea'

--22--
select total_expenses,iif(total_expenses<60,'profit','loss')as status
from fact

--23--
select DATEPART(week,date) as weeknumber,productid,sum(sales) as [weekly sales]
from fact
group by ProductId,DATEPART(week,date) with rollup


--24--

select area_code from Location
union
select area_code from fact
order by area_code desc

select area_code from Location
intersect
select area_code from fact
order by area_code

--25--
create function producttable(@product_type varchar(50))
returns table
as
return
select * from product
where Product_Type=@product_type

select * from dbo.producttable('tea')

--26--
begin transaction
update Product
set Product_Type='tea'
where productid=1

select *from product
rollback transaction




--27--
select date,productid,sales,Total_Expenses from fact
where total_expenses between 100 and 200

--28--
delete from product
where type='regular'
select * from product


--29
select product,ascii(substring (product,5,1)) as [char] from product




























