USE LAB_8;
CREATE DATABASE IF NOT EXISTS DemoDB;
USE DemoDB;

CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);
TRUNCATE TABLE Orders;
INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES 
(1, 10, '2023-01-01'),
(2, 10, '2023-01-05'),
(3, 20, '2023-01-10'),
(4, 10, '2023-02-01'),
(5, 30, '2023-02-15');
DROP PROCEDURE IF EXISTS CustomerOrderCount;

DELIMITER //

CREATE PROCEDURE CustomerOrderCount(
    IN targetID INT, 
    OUT totalCount INT
)
BEGIN
    SELECT COUNT(*) 
    INTO totalCount
    FROM Orders
    WHERE CustomerID = targetID;
END //
DELIMITER ;
CALL CustomerOrderCount(10, @result);
SELECT 10 AS SearchedCustomerID, @result AS TotalOrdersFound;