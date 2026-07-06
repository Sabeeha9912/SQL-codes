
CREATE DATABASE IF NOT EXISTS EMP_SHI_DB;
USE EMP_SHI_DB;
TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS Shippers;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Customers;
TABLE Customers(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
) ENGINE=InnoDB;

INSERT INTO Customers (CustomerID, CustomerName) VALUES
(1, 'Ali'),
(2, 'Sara'),
(3, 'Ahmed');
CREATE TABLE Employees(
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
) ENGINE=InnoDB;

INSERT INTO Employees (EmployeeID, FirstName, LastName) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Mark', 'Taylor');  -- New employee with no orders
CREATE TABLE Shippers(
    ShipperID INT PRIMARY KEY,
    ShipperName VARCHAR(50)
) ENGINE=InnoDB;

INSERT INTO Shippers (ShipperID, ShipperName) VALUES
(101, 'DHL'),
(102, 'FedEx');

CREATE TABLE Suppliers(
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(50)
) ENGINE=InnoDB;
INSERT INTO Suppliers (SupplierID, SupplierName) VALUES
(201, 'Tech Supplies Inc'),
(202, 'Gadget World');
CREATE TABLE Categories(
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
) ENGINE=InnoDB;
INSERT INTO Categories (CategoryID, CategoryName) VALUES
(301, 'Computers'),
(302, 'Accessories');
CREATE TABLE Products(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    SupplierID INT,
    CategoryID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
) ENGINE=InnoDB;
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID) VALUES
(1, 'Laptop', 201, 301),
(2, 'Mouse', 202, 302),
(3, 'Keyboard', 202, 302),
(4, 'Monitor', 201, 301);  -- Never ordered
CREATE TABLE Orders(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    ShipperID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID)
) ENGINE=InnoDB;

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES
(1001, 1, 1, 101, '2026-01-10'),
(1002, 2, 2, 102, '2026-02-15'),
(1003, 3, 1, 101, '2026-03-05'),
(1004, 1, 2, 102, '2026-07-20'),
(1005, 3, 1, 101, '2026-08-15');
CREATE TABLE OrderDetails(
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
) ENGINE=InnoDB;
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1001, 1, 2),  -- 2 Laptops
(1001, 2, 1),  -- 1 Mouse
(1002, 2, 5),  -- 5 Mice
(1003, 3, 3),  -- 3 Keyboards
(1004, 1, 1),  -- 1 Laptop
(1004, 3, 2),  -- 2 Keyboards
(1005, 2, 3);  -- 3 Mice
SELECT 
    c.CustomerID AS CustomerID,
    c.CustomerName AS CustomerName,
    COALESCE(o.OrderID, 'No Order Placed') AS OrderID
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID;