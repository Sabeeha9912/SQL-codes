DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS OrderDetails;
CREATE TABLE IF NOT EXISTS Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100)
);
CREATE TABLE  IF NOT EXISTS Products  (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    SupplierID INT
);
CREATE TABLE IF NOT EXISTS OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT
);
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 101, 1, 1),
(2, 101, 2, 2),
(3, 102, 3, 1),
(4, 102, 1, 1),
(5, 103, 2, 101);
INSERT INTO Suppliers (SupplierID, SupplierName) VALUES
(1, 'Ocean Foods'),
(2, 'Fresh Farm'),
(3, 'Sea Delights'),
(4, 'Green Valley');
INSERT INTO Products (ProductID, ProductName, Category, SupplierID) VALUES
(1, 'Salmon', 'Seafood', 1),
(2, 'Shrimp', 'Seafood', 3),
(3, 'Rice', 'Grocery', 2),
(4, 'Vegetables', 'Grocery', 4),
(5, 'Tuna', 'Seafood', 1);
SELECT OrderID
FROM OrderDetails
GROUP BY OrderID
HAVING SUM(Quantity) > 100;