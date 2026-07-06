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

CREATE INDEX IDX_UserEmail ON Users(Email);

DELIMITER //
CREATE TRIGGER update_stock_after_sale
AFTER INSERT ON OrderDetails
FOR EACH ROW
BEGIN
    UPDATE Products
    SET StockQuantity = StockQuantity - NEW.Quantity
    WHERE ProductID = NEW.ProductID;
END; //
DELIMITER ;

INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES
(1, 'Electronics', 'Laptops and phones'),
(2, 'Home Office', 'Furniture'),
(3, 'Audio', 'Speakers'),
(4, 'Accessories', 'Cables');

INSERT INTO Users (UserID, Username, Email) VALUES
(101, 'alice_w', 'alice@test.com'),
(102, 'bob_b', 'bob@test.com'),
(103, 'charlie_p', 'charlie@test.com'),
(104, 'dana_s', 'scully@test.com'),
(105, 'm_fox', 'mulder@test.com');

INSERT INTO Products (ProductID, ProductName, Price, StockQuantity, CategoryID) VALUES
(10, 'MacBook Pro', 1999.99, 50, 1),
(11, 'Ergonomic Chair', 299.00, 20, 2),
(12, 'Wireless Mouse', 49.99, 100, 4),
(13, 'Sony Headphones', 349.50, 30, 3),
(14, 'Mechanical Keyboard', 120.00, 15, 2),
(15, 'USB-C Hub', 59.00, 60, 4);

INSERT INTO Orders (OrderID, UserID) VALUES
(501, 101), (502, 102), (503, 104), (504, 105), (505, 101);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(501, 10, 1), (501, 12, 2), (502, 11, 1), (502, 14, 1),
(503, 13, 1), (503, 15, 3), (504, 10, 1), (504, 15, 1),
(505, 12, 5), (505, 13, 2);
SELECT ProductName, StockQuantity AS Remaining_Stock FROM Products;