-- 1. Create Database
CREATE DATABASE IF NOT EXISTS LAB_5;
USE LAB_5;

-- 2. Drop tables if already exist (for clean run)
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;

-- 3. Create Categories Table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);

-- 4. Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- 5. Insert Categories (IMPORTANT: FIRST)
INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Beverages'),
(2, 'Snacks'),
(3, 'Dairy'),
(4, 'Bakery'),
(5, 'Frozen Foods'),
(6, 'Electronics');  -- extra category with 0 products

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
-- Drop if exists (clean run)
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Employees;

-- Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    ListName VARCHAR(50) NOT NULL
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
INSERT INTO Employees (EmployeeID, ListName) VALUES
(1, 'Ali'),
(2, 'Ahmed'),
(3, 'Sara'),
(4, 'John'),
(5, 'Ayesha');
INSERT INTO Orders (OrderID, EmployeeID) VALUES
(1001, 1),
(1002, 1),
(1003, 1),

(1004, 2),
(1005, 2),

(1006, 3),

(1007, 4),
(1008, 4),
(1009, 4),
(1010, 4);
SELECT 
    e.EmployeeID,
    e.ListName,
    COUNT(o.OrderID) AS Total_Orders
FROM Employees e
LEFT JOIN Orders o 
    ON e.EmployeeID = o.EmployeeID
GROUP BY 
    e.EmployeeID, e.ListName
ORDER BY e.EmployeeID;

