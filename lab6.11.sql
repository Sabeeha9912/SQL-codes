DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE
);

CREATE TABLE OrderDetails (
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
(4, 102, 4, 1),
(5, 103, 6, 1);

SELECT DISTINCT o.OrderID
FROM Orders o
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
JOIN Products p
    ON od.ProductID = p.ProductID
WHERE p.Price > 50;