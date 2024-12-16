use school;
#1. Perform INNER JOIN, LEFT JOIN, and RIGHT JOIN on the Country and Persons tables.
#INNER JOIN:
SELECT Country.Id AS CountryId, Country.Country_name, Persons.Fname, Persons.Lname, Persons.Rating
FROM Country
INNER JOIN Persons
ON Country.Id = Persons.Country_Id;

#LEFT JOIN:
SELECT Country.Id AS CountryId, Country.Country_name, Persons.Fname, Persons.Lname, Persons.Rating
FROM Country
LEFT JOIN Persons
ON Country.Id = Persons.Country_Id;

#RIGHT JOIN
SELECT Country.Id AS CountryId, Country.Country_name, Persons.Fname, Persons.Lname, Persons.Rating
FROM Country
RIGHT JOIN Persons
ON Country.Id = Persons.Country_Id;

 #2.List all distinct country names from both Country and Persons tables.
 SELECT Country_name FROM Country
UNION
SELECT Country_name FROM Persons;

#3.List all country names from both Country and Persons tables, including duplicates.
SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;

#4. Round the ratings of all persons to the nearest integer in the Persons table.
SELECT Id, Fname, Lname, Population, ROUND(Rating) AS RoundedRating, Country_Id, Country_name
FROM Persons;







