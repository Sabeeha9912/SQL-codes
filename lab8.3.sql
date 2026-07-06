USE LAB_8;
DROP PROCEDURE IF EXISTS ShowLocalVar;
DELIMITER //
CREATE PROCEDURE ShowLocalVar()
BEGIN
    DECLARE localVar INT;
    SET localVar = 100;
    SELECT localVar AS Result;
END //
DELIMITER ;
CALL ShowLocalVar();