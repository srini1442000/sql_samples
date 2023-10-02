---assignment 4
--1--
select min(amount) as [min amount],
max (amount) as[max amount],
avg(amount) as [avg amount]
from orders

--2--
create function multiply(@num int)
returns int 
as 
begin
return(@num *10)
end

select dbo.multiply(10)

---

create function udf_add (@num1 int,@num2 int) returns intasbeginreturn(@num1 + @num2)endselect dbo.udf_add(5,3)



--3--
select
case
when 100<200 then 'less then 200'
when 100>200 then 'greater then 200'
else 'equal'
end


select
case
when 100=100 then 'equal then 100'
when 100>200 then 'greater then 200'
else 'less'
end

--4--



select * from orders
case
when amount>5000 then 'high amount'
when amount<5000 then 'low amount'
else 'medium'
end as amot_ctg
from orders

--5--

create function getordersgreaterthen(@inputamt int)
returns table
as 
return
(
select * from orders
where amount>@inputamt
)
select * from dbo.getordersgreaterthen(5000)




