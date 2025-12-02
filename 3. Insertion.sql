CREATE DATABASE IF NOT EXISTS startersql;
USE startersql;
SELECT * FROM users;

-- Performing CRUD operation on a database...
-- Create, Read, Update, Delete


-- Inserting a single row value into the table
INSERT INTO users VALUES
(1, 'Anindya', 'anindya@gmail.com', 'Male', '2004-08-01', DEFAULT);
SELECT * FROM users;

-- not inserting any column value will be filled using 'null'
INSERT INTO users (name, email, gender) VALUES
('John', 'john@gmail.com', 'Male');   --  dob is null

-- we've used auto incrementer for id, let's take advantage of that while inserting multiple rows
INSERT INTO users (name, email, gender, date_of_birth) VALUES
('Akhil', 'akhil@gmail.com', 'Male', '1975-05-05'),
('Alice', 'alice@gmail.com', 'Male', '2003-04-02');

