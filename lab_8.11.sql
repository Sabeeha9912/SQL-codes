USE LAB_8;
DROP TABLE IF EXISTS Orders;
DROP PROCEDURE IF EXISTS CustomerCategory;
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT  
);
INSERT INTO Orders (CustomerID) SELECT 1 FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) a, (SELECT 1 UNION SELECT 2) b, (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) c;
INSERT INTO Orders (CustomerID) SELECT 2 FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3) a, (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) b;
INSERT INTO Orders (CustomerID) VALUES (3),(3),(3),(3),(3);
DELIMITER //
CREATE PROCEDURE CustomerCategory(IN p_CustomerID INT)
BEGIN
    DECLARE totalOrders INT DEFAULT 0;
    DECLARE category VARCHAR(20);
    SELECT COUNT(*) INTO totalOrders
    FROM Orders
    WHERE Orders.CustomerID = p_CustomerID;
	IF totalOrders >= 50 THEN
        SET category = 'Top Customer';
    ELSEIF totalOrders >= 10 THEN
        SET category = 'Regular';
    ELSE
        SET category = 'Occasional';
    END IF;

    -- Output the result set
    SELECT 
        p_CustomerID AS 'InputID', 
        totalOrders AS 'TotalOrders', 
        category AS 'ResultCategory';
END //
DELIMITER ;
CALL CustomerCategory(1);
CALL CustomerCategory(2);
CALL CustomerCategory(3);