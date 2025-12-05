USE startersql;

-- A stored procedure is a saved SQL block that can be executed later. It’s useful
-- when you want to encapsulate logic that can be reused multiple times — like
-- queries, updates, or conditional operations.

-- we need to change the delimiter to a custom sign so that
-- inner query ending sign that is ';' doesn't clash with Procedure ending sign


-- Syntax for creating a stored procedure
-- DELIMITER $$     -- Procedure ending sign '$$' defined here
-- CREATE PROCEDURE procedure_name()
-- BEGIN
-- -- SQL statements go here
-- END$$
-- DELIMITER ;



DELIMITER $$
CREATE PROCEDURE AddUser(
 IN p_name VARCHAR(100),
 IN p_email VARCHAR(100),
 IN p_gender ENUM('Male', 'Female', 'Other'),
 IN p_dob DATE,
 IN p_salary INT
)
BEGIN
 INSERT INTO users (name, email, gender, date_of_birth, salary)
 VALUES (p_name, p_email, p_gender, p_dob, p_salary);
 SELECT * FROM users;
END$$
DELIMITER ;

CALL AddUser('Kiran Sharma', 'kiran@example.com', 'Female', '1994-06-15', 72000);
-- Kiran Sharma row added and also the whole table is printed


-- Showing all the available procedures created earlier
SHOW PROCEDURE STATUS WHERE Db = 'startersql';


-- Dropping a Stored Procedure
DROP PROCEDURE IF EXISTS AddUser;


-- View: A saved SELECT query that behaves like a virtual table.
-- Function: A routine that must return a value and cannot modify data.
-- Procedure: A program-like routine that can modify data and doesn’t need to return anything.

