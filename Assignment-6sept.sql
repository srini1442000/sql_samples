use AdventureWorks2022

---1. Create a view named ‘customer_san_jose’ which comprises of only those customers who are from San Jose

create view customer_san_jose
as
select * from customer where city='san jose'

select * from customer_san_jose

--2. Inside a transaction, update the first name of the customer to Francis
--where the last name is Jordan:
--a. Rollback the transaction
--b. Set the first name of customer to Alex, where the last name is
--Jordan

begin transaction
update customer 
set first_name='francis' where last_name='jordan'
rollback transaction


begin transaction
update customer set first_name='alex' where last_name='ivan'

select * from customer


--3. Inside a TRY... CATCH block, divide 100 with 0, print the default error
--message.


declare @s1 int
declare @s2 int
begin try
set @s1=100
set @s2=@s1/0
end
try
begin 
catch
print error_message()
end
catch








--4. Create a transaction to insert a new record to Orders table and save it.

begin transaction
INSERT INTO orders
VALUES(200,getdate(),9500,90)
commit TRANSACTION

select * from orders





