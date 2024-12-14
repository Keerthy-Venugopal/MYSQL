use school;

-- Create the Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(255),
    Population INT,
    Area FLOAT
);

-- Create the Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(255),
    Lname VARCHAR(255),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(255),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

-- Insert data into the Country table
INSERT INTO Country (Id, Country_name, Population, Area)
VALUES
(1, 'USA', 331000000, 9833520),
(2, 'India', 1400000000, 3287263),
(3, 'China', 1440000000, 9596961),
(4, 'Brazil', 213000000, 8515767),
(5, 'Russia', 146000000, 17098246),
(6, 'Japan', 126000000, 377975),
(7, 'Germany', 83000000, 357022),
(8, 'UK', 67000000, 243610),
(9, 'France', 65000000, 551695),
(10, 'Australia', 26000000, 7692024);

-- Insert data into the Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(1, 'John', 'Doe', 5000, 4.5, 1, 'USA'),
(2, 'Alice', 'Smith', 8000, 4.8, 1, 'USA'),
(3, 'Rahul', 'Sharma', 12000, 4.2, 2, 'India'),
(4, 'Wei', 'Chen', 11000, 4.7, 3, 'China'),
(5, 'Carlos', 'Silva', 7000, 4.3, 4, 'Brazil'),
(6, 'Igor', 'Ivanov', 6000, 3.9, 5, 'Russia'),
(7, 'Hiro', 'Tanaka', 4000, 4.1, 6, 'Japan'),
(8, 'Hans', 'Muller', 3000, 4.0, 7, 'Germany'),
(9, 'Emily', 'Brown', 2000, 4.4, 8, 'UK'),
(10, 'Sophie', 'Martin', 1500, 4.6, 9, 'France');

#1.Print the first three characters of Country_name from the Country table.

SELECT LEFT(Country_name, 3) AS FirstThreeChars FROM Country;

#2. Concatenate Fname and Lname from Persons table.

SELECT CONCAT(Fname, ' ', Lname) AS FullName FROM Persons;

#3. Count the number of unique Country_name from Persons table.
SELECT COUNT(DISTINCT Country_name) AS UniqueCountryNames FROM Persons;

#4. Print the maximum Population from the Country table.
SELECT MAX(Population) AS MaxPopulation FROM Country;

#5.Print the minimum Population from the Persons table.
SELECT MIN(Population) AS MinPopulation FROM Persons;
#6.Insert 2 new rows with Lname as NULL, then count Lname.
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(11, 'Tom', NULL, 2500, 3.8, 10, 'Australia'),
(12, 'Jerry', NULL, 1500, 3.7, 9, 'France');

SELECT COUNT(Lname) AS NonNullLnameCount FROM Persons;
#7.Find the number of rows in the Persons table.
SELECT COUNT(*) AS TotalRows FROM Persons;
#8.Show the population of the Country table for the first 3 rows.
SELECT Population FROM Country LIMIT 3;
#9.Print 3 random rows from the Country table.
SELECT * FROM Country ORDER BY RAND() LIMIT 3;
#10.List all persons ordered by their Rating in descending order.

SELECT * FROM Persons ORDER BY Rating DESC;
#11.Find the total Population for each Country in the Persons table.
SELECT Country_name, SUM(Population) AS TotalPopulation
FROM Persons
GROUP BY Country_name;

#12.Find countries in the Persons table with a total Population greater than 50,000.
SELECT Country_name, SUM(Population) AS TotalPopulation
FROM Persons
GROUP BY Country_name
HAVING TotalPopulation > 50000;

#13.List the total number of persons and average rating for each country with more than 2 persons, ordered by average rating ascending.

SELECT Country_name, COUNT(*) AS TotalPersons, AVG(Rating) AS AvgRating
FROM Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY AvgRating ASC;



















