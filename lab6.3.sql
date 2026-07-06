DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Suppliers;
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
SELECT DISTINCT s.SupplierName
FROM Suppliers s
JOIN Products p
    ON s.SupplierID = p.SupplierID
WHERE p.Category = 'Seafood';