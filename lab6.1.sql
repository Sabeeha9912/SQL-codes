CREATE DATABASE IF NOT EXISTS Prod_lab5;
USE Prod_lab5;
CREATE TABLE IF NOT EXISTS Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE
);
CREATE TABLE IF NOT EXISTS OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT
);
INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 800),
(2, 'Mouse', 20),
(3, 'Keyboard', 50),
(4, 'Monitor', 200),
(5, 'USB Cable', 10),
(6, 'Headphones', 60);
INSERT INTO Orders (OrderID, OrderDate) VALUES
(101, '2025-01-01'),
(102, '2025-01-02'),
(103, '2025-01-03');
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 101, 1, 1),
(2, 101, 2, 2),
(3, 102, 3, 1),
(4, 102, 1, 1),
(5, 103, 2, 1);
SELECT p.ProductID, p.ProductName
FROM Products p
WHERE NOT EXISTS (
    SELECT 1
    FROM OrderDetails od
    WHERE od.ProductID = p.ProductID
);