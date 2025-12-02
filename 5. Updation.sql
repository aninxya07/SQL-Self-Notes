USE startersql;
SELECT * FROM starter;

-- Updating our data...
UPDATE starter SET salary=45000;   -- it'll change the whole table's salary to 45k which we don't want
UPDATE starter SET salary=45000 WHERE id=2;   -- that's why we use UPDATE with WHERE
SELECT * FROM starter;

-- we can update multiple values at the same time
UPDATE starter SET salary='73000', email='aarav@yahoo.com' WHERE id=1;
SELECT * FROM starter;

-- set the salary to 70k where id is 5
UPDATE starter SET salary=70000 WHERE id=5;
SELECT * FROM starter;


-- change the name of the user with email 'aisha@example.com' to Aisha Khan (id=7 to find in table)
UPDATE starter SET name='Aisha Khan' WHERE email='aisha@example.com';


-- increase salary by 10000 whose salary is less than 60000
SET SQL_SAFE_UPDATES = 0;   -- to turn off safe update mode, for the queries which effect the entire table
UPDATE starter SET salary=salary+10000 WHERE salary<60000;
SELECT * FROM starter;


-- set the gender of Ishaan to Other
UPDATE starter SET gender='Other' WHERE name='Ishaan' AND email='ishaan@example.com';
SELECT * FROM starter;


-- take a moment before running a query that affects the entire table, most of the times everything is used with WHERE to stay safe


