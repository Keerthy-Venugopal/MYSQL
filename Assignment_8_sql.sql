use school;
 #1. Find the number of persons in each country.
 
 SELECT Country_name, COUNT(*) AS NumberOfPersons
FROM Persons
GROUP BY Country_name;
#2.Find the number of persons in each country sorted from high to low.
SELECT Country_name, COUNT(*) AS NumberOfPersons
FROM Persons
GROUP BY Country_name
ORDER BY NumberOfPersons DESC;
#3. Find the average rating for persons in respective countries if the average is greater than 3.0.
SELECT Country_name, AVG(Rating) AS AverageRating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;
#4. Find the countries with the same rating as the USA (Use Subqueries).
SELECT DISTINCT Country_name
FROM Persons
WHERE Rating IN (
    SELECT DISTINCT Rating
    FROM Persons
    WHERE Country_name = 'USA'
);
#5. Select all countries whose population is greater than the average population of all nations.
SELECT Country_name, Population
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);

#Product Database and Customer Table

#Create Database and Table
-- Create the Product database
CREATE DATABASE Product;

-- Switch to Product database
USE Product;

-- Create the Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(255),
    Last_name VARCHAR(255),
    Email VARCHAR(255),
    Phone_no VARCHAR(15),
    Address TEXT,
    City VARCHAR(100),
    State VARCHAR(100),
    Zip_code VARCHAR(20),
    Country VARCHAR(100)
);
#1. Create a view named customer_info for the Customer table that displays Customer’s full name and email address. Perform the SELECT operation for the customer_info view.
-- Create the customer_info view
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS FullName, Email
FROM Customer;

-- Perform the SELECT operation
SELECT * FROM customer_info;

#2. Create a view named US_Customers that displays customers located in the US.
-- Create the US_Customers view
CREATE VIEW US_Customers AS
SELECT * 
FROM Customer
WHERE Country = 'USA';

#3. Create another view named Customer_details with columns full name (Combine first_name and last_name), email, phone_no, and state.
-- Create the Customer_details view
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS FullName, 
       Email, 
       Phone_no, 
       State
FROM Customer;

#4.Update phone numbers of customers who live in California for Customer_details view.
UPDATE Customer
SET Phone_no = '12345'
WHERE State = 'California';

#5.Count the number of customers in each state and show only states with more than 5 customers.
SELECT State, COUNT(*) AS CustomerCount
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

#6.Write a query that will return the number of customers in each state based on the state column in the Customer_details view.
SELECT State, COUNT(*) AS CustomerCount
FROM Customer_details
GROUP BY State;

#7.Write a query that returns all columns from the Customer_details view, sorted by the state column in ascending order.
SELECT *
FROM Customer_details
ORDER BY State ASC;

