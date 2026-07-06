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
(103, 'UPS');   -- No employee assigned (important for RIGHT JOIN)
SELECT DISTINCT
    c.Customer_ID AS CustomerID,
    c.Customer_Name AS CustomerName,
    s.ShipperID AS ShipperID,
    s.ShipperName AS ShipperName,
    LEFT(c.Customer_Name,3) AS FirstThreeChars
FROM Customers c
CROSS JOIN Shippers s
WHERE LEFT(c.Customer_Name,3) = LEFT(s.ShipperName,3);