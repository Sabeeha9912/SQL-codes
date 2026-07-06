
CREATE DATABASE IF NOT EXISTS EMP_SHI_DB;
USE EMP_SHI_DB;
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS Shippers;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
) ENGINE=InnoDB;

INSERT INTO Customers (CustomerID, CustomerName) VALUES
(1, 'Ali'),
(2, 'Sara'),
(3, 'Ahmed'),
(4, 'Mark'); -- customer with no orders
CREATE TABLE Employees(
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
) ENGINE=InnoDB;

INSERT INTO Employees (EmployeeID, FirstName, LastName) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Tom', 'Taylor'); -- employee with no orders
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
(4, 'Monitor', 201, 301); -- never ordered
CREATE TABLE Orders(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    ShipperID INT,
    OrderDate DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID)
) ENGINE=InnoDB;

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES
(1001, 1, 1, 101, '2026-01-10 08:15:00'), -- before 9 AM
(1002, 2, 2, 102, '2026-02-15 14:30:00'),
(1003, 3, 1, 101, '2026-03-05 18:10:00'), -- after 5 PM
(1004, 1, 2, 102, '2026-07-20 11:00:00'),
(1005, 3, 1, 101, '2026-08-15 16:45:00');
CREATE TABLE OrderDetails(
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
) ENGINE=InnoDB;

-- INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
-- (1001, 1, 2),
-- (1001, 2, 1),
-- (1002, 2, 5),
-- (1003, 3, 3),
-- (1004, 1, 1),
-- (1004, 3, 2),
-- (1005, 2, 3);
-- Insert test orders with same date for multiple customers
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES
(1006, 1, 1, 101, '2026-09-01 10:00:00'),  
(1007, 2, 2, 102, '2026-09-01 14:30:00'), 
(1008, 3, 1, 101, '2026-09-02 09:15:00'),   
(1009, 4, 2, 102, '2026-09-01 16:45:00');  
SELECT 
    o1.CustomerID AS Customer1ID,
    c1.CustomerName AS Customer1Name,
    o2.CustomerID AS Customer2ID,
    c2.CustomerName AS Customer2Name,
    DATE(o1.OrderDate) AS OrderDate
FROM Orders o1
JOIN Orders o2 
    ON DATE(o1.OrderDate) = DATE(o2.OrderDate)
    AND o1.CustomerID < o2.CustomerID
JOIN Customers c1 ON o1.CustomerID = c1.CustomerID
JOIN Customers c2 ON o2.CustomerID = c2.CustomerID
ORDER BY OrderDate, Customer1ID, Customer2ID;