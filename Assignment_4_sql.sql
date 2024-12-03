USE sales;

#Creating the Tables:

CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(3, 2),
    Country_Id INT,
    Country_name VARCHAR(50)
);

#Inserting Sample Data for country table

INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9834000),
(2, 'India', 1390000000, 3287000),
(3, 'Canada', 38000000, 9985000),
(4, 'UK', 68000000, 243610),
(5, 'Australia', 25600000, 7692000),
(6, 'Germany', 83000000, 357022),
(7, 'France', 67000000, 551695),
(8, 'Japan', 126000000, 377975),
(9, 'Brazil', 213000000, 8516000),
(10, 'Italy', 60000000, 301340);

#Inserting Sample Data for persons table

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 331000000, 4.8, 1, 'USA'),
(2, 'Jane', 'Smith', 1390000000, 4.2, 2, 'India'),
(3, 'Alice', 'Brown', 38000000, 4.9, 3, 'Canada'),
(4, 'Bob', 'Johnson', 68000000, 3.5, 4, 'UK'),
(5, 'Emily', 'Davis', 25600000, 4.3, 5, 'Australia'),
(6, 'Michael', 'Miller', 83000000, 3.9, 6, 'Germany'),
(7, 'Sarah', 'Wilson', 67000000, 5.0, 7, 'France'),
(8, 'Chris', 'Taylor', 126000000, 3.8, 8, 'Japan'),
(9, 'David', 'Martinez', 213000000, 4.7, 9, 'Brazil'),
(10, 'Anna', 'Lee', 60000000, 4.6, 10, 'Italy');

#Queries:
# 1. List the distinct country names from the Persons table:

SELECT DISTINCT Country_name FROM Persons;

#2.first names and last names from the Persons table with aliases:

SELECT Fname AS FirstName, Lname AS LastName FROM Persons;

#3. Find all persons with a rating greater than 4.0:

SELECT * FROM Persons WHERE Rating > 4.0;

#4. Find countries with a population greater than 10 lakhs:

SELECT * FROM Country WHERE Population > 1000000;

#5. Find persons who are from 'USA' or have a rating greater than 4.5:

SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;

#6.Find all persons where the country name is NULL:
SELECT * FROM Persons WHERE Country_name IS NULL;

#7. Find all persons from the countries 'USA', 'Canada', and 'UK':
SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');

#8. Find all persons not from the countries 'India' and 'Australia':
SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');

#9. Find all countries with a population between 5 lakhs and 20 lakhs:
SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;
#10. Find all countries whose names do not start with 'C':
SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';









