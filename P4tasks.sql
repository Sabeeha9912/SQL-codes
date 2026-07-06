P4tasks:
PRECEDENCE
-- CREATE DATABASE employee;
USE employee;
CREATE TABLE IF NOT EXISTS Employees (
Employee_ID INT PRIMARY KEY,
FULL_NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT
);
USE employee;
-- Precedence Check 
SELECT 
    FULL_NAME, 
    SALARY,                     -- Added a comma here
    (SALARY + 5000) * 0.10 AS Tax_Amount -- Added an Alias name
FROM Employees;
--Null Check:
--  CREATE DATABASE employee;
USE employee;
CREATE TABLE IF NOT EXISTS Employees (
Employee_ID INT PRIMARY KEY,
FULL_NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT
);
USE employee;
SELECT 
    FULL_NAME, 
    SALARY,                            
    (IFNULL(SALARY, 0) + 5000) * 0.10 AS TAX 
FROM Employees;   
