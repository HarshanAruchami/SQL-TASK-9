--TABLE CREATION
create table studtbl (studentid int identity(1,1), studentname varchar(20), semester varchar(20), securedmarks int, totalmarks int);
--TABLE INSERTION
insert into studtbl values ('harshan','sem 1',490,500),('hemanth','sem 3',450,500),('hari','sem 1',430,500),('harita','sem 3',470,500),('dharshan','sem 1',420,500)
--SELECT QUERY
select * from studtbl;
--drop table
drop table studtbl;
--1. Write a Stored Procedure in SQL using conditional statements to search for a record from the students table (created in SQL Task 8) based on studentname column.
CREATE PROCEDURE sp_stu_record @name varchar(20)
AS
SELECT * FROM studtbl WHERE studentname=@name
--executing the stored procedure
EXEC sp_stu_record 'harshan'
--drop the procedure
drop procedure sp_stu_record
--2. Write a Stored procedure in SQL to give remarks for the secured marks column in the students table (created in SQL Task 8) using CASE statement.
CREATE PROCEDURE sp_remarks with encryption
AS
BEGIN
SELECT studentid,studentname,semester,securedmarks,
CASE 
  WHEN(securedmarks >= 470 and securedmarks <=500)THEN 'v.v.good'
  WHEN(securedmarks >= 450 and securedmarks <=470)THEN 'v.good'
  WHEN(securedmarks >= 400 and securedmarks <=450)THEN 'good'
END AS 'remarks'
FROM studtbl;
END;
--executing the procedure
exec sp_remarks;
--drop procedure
drop procedure sp_remarks;

--3. Show the working of Table variables, temporary table, temporary stored procedures. (Both Local and Global)
--TABLE VARIABLES
DECLARE @EMPLOYEE TABLE
(
EMP_NAME VARCHAR(20),
EMP_AGE INT,
EMP_SALARY INT
);
INSERT INTO @EMPLOYEE VALUES ('HARSHAN',20,20000);
SELECT * FROM @EMPLOYEE;
-----------------------------------------------------------------------------------------------------------

--Temporary table(LOCAL)
CREATE TABLE #TEMP_TABLE(NAME VARCHAR(20),AGE INT);
INSERT INTO #TEMP_TABLE VALUES('HEMANTH',20);
--SELECT QUERY
SELECT * FROM #TEMP_TABLE--local

--Temporary table(GLOBAL)
CREATE TABLE ##TEMPO_TABLE(NAME VARCHAR(20),AGE INT);
INSERT INTO ##TEMPO_TABLE VALUES('HARI',20);
--SELECT QUERY
SELECT * FROM ##TEMPO_TABLE--global
-------------------------------------------------------------------------------------------------------------

--Temporary stored procedures(local)
CREATE PROCEDURE #sp_stu_rec @name varchar(20)
AS
SELECT * FROM studtbl WHERE studentname=@name
--executing the stored procedure
EXEC #sp_stu_rec 'hemanth'--local


--Temporary stored procedures(global)
alter PROCEDURE ##sp_stu_reco @mark int
AS
SELECT * FROM studtbl WHERE securedmarks=@mark
--executing the stored procedure
EXEC ##sp_stu_reco 490--global