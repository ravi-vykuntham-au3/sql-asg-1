CREATE DATABASE Company_Details;

USE Company_Details;

-- Create EmployeeDetails table
CREATE TABLE EmployeeDetails (
    EmpId int PRIMARY KEY,
    FullName varchar(50) NOT NULL,
    ManagerId int,
    DateOfJoining date NOT NULL,
    City varchar(50) NOT NULL
);

-- Create EmployeeSalary table
CREATE TABLE EmployeeSalary (
    EmpId int PRIMARY KEY,
    Project varchar(50) NOT NULL,
    Salary float NOT NULL,
    Variable float NOT NULL
);

-- Sample data for EmployeeDetails table
INSERT INTO EmployeeDetails (EmpId, FullName, ManagerId, DateOfJoining, City) VALUES
(1, 'John Smith', NULL, '2020-01-01', 'New York'),
(2, 'Alice Johnson', 1, '2020-02-01', 'Los Angeles'),
(3, 'Bob Williams', 1, '2021-03-01', 'Chicago'),
(4, 'Sarah Lee', 3, '2020-04-01', 'Houston'),
(5, 'David Kim', 2, '2022-01-01', 'San Francisco');

-- Sample data for EmployeeSalary table
INSERT INTO EmployeeSalary (EmpId, Project, Salary, Variable) VALUES
(1, 'Project A', 50000, 10000),
(2, 'Project B', 60000, 12000),
(4, 'Project C', 70000, 14000);

--SQL query to fetch records that are present in one table but not in another table:
SELECT e.EmpId, e.FullName
FROM EmployeeDetails e
LEFT JOIN EmployeeSalary s ON e.EmpId = s.EmpId
WHERE s.EmpId IS NULL;

-- SQL query to fetch all the employees who are not working on any project:
SELECT e.*
FROM EmployeeDetails e
LEFT JOIN EmployeeSalary s ON e.EmpId = s.EmpId
WHERE s.EmpId IS NULL;

-- SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020:
SELECT *
FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2020;

-- Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary:
SELECT e.*
FROM EmployeeDetails e
INNER JOIN EmployeeSalary s ON e.EmpId = s.EmpId;

-- Write an SQL query to fetch a project-wise count of employees:
SELECT Project, COUNT(*) AS EmployeeCount
FROM EmployeeSalary
GROUP BY Project;

-- Fetch employee names and salaries even if the salary value is not present for the employee:
SELECT e.FullName, COALESCE(s.Salary, 0) AS Salary
FROM EmployeeDetails e
LEFT JOIN EmployeeSalary s ON e.EmpId = s.EmpId;

-- Write an SQL query to fetch all the Employees who are also managers:
SELECT e.*
FROM EmployeeDetails e
INNER JOIN EmployeeDetails m ON e.EmpId = m.ManagerId;

-- Write an SQL query to fetch duplicate records from EmployeeDetails:
SELECT EmpId, COUNT(*)
FROM EmployeeDetails