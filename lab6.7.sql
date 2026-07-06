DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS Customers;
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100),
    Country VARCHAR(50)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Country VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    SupplierID INT
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT
);
INSERT INTO Suppliers (SupplierID, SupplierName, Country) VALUES
(1, 'Ocean Foods', 'Pakistan'),
(2, 'Fresh Farm', 'India'),
(3, 'Sea Delights', 'UAE'),
(4, 'Green Valley', 'Pakistan');
INSERT INTO Customers (CustomerID, CustomerName, Country) VALUES
(1, 'Ali', 'Pakistan'),
(2, 'Sara', 'India'),
(3, 'John', 'Pakistan'),
(4, 'David', 'UAE');
INSERT INTO Products (ProductID, ProductName, Category, SupplierID) VALUES
(1, 'Salmon', 'Seafood', 1),
(2, 'Shrimp', 'Seafood', 3),
(3, 'Rice', 'Grocery', 2),
(4, 'Vegetables', 'Grocery', 4),
(5, 'Tuna', 'Seafood', 1);
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 101, 1, 1),
(2, 101, 2, 2),
(3, 102, 3, 1),
(4, 102, 1, 1),
(5, 103, 2, 101);
SELECT DISTINCT s.SupplierName
FROM Suppliers s
JOIN Customers c
    ON s.Country = c.Country;