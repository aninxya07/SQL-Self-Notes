use startersql;
SELECT * FROM starter;

-- SQL functions help in analyzing, summerizing data in tables

-- 1. AGGREGATE FUNCTIONS -> Returns a single value from a set of rows
-- i. COUNT()
SELECT COUNT(*) FROM starter;
SELECT COUNT(*) FROM starter WHERE gender='Male';   -- gives the total no of males


-- ii MIN
SELECT MIN(salary) AS min_salary FROM starter;


-- iii. MAX
SELECT MAX(salary) AS max_salary FROM starter;


-- iv. SUM
SELECT SUM(salary) AS total_salary FROM starter;


-- v. AVG
SELECT AVG(salary) AS avg_salary FROM starter;


-- if you want more col data, you need to use AGGREGATE FUNCTION + GROUP BY
-- avg salary given to each gender
SELECT gender, AVG(salary) AS avg_sal FROM starter GROUP BY gender;

-- total salary given to each gender
SELECT gender, SUM(salary) AS total_sal FROM starter GROUP BY gender;

-- 2. STRING FUNCTIONS
-- i. LENGTH
SELECT name, LENGTH(name) AS name_len FROM starter;
SELECT id, gender, name, LENGTH(name) AS name_len FROM starter;


-- ii. LOWER
SELECT id, LOWER(name) AS name_lower FROM starter;


-- iii. UPPER
SELECT id, UPPER(name) AS name_upper FROM starter;


-- iv. CONCAT
SELECT id, name, CONCAT(name, "CR7") username FROM starter;


-- 3. DATE FUNCTIONS
-- i. NOW -> for printing current time
SELECT name, NOW() AS time FROM starter;


-- ii. YEAR
SELECT name, YEAR(NOW()) AS year FROM starter;
SELECT name, YEAR(date_of_birth) AS yob FROM starter;    -- takes everyone's year of birth from the col dob


-- iii. DAY
SELECT name, DAY(date_of_birth) AS dob FROM starter;    -- takes everyone's date of birth from the col dob


-- iv. MONTH
SELECT name, MONTH(date_of_birth) AS mob FROM starter;    -- takes everyone's month of birth from the col dob



-- Combining all this
SELECT name, DAY(date_of_birth) AS dob, MONTH(date_of_birth) AS mob, YEAR(date_of_birth) AS yob, date_of_birth FROM starter;


-- v. DATEDIFF
SELECT name, DATEDIFF(CURDATE(), date_of_birth) AS date_spend, YEAR(date_of_birth) AS born_in FROM starter;


-- vi. TIMESTAMPDIFF
SELECT name, TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age, YEAR(date_of_birth) AS born_in FROM starter;


-- 4. MATHEMATICAL FUNCTIONS
-- i. ROUND
-- Rounds a number to the nearest integer (or to given decimal places if specified). 3.4 -> 3, 3.6 -> 4
-- ROUND(3.456, 2) = 3.46 (round to 2 decimal places)
SELECT name, salary, ROUND(salary) AS rounded FROM starter;


-- ii. FLOOR
-- Always rounds DOWN to the nearest integer (towards negative infinity).   3.8 -> 3, -3.1 -> -4, 3.1 -> 3
SELECT name, salary, FLOOR(salary) AS rounded FROM starter;


-- iii. CEIL
-- Always rounds UP to the nearest integer (towards positive infinity). 3.2 -> 4, 3.9 -> 4, -3.2 -> -3
SELECT name, salary, CEIL(salary) AS rounded FROM starter;


-- iv. MOD   7/2 = (2 x 3) + 1 = remainder is 1
SELECT id, MOD(id, 2) AS remainder FROM starter;


-- 5. CONDITIONAL FUNCTIONS
-- i. IF  -> IF(condition, value_if_true, value_if_false)
SELECT name, gender, IF(gender = 'Female', 'Yes', 'No') AS is_female FROM starter;