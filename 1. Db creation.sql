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

