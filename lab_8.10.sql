USE LAB_8;
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    EmployeeID INT,
    OrderDate DATE
);
TRUNCATE TABLE Orders;
INSERT INTO Orders (OrderID, EmployeeID, OrderDate) VALUES 
(501, 5, '2023-05-01'),
(502, 2, '2023-05-02'),
(503, 5, '2023-05-03'),
(504, 5, '2023-05-10'),
(505, 1, '2023-05-12');
DROP PROCEDURE IF EXISTS ListEmployeeOrders;
DELIMITER //
CREATE PROCEDURE ListEmployeeOrders(IN empID INT)
BEGIN
    DECLARE finished INTEGER DEFAULT 0;
    DECLARE currentOrderID INT;
    DECLARE currentOrderDate DATE;
    DECLARE orderCursor CURSOR FOR 
        SELECT OrderID, OrderDate 
        FROM Orders 
        WHERE EmployeeID = empID;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    OPEN orderCursor;
    order_loop: LOOP
        FETCH orderCursor INTO currentOrderID, currentOrderDate;
        IF finished = 1 THEN 
            LEAVE order_loop;
        END IF;
        SELECT currentOrderID AS 'OrderID', currentOrderDate AS 'OrderDate';
        END LOOP order_loop;
    CLOSE orderCursor;
END //
DELIMITER ;
CALL ListEmployeeOrders(5);