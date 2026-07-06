
USE LAB_8;
DROP PROCEDURE IF EXISTS OrderCategory;
DELIMITER $$ 
CREATE PROCEDURE OrderCategory(IN FreightValue DECIMAL(10,2))
BEGIN
    SELECT 
        FreightValue AS Freight,
        CASE
            WHEN FreightValue >= 100 THEN 'High Freight'
            WHEN FreightValue BETWEEN 50 AND 99 THEN 'Medium Freight'
            ELSE 'Low Freight'
        END AS Category;
END $$
DELIMITER ;
CALL OrderCategory(120);
CALL OrderCategory(75);
CALL OrderCategory(30);