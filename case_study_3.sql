create database casestudy3
use casestudy3
select * from continent
select * from customers
select * from txn


--1. Display the count of customers in each region who have done the
--transaction in the year 2020.
select 
	count(cu.customer_id) [no of customers],
	region_name
from
	 continent c,customers cu,txn t
where
	c.region_id=cu.region_id and
	cu.customer_id=t.customer_id and
	txn_date like ('2020%')
group by
	region_name



--2. Display the maximum and minimum transaction amount of each
--transaction type.
select 
	txn_type,
	min(txn_amount) min_transaction,
	max(txn_amount) max_transaction
from
	txn
group by
	txn_type

	




	select * from Customers

--3. Display the customer id, region name and transaction amount where transaction type is deposit and transaction amount > 2000.

SELECT CU.CUSTOMER_ID,CO.REGION_NAME,T.TXN_AMOUNT FROM Customers CU 
INNER JOIN Continent CO ON CO.region_id = CU.region_id 
INNER JOIN TXN T ON T.customer_id = CU.customer_id AND(T.txn_date BETWEEN CU.start_date AND CU.end_date)
WHERE T.TXN_TYPE = 'DEPOSIT' AND T.txn_amount > 2000




--4. Find duplicate records in the Customer table.

 SELECT CUSTOMER_ID, START_DATE, END_DATE FROM Customers 
 GROUP BY END_DATE, START_DATE, customer_id 
 HAVING COUNT(*) > 1


--5. Display the customer id, region name, transaction type and transaction amount for the minimum transaction amount in deposit.

SELECT CU.CUSTOMER_ID,CU.REGION_ID,CU.START_DATE,CU.END_DATE,CO.REGION_NAME,T.TXN_AMOUNT FROM Customers CU
INNER JOIN Continent CO ON CO.region_id = CU.region_id
INNER JOIN TXN T ON T.customer_id = CU.customer_id AND (T.txn_date BETWEEN CU.start_date AND CU.end_date)
WHERE T.TXN_AMOUNT IN (SELECT MIN(TXN_AMOUNT) FROM TXN)




--6. Create a stored procedure to display details of customers in the Transaction table where the transaction date is greater than Jun 2020.
CREATE PROCEDURE ALLDETAILS @MONTHOFTXNDATE INT, @YEAROFTXNDATE INT AS

SELECT * FROM Customers CU 
INNER JOIN TXN T ON T.customer_id = CU.customer_id AND (T.txn_date BETWEEN CU.start_date AND CU.end_date)
WHERE MONTH(TXN_DATE) > @MONTHOFTXNDATE AND YEAR(TXN_DATE) >= @YEAROFTXNDATE

 


EXEC ALLDETAILS @MONTHOFTXNDATE = 6, @YEAROFTXNDATE = 2020



--7. Create a stored procedure to insert a record in the Continent table.

CREATE PROCEDURE INSERT_IN_CONTINENT @R_ID INT, @R_NAME VARCHAR(20) 
AS
INSERT INTO Continent VALUES(@R_ID, @R_NAME)


EXEC INSERT_IN_CONTINENT @R_ID = 6, @R_NAME = 'RUSSIA'  

select * from Continent
--8. Create a stored procedure to display the details of transactions that happened on a specific day.

CREATE PROCEDURE TXN_ON_SPECIFIC_DAY @YEAR INT, @MONTH INT, @DAY INT 
AS
SELECT * FROM TXN 
WHERE TXN_DATE = (SELECT DATEFROMPARTS(@YEAR, @MONTH, @DAY))

EXEC TXN_ON_SPECIFIC_DAY @YEAR = 2020, @MONTH = 01, @DAY = 21;





--9. Create a user defined function to add 10% of the transaction amount in a table.
CREATE FUNCTION AMOUNTADD(@ADD INT)
RETURNS TABLE
AS RETURN(SELECT (TXN_AMOUNT+((@ADD)*TXN_AMOUNT)) 
AS AMOUNT FROM TXN)
SELECT * FROM AMOUNTADD(0.1)
--10. Create a user defined function to find the total transaction amount for a given transaction type.
CREATE FUNCTION TOTALAMOUNT (@TYPE VARCHAR(20))
RETURNS TABLE
AS
RETURN(SELECT TXN_TYPE, SUM(TXN_AMOUNT) AS TOTALAMOUNT FROM TXN 
WHERE txn_type = @TYPE
GROUP BY TXN_TYPE)


