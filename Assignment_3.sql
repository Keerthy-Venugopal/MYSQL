-- Create the Managers table
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY, -- Primary Key Constraint
    First_name VARCHAR(50) NOT NULL, -- Not Null Constraint
    Last_name VARCHAR(50) NOT NULL, -- Not Null Constraint
    DOB DATE NOT NULL, -- Not Null Constraint
    Age INT CHECK (Age >= 18), -- Check Constraint
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Auto-update timestamp
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')), -- Check Constraint for Gender
    Department VARCHAR(50) NOT NULL, -- Not Null Constraint
    Salary DECIMAL(10, 2) NOT NULL -- Not Null Constraint
);
 -- Insert 10 rows
 INSERT INTO Managers (Manager_Id, First_name, Last_name, DOB, Age, Gender, Department, Salary)
VALUES
(1, 'John', 'Doe', '1985-04-12', 39, 'M', 'IT', 30000),
(2, 'Jane', 'Smith', '1990-08-20', 34, 'F', 'HR', 25000),
(3, 'Aaliya', 'Khan', '1992-03-15', 32, 'F', 'Finance', 27000),
(4, 'Michael', 'Brown', '1980-06-30', 44, 'M', 'IT', 40000),
(5, 'Emma', 'Wilson', '1995-12-01', 28, 'F', 'Sales', 22000),
(6, 'Liam', 'Johnson', '1987-09-09', 37, 'M', 'IT', 32000),
(7, 'Olivia', 'Taylor', '1991-05-25', 33, 'F', 'Marketing', 26000),
(8, 'William', 'Davis', '1983-02-14', 41, 'M', 'HR', 28000),
(9, 'Sophia', 'Miller', '1994-11-18', 30, 'F', 'IT', 24000),
(10, 'James', 'Garcia', '1988-07-22', 36, 'M', 'Finance', 35000);

-- Query to retrieve the name and DOB of the manager with Manager_Id = 1
SELECT First_name, Last_name, DOB 
FROM Managers
WHERE Manager_Id = 1;

-- Query to display the annual income of all managers
SELECT Manager_Id, First_name, Last_name, (Salary * 12) AS Annual_Income 
FROM Managers;

-- Query to display records of all managers except 'Aaliya'
SELECT * 
FROM Managers
WHERE First_name != 'Aaliya';

 -- Query to display details of managers in the IT department earning more than 25000
SELECT * 
FROM Managers
WHERE Department = 'IT' AND Salary > 25000;

-- Query to display details of managers whose salary is between 10000 and 35000
SELECT * 
FROM Managers
WHERE Salary BETWEEN 10000 AND 35000;

