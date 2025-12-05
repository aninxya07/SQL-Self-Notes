USE startersql;


-- Indexes in MySQL are used to speed up data retrieval. They work like the index of
-- a book — helping the database engine find rows faster, especially for searches, filters, and joins.


SHOW INDEXES FROM users;    -- id & email columns are indexes here


-- Suppose you’re frequently searching users by their gender .
-- You can speed this up by indexing the gender column.
CREATE INDEX idx_gender ON users(gender);

-- Indexes consume extra disk space
-- Indexes slow down INSERT , UPDATE , and DELETE operations slightly (because the index must be updated)
-- Use indexes only when needed (i.e., for columns used in WHERE , JOIN , ORDER BY )


-- Multi Column Index
-- If you often query users using both gender and salary ,
-- a multi-column index is more efficient than separate indexes.
CREATE INDEX idx_gender_salary ON users(gender, salary);
SHOW INDEXES FROM users;  


SELECT * FROM users WHERE gender = 'Female' AND salary > 70000;
-- For using an multi column index efficiently we should maintain the order while fetching
-- something from the table, like firstly gender and then keeping the salary

-- if we enter only a single attribute for fetching, indexing may not be effective
-- in case of multi column indexes


-- To drop an index
DROP INDEX idx_gender_salary ON users;
DROP INDEX idx_gender ON users;
SHOW INDEXES FROM users;
