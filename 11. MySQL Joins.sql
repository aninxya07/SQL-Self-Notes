USE startersql;

-- JOINs are used to combine rows from two or more tables based on related
-- columns — usually a foreign key in one table referencing a primary key in another

SELECT * FROM users;
SELECT * FROM addresses;


-- INNER JOIN
-- Returns only rows where both tables have a match.
SELECT users.name, addresses.city
FROM users
INNER JOIN addresses ON users.id = addresses.user_id;


-- LEFT JOIN
-- Returns all rows from left table with matched rows from right (NULL if no match)
SELECT users.name, addresses.city
FROM users
LEFT JOIN addresses ON users.id = addresses.user_id;


-- RIGHT JOIN
-- Returns all rows from right table with matched rows from left (NULL if no match)
SELECT users.name, addresses.city
FROM users
RIGHT JOIN addresses ON users.id = addresses.user_id;


-- SELF JOIN
-- A Self JOIN is a regular join, but the table is joined with itself.

ALTER TABLE users
ADD COLUMN referred_by_id INT;
SELECT * FROM users;

UPDATE users SET referred_by_id = 1 WHERE id IN (2, 3, 14, 20, 18); 		-- User 1 referred Users 2 and 3
UPDATE users SET referred_by_id = 2 WHERE id IN (4, 10, 12, 16, 17); 				-- User 2 referred User 4


-- We want to get each user’s name along with the name of the person who referred them
-- we can use LEFT or RIGHT JOIN too in case of INNER JOIN
SELECT
	a.id,
	a.name AS user_name,
	b.name AS referred_by
FROM users a
INNER JOIN users b ON a.referred_by_id = b.id;
