-- 1. Create database if not exists and use it
CREATE DATABASE IF NOT EXISTS EMP_SHI_DB;
USE EMP_SHI_DB;
-- 2. Drop existing tables 
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Shippers;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Customers;
-- 3. Customers
CREATE TABLE Customers(
    CustomerID; INT PRIMARY KEY,
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

INSERT INTO Employees (EmployeeID, FirstName,LastName) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith');

-- 5. Shippers
CREATE TABLE  Shippers(
    ShipperID INT PRIMARY KEY,
    ShipperName VARCHAR(50)
) ENGINE=InnoDB;

INSERT INTO Shippers (ShipperID, ShipperName) VALUES
(101, 'DHL'),
(102, 'FedEx');

-- 6. Products
CREATE TABLE Products(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50)
) ENGINE=InnoDB;

INSERT INTO Products (ProductID, ProductName) VALUES
(1, 'Laptop'),
(2, 'Mouse'),
(3, 'Keyboard');

-- 7. Orders
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

-- 8. OrderDetails
CREATE TABLE OrderDetails(
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
) ENGINE=InnoDB;

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1001, 1, 2),
(1001, 2, 1),
(1002, 2, 5),
(1003, 3, 3);
SELECT 
    o.OrderID AS OrderID,
    c.CustomerName AS CustomerName,
    p.ProductName AS ProductName,
    od.Quantity AS Quantity,
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    s.ShipperName AS ShipperName
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Shippers s ON o.ShipperID = s.ShipperID
ORDER BY o.OrderID;