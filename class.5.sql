CREATE DATABASE IF NOT EXISTS CLASS_DATABASE;
USE CLASS_DATABASE;

DROP TABLE IF EXISTS AuditLog;
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT DEFAULT 0,
    CategoryID INT,
    CONSTRAINT FK_ProdCat FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    UserID INT,
    CONSTRAINT FK_OrdUser FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    CONSTRAINT FK_DetOrd FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_DetProd FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE AuditLog (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    TableName VARCHAR(50),
    ActionType VARCHAR(10),
    Description TEXT,
    LogDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER trg_AfterOrderInsert
AFTER INSERT ON OrderDetails
FOR EACH ROW
BEGIN
    UPDATE Products
    SET StockQuantity = StockQuantity - NEW.Quantity
    WHERE ProductID = NEW.ProductID;
    
    INSERT INTO AuditLog (TableName, ActionType, Description)
    VALUES ('OrderDetails', 'INSERT', CONCAT('Reduced stock for Product ', NEW.ProductID, ' by ', NEW.Quantity));
END; //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_BeforePriceUpdate
BEFORE UPDATE ON Products
FOR EACH ROW
BEGIN
    IF OLD.Price <> NEW.Price THEN
        INSERT INTO AuditLog (TableName, ActionType, Description)
        VALUES ('Products', 'UPDATE', CONCAT('Price changed for ', OLD.ProductName, ' from ', OLD.Price, ' to ', NEW.Price));
    END IF;
END; //
DELIMITER ;

INSERT INTO Categories VALUES (1, 'Electronics');
INSERT INTO Products VALUES (10, 'Laptop', 1200.00, 20, 1);
INSERT INTO Users VALUES (100, 'tech_guru', 'guru@example.com');
INSERT INTO Orders VALUES (500, 100);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (500, 10, 2);
UPDATE Products SET Price = 1150.00 WHERE ProductID = 10;

SELECT 
    p.ProductName, 
    p.Price AS Current_Price, 
    p.StockQuantity AS Remaining_Stock, 
    a.ActionType, 
    a.Description AS Audit_Record
FROM Products p
LEFT JOIN AuditLog a ON a.TableName = 'Products' OR a.Description LIKE CONCAT('%Product ', p.ProductID, '%');