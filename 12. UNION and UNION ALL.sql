USE startersql;

CREATE TABLE admin_users (
id INT PRIMARY KEY,
	name VARCHAR(100),
	email VARCHAR(100),
	gender ENUM('Male', 'Female', 'Other'),
	date_of_birth DATE,
	salary INT
);

INSERT INTO admin_users (id, name, email, gender, date_of_birth, salary) VALUES
(101, 'Anil Kumar', 'anil@example.com', 'Male', '1985-04-12', 60000),
(102, 'Pooja Sharma', 'pooja@example.com', 'Female', '1992-09-20', 58000),
(103, 'Rakesh Yadav', 'rakesh@example.com', 'Male', '1989-11-05', 54000),
(104, 'Fatima Begum', 'fatima@example.com', 'Female', '1990-06-30', 62000);

SELECT * FROM addresses;
SELECT * FROM users;
SELECT * FROM admin_users;

-- UNION operator in SQL is used to combine the result sets of two or more SELECT statements.
-- It removes duplicates by default.
SELECT name, email FROM users
UNION
SELECT name, email FROM admin_users;


-- If you want duplicates too (if any), then use UNION ALL
SELECT name FROM users
UNION ALL
SELECT name FROM admin_users;


-- Adding 'roles' column to distinguish
SELECT name, 'User' AS role FROM users
UNION
SELECT name, 'Admin' AS role FROM admin_users;


-- Using ORDER BY with UNION
SELECT name, date_of_birth, 'User' AS role FROM users
UNION
SELECT name, date_of_birth, 'Admin' AS role FROM admin_users
ORDER BY date_of_birth;   -- will order w.r.t dob in ascending order

-- The number of columns and their data types must match in all SELECT statements.
-- Means UNION & UNION ALL can be performed only on similar type of tables.

-- UNION -> removes duplicates by default.
-- UNION ALL -> keeps duplicates.
