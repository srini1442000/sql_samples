create table orders
(
order_id int,
order_date date,
amount int,
customer_id int
)
INSERT INTO ORDERS VALUES(100,'2020-10-01',9000,20),
						(110,'2020-10-01',9000,10),
						(111,'2020-10-02',8000,2),
						(112,'2020-10-03',7000,30),
						(113,'2020-10-04',6000,3),
						(114,'2020-10-05',5000,5);
select c.customer_id,c.city,c.address,o.customer_id from 
customer C
inner join 
orders O
on c.customer_id=o.customer_id

select * from
customer C
left join
orders O
on c.customer_id=o.customer_id


select * from customer C
right join
orders O
on c.customer_id=o.customer_id

select * from customer C
full join
orders O
on c.customer_id=o.customer_id

update orders
set amount=100
where customer_id=3;
select * from orders
