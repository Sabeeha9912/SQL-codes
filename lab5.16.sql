-- 1. Create Database
CREATE DATABASE IF NOT EXISTS LAB_5;
USE LAB_5;

-- 2. Drop tables if exist (clean run)
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Shippers;
DROP TABLE IF EXISTS Customers;

-- 3. Categories Table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);

-- 4. Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- 5. Insert Categories
INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Beverages'),
(2, 'Snacks'),
(3, 'Dairy'),
(4, 'Bakery'),
(5, 'Frozen Foods'),
(6, 'Electronics');

-- 6. Insert Products
INSERT INTO Products (ProductID, ProductName, CategoryID) VALUES
(101, 'Coca Cola', 1),
(102, 'Pepsi', 1),
(103, 'Orange Juice', 1),
(104, 'Chips', 2),
(105, 'Cookies', 2),
(106, 'Milk', 3),
(107, 'Cheese', 3),
(108, 'Butter', 3),
(109, 'Bread', 4),
(110, 'Ice Cream', 5),
(111, 'Frozen Pizza', 5);

-- 7. Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    ListName VARCHAR(50) NOT NULL
);

-- 8. Insert Employees
INSERT INTO Employees (EmployeeID, ListName) VALUES
(1, 'Ali'),
(2, 'Ahmed'),
(3, 'Sara'),
(4, 'John'),
(5, 'Ayesha');

-- 9. Shippers Table
CREATE TABLE Shippers (
    ShipperID INT PRIMARY KEY,
    ShipperName VARCHAR(50) NOT NULL
);

-- 10. Insert Shippers
INSERT INTO Shippers (ShipperID, ShipperName) VALUES
(1, 'TCS'),
(2, 'Leopards'),
(3, 'DHL'),
(4, 'FedEx'); -- 0 orders for testing

-- 11. Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50) NOT NULL
);

-- 12. Insert Customers
INSERT INTO Customers (CustomerID, CustomerName) VALUES
(1, 'Ali Khan'),
(2, 'Sara Ahmed'),
(3, 'John Smith'),
(4, 'Ayesha Noor'),
(5, 'David Lee');

-- 13. Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    EmployeeID INT,
    ShipperID INT,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 14. Insert Orders and assign Employee, Shipper, Customer, OrderDate
INSERT INTO Orders (OrderID, EmployeeID, ShipperID, CustomerID, OrderDate) VALUES
(1001, 1, 1, 1, '2026-01-05'),
(1002, 1, 1, 1, '2026-01-10'),
(1003, 1, 1, 1, '2026-01-15'),
(1011, 1, 1, 1, '2026-02-01'),
(1012, 1, 1, 1, '2026-02-02'),
(1013, 1, 1, 1, '2026-02-03'),
(1014, 1, 1, 1, '2026-02-04'),
(1015, 1, 1, 1, '2026-02-05'),
(1016, 1, 1, 1, '2026-02-06'),
(1017, 1, 1, 1, '2026-02-07'),
(1018, 1, 1, 1, '2026-02-08'),
(1019, 1, 1, 1, '2026-02-09'),
(1020, 1, 1, 1, '2026-02-10'),
(1021, 1, 1, 1, '2026-02-11'),
(1022, 1, 1, 1, '2026-02-12'),
(1023, 1, 1, 1, '2026-02-13'),
(1024, 1, 1, 1, '2026-02-14'),
(1025, 1, 1, 1, '2026-02-15'),
(1026, 1, 1, 1, '2026-02-16'),
(1027, 1, 1, 1, '2026-02-17'),
(1028, 1, 1, 1, '2026-02-18'),
(1029, 1, 1, 1, '2026-02-19'),

-- Other employees
(1004, 2, 2, 2, '2026-03-05'),
(1005, 2, 2, 3, '2026-03-10'),
(1006, 3, 2, 1, '2026-03-15'),
(1007, 4, 3, 2, '2026-04-12'),
(1008, 4, 3, 2, '2026-04-18'),
(1009, 4, 3, 3, '2026-05-20'),
(1010, 5, 3, 4, '2026-05-25');
-- 15. OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- 16. Insert OrderDetails
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 1001, 101, 2),
(2, 1001, 104, 1),
(3, 1002, 102, 3),
(4, 1003, 103, 5),
(5, 1004, 104, 2),
(6, 1005, 105, 4),
(7, 1006, 106, 1),
(8, 1007, 101, 2),
(9, 1008, 107, 3),
(10, 1009, 108, 2),
(11, 1010, 110, 21);

-- 17. Queries

-- a) Total products per category
SELECT c.CategoryID, c.CategoryName, COUNT(p.ProductID) AS TotalProducts
FROM Categories c
LEFT JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName
ORDER BY c.CategoryID;

-- b) Total quantity per product
SELECT p.ProductID, p.ProductName, SUM(od.Quantity) AS Total_Quantity
FROM Products p
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY p.ProductID;

-- c) Average quantity per product
SELECT p.ProductID, p.ProductName, ROUND(AVG(od.Quantity), 2) AS Avg_Quantity
FROM Products p
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY p.ProductID;

-- d) Total orders per employee
SELECT e.EmployeeID, e.ListName, COUNT(o.OrderID) AS Total_Orders
FROM Employees e
LEFT JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.ListName
ORDER BY e.EmployeeID;

-- e) Total orders per shipper
SELECT s.ShipperID, s.ShipperName, COUNT(o.OrderID) AS Total_Orders
FROM Shippers s
LEFT JOIN Orders o ON s.ShipperID = o.ShipperID
GROUP BY s.ShipperID, s.ShipperName
ORDER BY s.ShipperID;

-- f) Customers with more than 5 orders
SELECT c.CustomerID, c.CustomerName, COUNT(o.OrderID) AS Total_Orders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
HAVING COUNT(o.OrderID) > 5
ORDER BY Total_Orders DESC;

-- g) Total quantity per product (descending)
SELECT p.ProductID, p.ProductName, SUM(od.Quantity) AS Total_Quantity
FROM Products p
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY Total_Quantity DESC;
ALTER TABLE Customers
ADD Country VARCHAR(50);
UPDATE Customers SET Country = 'Pakistan' WHERE CustomerID IN (1, 2, 4);
UPDATE Customers SET Country = 'USA' WHERE CustomerID IN (3, 5);
SELECT 
    e.EmployeeID,
    e.ListName AS LastName,
    COUNT(DISTINCT od.ProductID) AS Unique_Products_Count
FROM Employees e
LEFT JOIN Orders o
    ON e.EmployeeID = o.EmployeeID
LEFT JOIN OrderDetails od
    ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, e.ListName
ORDER BY Unique_Products_Count DESC;
