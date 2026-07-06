P2tasks:

-- CREATE DATABASE employee;
USE employee;
CREATE TABLE IF NOT EXISTS Employees (
Employee_ID INT PRIMARY KEY,
FULL_NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT
);
USE employee;
SELECT * FROM Employees;

DATA:
INSERT INTO Employees (EmployeeId, FullName, Department, Salary)
VALUES
(1, AHMAD, 'IT', 100000), (2, ZEERAK, 'CS',1000000), (3, ALI, 'CS',300000),(3,HASSAN,'IT',400000),(4,UMER,'CS',300000),(5,HAMZA,'CE',500000);

 FOR Specific Columns:
USE employee;
CREATE TABLE IF NOT EXISTS Employees (
Employee_ID INT PRIMARY KEY,
FULL_NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT
);
SELECT FullName, Department
FROM Employees;

Filter Rows Using WHERE:
USE employee;
CREATE TABLE IF NOT EXISTS Employees (
Employee_ID INT PRIMARY KEY,
FULL_NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT
);
SELECT FullName,Department
FROM Employees
WHERE Department = 'IT';


PT1
DATA:
-- Data for Products (Tasks 1, 7, 8, 9)
INSERT INTO PRODUCTS VALUES 
(1, 'Chais', 18.00, 'Bottles'),
(2, 'Chang', 25.00, 'Boxes'),
(3, 'Chef Anton Oil', 98.00, 'Bottles'),
(4, 'Coffee Mocha', 30.00, 'Boxes'),
(5, 'Chocolate Bars', 12.00, 'Boxes'),
(6, 'Green Tea Bottles', 15.00, 'Bottles');

-- Data for Employees (Tasks 2, 3)
INSERT INTO EMPLOYEE VALUES 
(1, 'John', 'Doe', 'John Doe', 'French', 'Psychology'),
(2, 'Jane', 'Smith', 'Jane Smith', 'English', 'Biology'),
(3, 'Zafar', 'Iqbal', 'Zafar Iqbal', 'French', 'Math'),
(4, 'Sarah', 'Connor', 'Sarah Connor', 'Spanish', 'Psychology');

-- Data for Customers (Tasks 4, 10)
INSERT INTO CUSTOMERS VALUES 
(1, 'Alfreds Futterkiste', 'Berlin', 'Germany'),
(2, 'Around the Horn', 'London', 'UK'),
(3, 'Bólido Comidas', 'Madrid', 'Spain'),
(4, 'Seven Seas', 'London', 'UK'),
(5, 'Frankenversand', 'Munich', 'Germany');

-- Data for Orders (Task 5)
INSERT INTO Orders VALUES 
(101, 1, 3),
(102, 2, 1),
(103, NULL, 2); -- One order with NO Employee assigned

-- Data for Suppliers (Task 6)
INSERT INTO Suppliers (SupplierID, SupplierName) VALUES 
(1, 'Exotic Liquids'), (5, 'Tokyo Traders'), (10, 'Mayumis'), 
(15, 'Pasta Buttini'), (20, 'Zaanse Snoepfabriek');


TABLES:
-- Practice
-- CREATE DATABASE SHOP_DB;
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
List the names of products which priced within range 25 to 98
SELECT PRODUCT_NAME 
FROM PRODUCTS 
WHERE PRICE BETWEEN 25 AND 98;


2:
Which employees are fluent in French
SELECT FULL_NAME 
FROM EMPLOYEE 
WHERE LANGUAGE_FLUENT = 'French';

3:
List employees who have completed a degree in psychology
SELECT FIRST_NAME, LAST_NAME 
FROM EMPLOYEE 
WHERE DEGREE = 'Psychology';

4:
List the customers who are used to live in London
SELECT CUSTOMER_NAME, COUNTARY 
FROM CUSTOMERS 
WHERE CITY = 'London';

5:
list all orders where the EmployeeID is assigned
SELECT OrderID, EmployeeID, ShipperID 
FROM Orders 
WHERE EmployeeID IS NOT NULL;

6:
Retrieve suppliers with a SupplierID between 5 and 15
SELECT SupplierName, SupplierID 
FROM Suppliers 
WHERE SupplierID BETWEEN 5 AND 15;

7:
Retrieve products where the product contains the word "bottles"
SELECT PRODUCT_NAME 
FROM PRODUCTS 
WHERE PRODUCT_NAME LIKE '%bottles%';

8:
Retrieve products where the ProductName starts with the letter "C"
SELECT PRODUCT_NAME, PRICE 
FROM PRODUCTS 
WHERE PRODUCT_NAME LIKE 'C%';

9:
List the products which are shipped in boxes
SELECT PRODUCT_NAME 
FROM PRODUCTS 
WHERE PACKING = 'Boxes';

10:
List the cities of Germany from customer table
SELECT DISTINCT CITY 
FROM CUSTOMERS 
WHERE COUNTARY = 'Germany';







