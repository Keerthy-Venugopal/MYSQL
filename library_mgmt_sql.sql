# 1: Create the Database

CREATE DATABASE library;
USE library;

# 2: Create Tables with Attributes
# 1. Branch Table

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

# 2. Employee Table

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

# 3. Books Table

CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3),  -- 'Yes' or 'No'
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

# 4. Customer Table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

# 5. IssueStatus Table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

# 6. ReturnStatus Table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

# Step 3: Populate the Tables

#1. Branch Table

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) 
VALUES 
(1, 101, '123 Library Street, Alappuzha', '9876543210'),
(2, 102, '456 Knowledge Avenue, Kochi', '8765432109'),
(3, 103, '789 Book Lane, Trivandrum', '7654321098');

#2. Employee Table

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) 
VALUES 
(201, 'John Doe', 'Manager', 60000, 1),
(202, 'Jane Smith', 'Librarian', 40000, 1),
(203, 'Robert Brown', 'Assistant', 35000, 2),
(204, 'Emily Davis', 'Librarian', 45000, 2),
(205, 'Michael Johnson', 'Manager', 70000, 3);

# 3. Books Table

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) 
VALUES 
(111, 'Python Programming', 'Technology', 30, 'Yes', 'Guido van Rossum', 'TechBooks'),
(112, 'Data Science Handbook', 'Technology', 40, 'No', 'Jake VanderPlas', 'SciPress'),
(113, 'History of India', 'History', 25, 'Yes', 'Ramachandra Guha', 'HistPub'),
(114, 'Advanced Mathematics', 'Mathematics', 35, 'Yes', 'R. K. Jain', 'MathPress'),
(115, 'Machine Learning Guide', 'Technology', 45, 'No', 'Andrew Ng', 'MLBooks');

# 4. Customer Table

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) 
VALUES 
(301, 'Alice Green', '123 Ocean View, Alappuzha', '2021-12-15'),
(302, 'Bob White', '456 Sunset Boulevard, Kochi', '2022-03-10'),
(303, 'Charlie Black', '789 Horizon Drive, Trivandrum', '2020-11-20'),
(304, 'Daisy Yellow', '321 Moon Street, Alappuzha', '2021-06-05');

# 5. IssueStatus Table

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) 
VALUES 
(401, 301, 'Data Science Handbook', '2023-06-10', 112),
(402, 303, 'History of India', '2023-06-15', 113),
(403, 302, 'Machine Learning Guide', '2023-07-01', 115);

# 6. ReturnStatus Table

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) 
VALUES 
(501, 301, 'Data Science Handbook', '2023-07-15', 112),
(502, 303, 'History of India', '2023-06-25', 113);

# 4: Write Queries

# 1. Retrieve the book title, category, and rental price of all available books.

SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'Yes';

# 2. List the employee names and their respective salaries in descending order of salary.

SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

# 3. Retrieve the book titles and the corresponding customers who have issued those books.

SELECT B.Book_title, C.Customer_name
FROM Books B
JOIN IssueStatus I ON B.ISBN = I.Isbn_book
JOIN Customer C ON I.Issued_cust = C.Customer_Id;

# 4. Display the total count of books in each category.

SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

# 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.

SELECT C.Customer_name
FROM Customer C
LEFT JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE C.Reg_date < '2022-01-01' AND I.Issue_Id IS NULL;

# 7. Display the branch numbers and the total count of employees in each branch.

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

# 8. Display the names of customers who have issued books in the month of June 2023.

SELECT DISTINCT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE MONTH(I.Issue_date) = 6 AND YEAR(I.Issue_date) = 2023;

# 9. Retrieve book titles from the book table containing the word 'history'.

SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

# 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

# 11. Retrieve the names of employees who manage branches and their respective branch addresses.

SELECT E.Emp_name, B.Branch_address
FROM Employee E
JOIN Branch B ON E.Emp_Id = B.Manager_Id;

# 12. Display the names of customers who have issued books with a rental price higher than Rs. 25.

SELECT DISTINCT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
JOIN Books B ON I.Isbn_book = B.ISBN
WHERE B.Rental_Price > 25;



















