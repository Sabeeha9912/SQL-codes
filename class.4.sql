CREATE DATABASE IF NOT EXISTS CLASS_DATABASE;
USE CLASS_DATABASE;

DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL,
    UserStatus VARCHAR(20) DEFAULT 'Active',
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL,
    Description TEXT
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL CHECK (Price > 0),
    StockQuantity INT DEFAULT 0,
    CategoryID INT,
    CONSTRAINT FK_ProdCat FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    UserID INT,
    CONSTRAINT FK_OrdUser FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    CONSTRAINT FK_DetOrd FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_DetProd FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

DELIMITER //

CREATE TRIGGER update_stock_after_sale
AFTER INSERT ON OrderDetails
FOR EACH ROW
BEGIN
    UPDATE Products
    SET StockQuantity = StockQuantity - NEW.Quantity
    WHERE ProductID = NEW.ProductID;
END;

//

DELIMITER ;

INSERT INTO Categories (CategoryID, CategoryName, Description) 
VALUES (1, 'Electronics', 'Devices');

INSERT INTO Products (ProductID, ProductName, Price, StockQuantity, CategoryID) 
VALUES (10, 'Smartphone', 500.00, 50, 1);

INSERT INTO Users (UserID, Username, Email) 
VALUES (100, 'jdoe', 'john@test.com');

INSERT INTO Orders (OrderID, UserID) 
VALUES (500, 100);

-- FIXED INSERT: Added the 3rd value (5) for the Quantity column
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) 
VALUES (500, 10, 5);

SELECT ProductName, StockQuantity FROM Products WHERE ProductID = 10;
SHOW TRIGGERS;