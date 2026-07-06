DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Employees;

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100),
    Country VARCHAR(50)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Country VARCHAR(50),
    EmployeeID INT
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100)
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

INSERT INTO Customers (CustomerID, CustomerName, Country, EmployeeID) VALUES
(1, 'Ali', 'Pakistan', 1),
(2, 'Sara', 'India', 1),
(3, 'John', 'Pakistan', 1),
(4, 'David', 'UAE', 2),
(5, 'Ahmed', 'Pakistan', 1),
(6, 'Usman', 'Pakistan', 1),
(7, 'Hina', 'India', 2),
(8, 'Zara', 'Pakistan', 1);

INSERT INTO Employees (EmployeeID, FirstName, LastName) VALUES
(1, 'Bilal', 'Khan'),
(2, 'Ayesha', 'Ali'),
(3, 'Omar', 'Sheikh');

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

SELECT e.FirstName, e.LastName
FROM Employees e
JOIN Customers c
    ON e.EmployeeID = c.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
HAVING COUNT(c.CustomerID) > 5;