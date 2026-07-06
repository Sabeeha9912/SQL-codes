DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS Customers;
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

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100),
    Country VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    SupplierID INT
);

INSERT INTO Employees (EmployeeID, FirstName, LastName) VALUES
(1, 'Bilal', 'Khan'),
(2, 'Ayesha', 'Ali'),
(3, 'Omar', 'Sheikh');

INSERT INTO Orders (OrderID, OrderDate, EmployeeID) VALUES
(101, '1997-01-15', 1),
(102, '1997-03-20', 1),
(103, '1998-05-10', 2),
(104, '1997-07-25', 3),
(105, '1996-11-30', 2);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 101, 1, 1),
(2, 102, 2, 2),
(3, 103, 3, 1),
(4, 104, 1, 1),
(5, 105, 2, 1);

SELECT DISTINCT e.FirstName, e.LastName
FROM Employees e
JOIN Orders o
    ON e.EmployeeID = o.EmployeeID
WHERE YEAR(o.OrderDate) = 1997;