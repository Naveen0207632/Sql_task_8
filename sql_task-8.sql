create database office1;
use office1;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees VALUES
(1, 'John', 'Doe', 'HR', 55000),
(2, 'Jane', 'Smith', 'IT', 75000),
(3, 'Alice', 'Johnson', 'Finance', 67000),
(4, 'Bob', 'Williams', 'IT', 72000),
(5, 'Eva', 'Brown', 'HR', 58000);

DELIMITER //

CREATE PROCEDURE GetEmployeesByDepartment(IN DeptName VARCHAR(50))
BEGIN
    SELECT EmployeeID, FirstName, LastName, Department, Salary
    FROM Employees
    WHERE Department = DeptName;
END //

DELIMITER ;
CALL GetEmployeesByDepartment('IT');

DELIMITER //

CREATE FUNCTION CalculateAnnualSalary(monthly_salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN monthly_salary * 12;
END //

DELIMITER ;

SELECT 
    FirstName, 
    LastName, 
    Salary AS MonthlySalary, 
    CalculateAnnualSalary(Salary) AS AnnualSalary
FROM Employees;

DROP PROCEDURE IF EXISTS GetEmployeesByDepartment;
DROP FUNCTION IF EXISTS CalculateAnnualSalary;





