
USE LAB_8;
DROP PROCEDURE IF EXISTS CheckEmployeeAge;
DELIMITER $$
CREATE PROCEDURE CheckEmployeeAge(IN BirthYear INT)
BEGIN
    DECLARE age INT;
    SET age = YEAR(CURDATE()) - BirthYear;
    IF age >= 18 THEN
        SELECT 'Adult' AS Result;
    ELSE
        SELECT 'Minor' AS Result;
    END IF;
END $$
DELIMITER ;
CALL CheckEmployeeAge(2001);
CALL CheckEmployeeAge(2010);