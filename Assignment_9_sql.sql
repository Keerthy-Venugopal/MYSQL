-- Step 1: Create a Database
CREATE DATABASE CompanyDB;

-- Step 2: Use the Database
USE CompanyDB;

-- Step 3: Create the Worker Table
CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT(15),
    JoiningDate DATETIME,
    Department CHAR(25)
);

-- Step 4: Create Stored Procedures

-- 4.1 Add a New Worker Record
DELIMITER //

CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT(15),
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END //

DELIMITER ;

-- 4.2 Retrieve Salary Using Worker_Id
DELIMITER //

CREATE PROCEDURE GetSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Worker
    WHERE Worker_Id = p_Worker_Id;
END //

DELIMITER ;

-- 4.3 Update Department Using Worker_Id
DELIMITER //

CREATE PROCEDURE UpdateDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END //

DELIMITER ;

-- 4.4 Retrieve Worker Count in a Department
DELIMITER //

CREATE PROCEDURE GetWorkerCount(
    IN p_Department CHAR(25),
    OUT p_WorkerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_WorkerCount
    FROM Worker
    WHERE Department = p_Department;
END //

DELIMITER ;

-- 4.5 Retrieve Average Salary in a Department
DELIMITER //

CREATE PROCEDURE GetAverageSalary(
    IN p_Department CHAR(25),
    OUT p_AvgSalary DECIMAL(10, 2)
)
BEGIN
    SELECT AVG(Salary) INTO p_AvgSalary
    FROM Worker
    WHERE Department = p_Department;
END //

DELIMITER ;

-- Step 5: Procedure Calls

-- Add a New Worker Record
CALL AddWorker(101, 'John', 'Doe', 50000, '2024-01-01', 'IT');

-- Retrieve Salary of Worker with Worker_Id = 101
SET @worker_id = 101;
CALL GetSalary(@worker_id, @salary);
SELECT @salary AS Retrieved_Salary;

-- Update Department of Worker with Worker_Id = 101
CALL UpdateDepartment(101, 'HR');

-- Retrieve Worker Count in HR Department
SET @department = 'HR';
CALL GetWorkerCount(@department, @workerCount);
SELECT @workerCount AS Worker_Count;

-- Retrieve Average Salary in HR Department
SET @department = 'HR';
CALL GetAverageSalary(@department, @avgSalary);
SELECT @avgSalary AS Average_Salary;
