DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Suppliers;

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    SupplierID INT
);

INSERT INTO Suppliers (SupplierID, SupplierName) VALUES
(1, 'Ocean Foods'),
(2, 'Fresh Farm'),
(3, 'Sea Delights'),
(4, 'Green Valley');

INSERT INTO Products (ProductID, ProductName, SupplierID) VALUES
(1, 'Salmon', 1),
(2, 'Shrimp', 3),
(3, 'Rice', 2),
(4, 'Vegetables', 4),
(5, 'Tuna', 1);

SELECT s.SupplierName
FROM Suppliers s
JOIN Products p
    ON s.SupplierID = p.SupplierID
GROUP BY s.SupplierID, s.SupplierName
HAVING COUNT(p.ProductID) = 1;