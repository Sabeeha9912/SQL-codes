P3tasks:
Data:
INSERT INTO Employees (EmployeeId, FullName, Department, Salary)
VALUES
(1, AHMAD, 'IT', 100000), (2, ZEERAK, 'CS',1000000), (3, ALI, 'CS',300000),(3,HASSAN,'IT',400000),(4,UMER,'CS',300000),(5,HAMZA,'CE',500000);


-- CREATE DATABASE employee;
USE employee;
CREATE TABLE IF NOT EXISTS Employees (
Employee_ID INT PRIMARY KEY,
FULL_NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT
);
Use Employee;
SELECT DISTINCT Department
FROM Employees;
2:
-- CREATE DATABASE employee;
USE employee;
CREATE TABLE IF NOT EXISTS Employees (
Employee_ID INT PRIMARY KEY,
FULL_NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT
);
SELECT FullName
FROM Employees
Order By FullName ASC;

3:
USE employee;
CREATE TABLE IF NOT EXISTS Employees (
Employee_ID INT PRIMARY KEY,
FULL_NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT
);
SELECT  Employee_ID
FROM  employees
WHERE Employee_ID IS NULL;

4:
USE employee;
CREATE TABLE IF NOT EXISTS Employees (
Employee_ID INT PRIMARY KEY,
FULL_NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT
);
SELECT CONCAT(FULL_NAME, ‘  ‘,SALARY) AS EMPLOYEE_INFO ,SALARY AS ‘MONTHALY_PAY’ FROM employees


PRACTICE TASKS:
DATA:

NSERT INTO PRODUCTS VALUES 
(1, 'Chais', 18.00, 'Bottles', '500 g'),
(2, 'Chang', 25.00, 'Boxes', '20 kg'),
(3, 'Chef Anton Oil', 98.00, 'Bottles', '12 - 550 g pkgs.'),
(4, 'Coffee Mocha', 30.00, 'Boxes', '1 kg box');
INSERT INTO EMPLOYEE VALUES 
(1, 'John', 'Doe', 'John Doe', 'French', 'Psychology'),
(2, 'Zafar', 'Iqbal', 'Zafar Iqbal', 'French', 'Math'),
(3, 'Sarah', 'Connor', 'Sarah Connor', 'Spanish', 'Psychology');
INSERT INTO CUSTOMERS VALUES 
(1, 'Alfreds Futterkiste', 'Berlin', 'Germany', 'Obere Str. 57'),
(2, 'Around the Horn', 'London', 'UK', '120 Hanover Sq.'),
(3, 'Bólido Comidas', 'Madrid', 'Spain', 'Avda. de la Constitución 2222');
INSERT INTO Orders VALUES (101, 1, 3), (102, 2, 1), (103, NULL, 2); 
INSERT INTO Suppliers VALUES (1, 'Exotic Liquids'), (5, 'Tokyo Traders'), (10, 'Mayumis');
INSERT INTO Shippers VALUES (1, 'Speedy Express'), (2, 'United Package'), (3, 'Federal Shipping');
SELECT * FROM PRODUCTS;
SELECT * FROM EMPLOYEE;
SELECT * FROM CUSTOMERS;
SELECT * FROM Orders;
SELECT * FROM Suppliers;
SELECT * FROM Shippers;

CREATE DATABASE SHOP_DB;
USE SHOP_DB;
 CREATE TABLE PRODUCTS IF NOT EXISTS(
PRODUCT_ID INT PRIMARY KEY,
PRODUCT_NAME VARCHAR(100),
PRICE DECIMAL(10,2),
PACKING VARCHAR(50)
);
-- See all products
SELECT * FROM PRODUCTS;

-- See all employees
SELECT * FROM EMPLOYEE;

-- See all customers
SELECT * FROM CUSTOMERS;
CREATE TABLE EMPLOYEE(
EMPLOYEE_ID INT PRIMARY KEY,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
FULL_NAME VARCHAR(100),
LANGUAGE_FLUENT VARCHAR(100),
DEGREE VARCHAR(100)
);
CREATE TABLE CUSTOMERS(
CUSTOMER_ID INT PRIMARY KEY,
CUSTOMER_NAME VARCHAR(100),
CITY VARCHAR(100),
COUNTARY VARCHAR(100)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    EmployeeID INT,
    ShipperID INT
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100)
);


1:
customers belong to how many unique countries
SELECT DISTINCT COUNTARY AS CountryList 
FROM CUSTOMERS;


2:
Employees whose names contain the letter "A" but not at the start
SELECT FIRST_NAME, LAST_NAME 
FROM EMPLOYEE 
WHERE FIRST_NAME LIKE '_%a%';

3:
Retrieve the suppliers sorted by SupplierName in ascending order
SELECT SupplierName 
FROM Suppliers 
ORDER BY SupplierName ASC;

4:
Retrieve shippers sorted alphabetically by name
SELECT ShipperName 
FROM Shippers 
ORDER BY ShipperName ASC;

5:
Retrieve all customers whose address contains 'Str.'
SELECT CUSTOMER_NAME, ADDRESS 
FROM CUSTOMERS 
WHERE ADDRESS LIKE '%Str.%';

6:
Find products where the quantity mentions "kg" or "g"
SELECT PRODUCT_NAME, UNIT 
FROM PRODUCTS 
WHERE UNIT LIKE '%kg%' OR UNIT LIKE '%g%';










