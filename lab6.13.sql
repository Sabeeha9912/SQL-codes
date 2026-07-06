DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    EmployeeID INT
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT
);

INSERT INTO Employees (EmployeeID, FirstName, LastName) VALUES
(1, 'Bilal', 'Khan'),
(2, 'Ayesha', 'Ali'),
(3, 'Omar', 'Sheikh');

INSERT INTO Orders (OrderID, OrderDate, EmployeeID) VALUES
(101, '2025-01-01', 1),
(102, '2025-01-02', 2),
(103, '2025-01-03', 3);

INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Chai', 20),
(2, 'Coffee', 30),
(3, 'Tea', 15),
(4, 'Chai Latte', 40);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 101, 1, 2),
(2, 102, 2, 1),
(3, 103, 4, 1),
(4, 101, 3, 1);
SELECT DISTINCT e.FirstName, e.LastName
FROM Employees e
JOIN Orders o
    ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
JOIN Products p
    ON od.ProductID = p.ProductID
WHERE p.ProductName LIKE 'Chai';