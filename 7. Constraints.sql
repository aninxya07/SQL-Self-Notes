USE startersql;
-- Types of constraints in SQL

-- 1. UNIQUE : To set every values in a column unique from each other

-- CREATE TABLE users
-- (
-- 	id INT PRIMARY KEY,
--     email VARCHAR(20) UNIQUE
-- );
-- or we can define the constraint externally if not during table creation:
-- ALTER TABLE users ADD CONSTRAINT unique_email UNIQUE (email);



-- 2. NOT NULL : By using this you can't leave a value as null
-- modifying the 'name' column which was not defined as 'not null' earlier
-- ALTER TABLE users MODIFY COLUMN name VARCHAR(100) NOT NULL;



-- 3. CHECK : Ensures that values in a column satisfy a specific condition
-- Allows only date of births after Jan 1, 2000
-- ALTER TABLE users ADD CONSTRAINT chk_dob CHECK (date_of_birth > '2000-01-01');


-- 4. DEFAULT : If user doesn't enter a value, the default value automatically gets filled up
-- CREATE TABLE users (
-- 		created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );


-- 5. PRIMARY KEY : Unique & not null by default, and it is used to identify a row uniquly using this


-- 6. AUTO_INCREMENT : Value gets automatically incremented by 1 in each row (i.e. id, emp_id etc.)


