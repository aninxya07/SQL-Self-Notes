USE startersql;

-- A view in MySQL is a virtual table based on the result of a SELECT query.
-- It does not store data itself — it always reflects the current data in the base tables.

-- Views are useful when:
-- 		1. You want to simplify complex queries
-- 		2. You want to reuse logic
-- 		3. You want to hide certain columns from users
-- 		4. You want a “live snapshot” of filtered data

-- Views are generally used to reuse repeated complex queries (here taking a simpler example)
CREATE VIEW rich_users AS
SELECT * FROM users WHERE salary>70000;  -- will create a view in the left naviagation panel under 'Views'

-- we can use this view as a table, but it's not an actual table (Virtual Table)
SELECT * FROM rich_users;

-- Here Ananya (id=2) has salary of 72k
-- if we modify her salary to 30k in the original 'users' table and print the view again...
-- Ananaya's name will be vanished from the 'rich_users' view
-- This is called 'live snapshot' feature of Views (real time update reflection)

-- UPDATE users SET salary=30000 WHERE id=2;
-- SELECT * FROM rich_users;


-- We can also drop an existing VIEW
DROP VIEW rich_users;

