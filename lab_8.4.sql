CREATE DATABASE IF NOT EXISTS LAB_8;
USE LAB_8;
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    BirthDate DATE
);
INSERT INTO Employees (name, BirthDate) VALUES
('Ali', '2000-05-10'),
('Sara', '1985-03-15'),
('Ahmed', '1960-01-01'),
('Ayesha', '1998-08-20');
SELECT 
    name,
    BirthDate,
    TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) AS Age,

    CASE
        WHEN TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) < 30 THEN 'Young'
        WHEN TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) BETWEEN 30 AND 50 THEN 'Middle-aged'
        ELSE 'Senior'
    END AS Category

FROM Employees;