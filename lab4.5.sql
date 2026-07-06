-- 1. Create database and use it
CREATE DATABASE IF NOT EXISTS EMP_SHI_DB;
USE EMP_SHI_DB;

-- 2. Drop existing tables to avoid conflicts
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS Shippers;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Customers;

-- 3. Customers
CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
) ENGINE=InnoDB;

INSERT INTO Customers (CustomerID, CustomerName) VALUES
(1, 'Ali'),
(2, 'Sara'),
(3, 'Ahmed');

-- 4. Employees
CREATE TABLE Employees(
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
) ENGINE=InnoDB;

INSERT INTO Employees (EmployeeID, FirstName, LastName) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith');

-- 5. Shippers
CREATE TABLE Shippers(
    ShipperID INT PRIMARY KEY,
    ShipperName VARCHAR(50)
) ENGINE=InnoDB;

INSERT INTO Shippers (ShipperID, ShipperName) VALUES
(101, 'DHL'),
(102, 'FedEx');

-- 6. Suppliers
CREATE TABLE Suppliers(
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(50)
) ENGINE=InnoDB;

INSERT INTO Suppliers (SupplierID, SupplierName) VALUES
(201, 'Tech Supplies Inc'),
(202, 'Gadget World');

-- 7. Categories
CREATE TABLE Categories(
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
) ENGINE=InnoDB;

INSERT INTO Categories (CategoryID, CategoryName) VALUES
(301, 'Computers'),
(302, 'Accessories');

-- 8. Products
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
(4, 'Monitor', 201, 301); -- Never ordered

-- 9. Orders
CREATE TABLE Orders(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    ShipperID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID)
) ENGINE=InnoDB;

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, ShipperID) VALUES
(1001, 1, 1, 101),
(1002, 2, 2, 102),
(1003, 3, 1, 101);

-- 10. OrderDetails
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
(1003, 3, 3);  -- 3 Keyboards
SELECT 
    p.ProductID AS ProductID,
    p.ProductName AS ProductName,
    c.CategoryName AS CategoryName,
    s.SupplierName AS SupplierName
FROM Products p
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE od.ProductID IS NULL;