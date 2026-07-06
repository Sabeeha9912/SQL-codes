CREATE DATABASE IF NOT EXISTS EMP_SHI_DB;
USE EMP_SHI_DB;
CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    ShipperID INT
);
INSERT INTO Employees VALUES
(1, 'Ali', 101),
(2, 'Sara', 102),
(3, 'Ahmed', 101),
(4, 'John', NULL),     
(5, 'Ayesha', 105);  
CREATE TABLE IF NOT EXISTS Shippers(
    ShipperID INT,
    ShipperName VARCHAR(50)
);
INSERT INTO Shippers VALUES
(101, 'DHL'),
(102, 'FedEx'),
(103, 'UPS');   
SELECT *
FROM EMPLOYEES
CROSS JOIN Shippers;