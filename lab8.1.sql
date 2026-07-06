
CREATE DATABASE IF NOT EXISTS LAB_8;
USE LAB_8;
CREATE TABLE IF NOT EXISTS Employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);
INSERT INTO Employees (name) VALUES 
('Ali'),
('Ahmed'),
('Sara'),
('Ayesha');
SET @employeeCount = 0;
SELECT @employeeCount := COUNT(*) 
FROM Employees;
SELECT @employeeCount AS totalEmployees;