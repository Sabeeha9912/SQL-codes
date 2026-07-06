DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(1, 'Laptop', 'Electronics', 800),
(2, 'Mouse', 'Electronics', 20),
(3, 'Keyboard', 'Electronics', 50),
(4, 'Monitor', 'Electronics', 200),
(5, 'USB Cable', 'Accessories', 10),
(6, 'Headphones', 'Accessories', 60);

SELECT ProductName, Price
FROM Products
WHERE Price = (SELECT MAX(Price) FROM Products);