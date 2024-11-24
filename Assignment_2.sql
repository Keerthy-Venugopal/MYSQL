#Create a database named Sales
CREATE DATABASE Sales;
USE Sales;

-- Create the Orders table with constraints
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY, -- Primary Key Constraint
    Customer_name VARCHAR(100) NOT NULL, -- Not Null Constraint
    Product_Category VARCHAR(50),
    Ordered_item VARCHAR(100) NOT NULL,
    Contact_No VARCHAR(15) UNIQUE -- Unique Constraint
);

-- Add a new column named order_quantity to the Orders table
ALTER TABLE Orders ADD order_quantity INT;

 -- Rename the Orders table to sales_orders
 ALTER TABLE Orders RENAME TO sales_orders;
 
-- Insert 10 rows into the sales_orders table
INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity)
VALUES
(1, 'Alice', 'Electronics', 'Smartphone', '1234567890', 2),
(2, 'Bob', 'Furniture', 'Dining Table', '1234567891', 1),
(3, 'Charlie', 'Books', 'Programming Book', '1234567892', 3),
(4, 'Daisy', 'Clothing', 'T-Shirt', '1234567893', 4),
(5, 'Edward', 'Electronics', 'Laptop', '1234567894', 1),
(6, 'Fiona', 'Furniture', 'Chair', '1234567895', 6),
(7, 'George', 'Groceries', 'Rice', '1234567896', 10),
(8, 'Hannah', 'Clothing', 'Jeans', '1234567897', 2),
(9, 'Ian', 'Books', 'Notebook', '1234567898', 5),
(10, 'Jane', 'Electronics', 'Tablet', '1234567899', 1);

-- Retrieve Customer_name and Ordered_Item from the sales_orders table
SELECT Customer_name, Ordered_item FROM sales_orders;

-- Update the product name for any row
UPDATE sales_orders
SET Ordered_item = 'MySQL Book'
WHERE Order_Id = 3;

-- Delete the sales_orders table from the database
DROP TABLE sales_orders;






