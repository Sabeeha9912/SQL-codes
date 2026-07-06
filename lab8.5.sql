CREATE DATABASE IF NOT EXISTS LAB_8;
USE LAB_8;
DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    UnitsInStock INT
);
INSERT INTO Products VALUES
(1, 'Mouse', 40),
(2, 'Keyboard', 25),
(3, 'Monitor', 10);
DROP PROCEDURE IF EXISTS AddProductUnits;
DELIMITER $$
CREATE PROCEDURE AddProductUnits(
    IN p_ProductID INT,
    IN p_ExtraUnits INT,
    OUT p_TotalUnits INT
)
BEGIN
    DECLARE currentStock INT;

    -- Get current stock
    SELECT UnitsInStock
    INTO currentStock
    FROM Products
    WHERE ProductID = p_ProductID;
    SET p_TotalUnits = currentStock + p_ExtraUnits;
END $$
DELIMITER ;
SET @total = 0;

-- Call procedure (ProductID = 1, add 10 units)
CALL AddProductUnits(1, 10, @total);
SELECT @total AS TotalStock;