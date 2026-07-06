-- Step 1: Create and use database
CREATE DATABASE IF NOT EXISTS LAB_8;
USE LAB_8;

-- Step 2: Create Products table
DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    UnitsInStock INT
);
INSERT INTO Products VALUES
(1, 'Mouse', 0),
(2, 'Keyboard', 15),
(3, 'Monitor', 35),
(4, 'Laptop', 80);
SELECT 
    ProductID,
    ProductName,
    UnitsInStock,

    CASE
        WHEN UnitsInStock = 0 THEN 'Out of Stock'
        WHEN UnitsInStock BETWEEN 1 AND 20 THEN 'Low Stock'
        WHEN UnitsInStock BETWEEN 21 AND 50 THEN 'Medium Stock'
        ELSE 'High Stock'
    END AS StockCategory
FROM Products;