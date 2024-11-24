#Create a database named School
CREATE DATABASE School;
USE School;

#Create the STUDENT table

CREATE TABLE STUDENT (
    Roll_No INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT,
    Grade CHAR(1)
);

 #Insert sample data into the STUDENT table
 INSERT INTO STUDENT (Roll_No, Name, Marks, Grade) VALUES
(1, 'Alice', 85, 'A'),
(2, 'Bob', 78, 'B'),
(3, 'Charlie', 92, 'A'),
(4, 'Daisy', 65, 'C');
#Display the table using the SELECT command
SELECT * FROM STUDENT;

#Add a column named Contact to the STUDENT table
ALTER TABLE STUDENT ADD Contact VARCHAR(15);

#Remove the Grade column from the STUDENT table
ALTER TABLE STUDENT DROP COLUMN Grade;

 #Rename the table to CLASSTEN
 ALTER TABLE STUDENT RENAME TO CLASSTEN;
 
 #Delete all rows from the CLASSTEN table
 TRUNCATE TABLE CLASSTEN;
  #Remove the table from the database
  DROP TABLE CLASSTEN;











