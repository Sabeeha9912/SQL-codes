CREATE DATABASE IF NOT EXISTS EMP_SHI_DB;
USE EMP_SHI_DB;
CREATE TABLE IF NOT EXISTS Customers(
    Customer_ID INT,
    Customer_Name VARCHAR(50),
    ShipperID INT
);
INSERT INTO Employees VALUES
(1, 'Ali', 101),
(2, 'Sara', 102),
(3, 'Ahmed', 101),
(4, 'John', NULL),     
(5, 'Ayesha', 105),    
(6, 'Fedric', NULL),
(7, 'DHLUser', NULL);
CREATE TABLE IF NOT EXISTS Shippers(
    ShipperID INT,
    ShipperName VARCHAR(50)
);
INSERT INTO Shippers VALUES
(101, 'DHL'),
(102, 'FedEx'),
(103, 'UPS');   
SELECT 
    e1.EmployeeID AS Employee1ID,
    e1.EmployeeName AS Employee1Name,
    e2.EmployeeID AS Employee2ID,
    e2.EmployeeName AS Employee2Name
FROM
    (SELECT DISTINCT EmployeeID, EmployeeName FROM Employees) e1
JOIN
    (SELECT DISTINCT EmployeeID, EmployeeName FROM Employees) e2
    ON e1.EmployeeID; < e2.EmployeeID;
ORDER BY e1.EmployeeID;, e2.EmployeeID;