SELECT * FROM DBO.TOTALAMOUNT('DEPOSIT')







--11. Create a table value function which comprises the columns customer_id, region_id ,txn_date , txn_type , txn_amount which will retrieve data from the above table.

CREATE FUNCTION DETAILS()
RETURNS TABLE
AS
RETURN(SELECT CU.CUSTOMER_ID,CU.REGION_ID,T.TXN_DATE,T.TXN_TYPE,T.TXN_AMOUNT FROM Customers CU
INNER JOIN TXN T ON T.customer_id = CU.customer_id AND (T.txn_date BETWEEN CU.start_date AND CU.end_date))

SELECT * FROM DBO.DETAILS()



select * from Continent

--12. Create a TRY...CATCH block to print a region id and region name in a single column.


BEGIN TRY
SELECT cast( REGION_ID as nvarchar)+''+ REGION_NAME  AS COMBINED_COLUMN FROM Continent
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE() AS ERROR 
END CATCH



--13. Create a TRY...CATCH block to insert a value in the Continent table.
BEGIN TRY
INSERT INTO Continent VALUES(6, 'RUSSIA')
END
TRY
BEGIN CATCH
SELECT ERROR_MESSAGE() AS ERROR
END CATCH
DELETE FROM Continent 
WHERE region_id = 6

select * from Continent






--14. Create a trigger to prevent deleting a table in a database.

CREATE TRIGGER TRG_DELETE ON CONTINENT
FOR DELETE
AS
BEGIN
ROLLBACK
PRINT '********************************************'
PRINT 'YOU CANNOT DELETE FROM THIS TABLE'
PRINT '********************************************'
END

select * from Continent




--15. Create a trigger to audit the data in a table.

SELECT * FROM Continent;
CREATE TABLE CONTINENT_AUDIT(REGION_ID INT,REGION_NAME VARCHAR(20),INSERTED_BY VARCHAR(50));
CREATE TRIGGER TRG_CONTINET
ON CONTINENT
FOR INSERT, UPDATE, DELETE
AS
BEGIN
DECLARE @ID INT, @NAME VARCHAR(20)SELECT @ID = REGION_ID, @NAME = REGION_NAME FROM inserted
INSERT INTO CONTINENT_AUDIT(REGION_ID, REGION_NAME, INSERTED_BY)VALUES 
(@ID, @NAME, ORIGINAL_LOGIN())
PRINT 'INSERT TRIGGER EXECUTED'
END;
SELECT * FROM CONTINENT_AUDIT;
INSERT INTO CONTINENT VALUES(6, 'RUSSIA');
DELETE FROM Continent
WHERE REGION_ID = 6;
UPDATE CONTINENT
SET REGION_NAME = 'INDIA'WHERE region_id = 6;

ENABLE TRIGGER TRG_DELETE ON CONTINENT




--16. Create a trigger to prevent login of the same user id in multiple pages.


CREATE TRIGGER PREVENT_MULTIPLE_LOGINS
ON ALL SERVER
FOR LOGON
AS
BEGIN
DECLARE @SESSION_COUNT INT
SELECT @SESSION_COUNT = COUNT(*)FROM SYS.DM_EXEC_SESSIONS
WHERE is_user_process = 1 AND LOGIN_NAME = ORIGINAL_LOGIN()
IF @SESSION_COUNT > 1 
BEGIN
PRINT 'MULTIPLE LOGINS NOT ALLOWED'
ROLLBACK
END
END;


DISABLE TRIGGER PREVENT_MULTIPLE_LOGINS ON ALL SERVER;







--17. Display top n customers on the basis of transaction type.

SELECT TOP 100 * FROM TXN
WHERE TXN_TYPE = 'DEPOSIT'ORDER BY TXN_AMOUNT DESC







--18. Create a pivot table to display the total purchase, withdrawal and
--deposit for all the customers


SELECT * FROM(SELECT CUSTOMER_ID, TXN_TYPE, TXN_AMOUNT FROM TXN) AS T
PIVOT(SUM(TXN_AMOUNT)FOR TXN_TYPE IN (PURCHASE, DEPOSIT, WITHDRAWAL)) AS P