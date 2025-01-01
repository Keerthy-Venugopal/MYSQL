create database triggers;

use triggers;

-- Step 1: Create the 'teachers' table
CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    subject VARCHAR(100) NOT NULL,
    experience INT NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- Insert 8 rows into the 'teachers' table
INSERT INTO teachers (name, subject, experience, salary) VALUES
('Alice', 'Mathematics', 5, 45000),
('Bob', 'Physics', 12, 60000),
('Charlie', 'Chemistry', 8, 52000),
('Diana', 'Biology', 3, 40000),
('Ethan', 'Computer Science', 10, 70000),
('Fiona', 'History', 15, 50000),
('George', 'English', 2, 35000),
('Hannah', 'Geography', 7, 48000);

-- Step 2: Create a BEFORE INSERT trigger to ensure salary is not negative
DELIMITER $$
CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END$$
DELIMITER ;

-- Step 3: Create the 'teacher_log' table
CREATE TABLE teacher_log (
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME,
    PRIMARY KEY (teacher_id, timestamp)
);

-- Step 3: Create an AFTER INSERT trigger to log the action
DELIMITER $$
CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END$$
DELIMITER ;

-- Step 4: Create a BEFORE DELETE trigger to prevent deletion of experienced teachers
DELIMITER $$
CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a teacher with more than 10 years of experience';
    END IF;
END$$
DELIMITER ;

-- Step 5: Create an AFTER DELETE trigger to log the deletion
DELIMITER $$
CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END$$
DELIMITER ;
