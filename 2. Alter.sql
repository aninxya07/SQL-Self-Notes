-- Databases -> Tables -> Rows and cols

CREATE DATABASE ANINDYA;
USE ANINDYA;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM users;    -- for printing the whole table
-- SELECT id, email FROM users;  -- for printing only the required cols

-- DROP DATABASE ANINDYA;      -- for deleting the entire database (use with caution!!)
-- DROP TABLE users;           -- for deleting the entire table (use with caution!!)

RENAME TABLE users TO customers;   -- for renaming an existing table name

ALTER TABLE customers ADD COLUMN is_active BOOLEAN DEFAULT TRUE;   -- ALTER is used for modifying an existing table

-- ALTER TABLE customers DROP COLUMN is_active;  -- to delete a column from an existing table

ALTER TABLE customers MODIFY COLUMN name VARCHAR(150);  -- changed the length from 100 to 150
SELECT * FROM customers;

-- rearranging the position of the columns in a table
-- taking email col and putting it after id col (previosuly it was after name column)
-- we need to mention it's data type too, which we defined earlier
ALTER TABLE customers MODIFY COLUMN email VARCHAR(100) AFTER id;
SELECT * FROM customers;

-- now we want the dob as the first col
ALTER TABLE customers MODIFY COLUMN date_of_birth DATETIME FIRST;
SELECT * FROM customers;
