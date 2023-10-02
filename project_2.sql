
use AdventureWorks2022

------project_2------------



create table role(id INT not null primary key,role_name varchar(100));
create table user_account(id INT not null primary key,user_name varchar(100),email varchar(254),password varchar(200),password_salt varchar(50),password_hash_algorithm varchar(50));
create table user_has_role(id INT not null primary key,role_start_time timestamp ,role_end_time datetime DEFAULT CURRENT_TIMESTAMP,user_account_id INT,foreign key(user_account_id) references user_account(id),role_id INT,foreign key(role_id) references role(id));
create table statuss(id INT not null primary key,status_name varchar(100),is_user_working bit);
create table user_has_status(id INT Not null primary key,status_start_time timestamp,status_end_time datetime DEFAULT CURRENT_TIMESTAMP,user_account_id INT,foreign key(user_account_id) references user_account(id),status_id INT,foreign key(status_id) references statuss(id));

--#1) Insert data into each of the above tables. With at least two rows in each of the table, make sure, that you have created respective foreign keys. 
insert into role values(3142,'Software developer');
insert into role values(4235,'Web developer');
insert into role values(5637,'Hardware engineer');

insert into user_account values(1,'Karan','karan123@gmail.com','kar1345@an','ka1234','sha-256');
insert into user_account values(2,'Arjun','Arjun1458@gmail.com','arj@123un','ar12345','aes');
insert into user_account values(3,'Kavitha','kavi1435@gmail.com','kavi@123tha','kavi145','md-5');

insert into user_has_role values(112,default,default,1,3142);
insert into user_has_role values(113,default,default,2,4235);
insert into user_has_role values(114,default,default,3,5637);

insert into statuss values(1045,'yet_to_start',0);
insert into statuss values(2362,'started',1);
insert into statuss values(3147,'yet_to_start',0);

insert into user_has_status values(101,default,default,1,1045); 
insert into user_has_status values(102,default,default,2,2362);
insert into user_has_status values(103,default,default,3,3147);

select * from role;
select * from user_account;
select * from user_has_role;
select * from statuss;
select * from user_has_status;

--#2) Delete all the data from each of the tables. 
delete from user_has_role;
delete from role;
delete from user_has_status;
delete from user_account;
delete from statuss;
