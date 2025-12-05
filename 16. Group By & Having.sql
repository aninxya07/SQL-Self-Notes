USE startersql;

-- The GROUP BY clause is used to group rows that have the same values in specified columns.
-- It is typically used with aggregate functions like COUNT , SUM , AVG , MIN , or MAX .

SELECT gender, AVG(salary) AS average_salary FROM users GROUP BY gender;


-- We can't use WHERE after GROUP BY
-- But can use HAVING after GROUP BY
SELECT gender, AVG(salary) AS average_salary
FROM users GROUP BY gender
HAVING AVG(salary) > 62600;   -- HAVING after GROUP BY works like WHERE on GROUP BY

-- HAVING is used to filter Aggregated values which is created by GROUP BY


-- At first group all the users by referred users (shouldn't be null)
-- and give only those referred by groups where count is more than 1
SELECT referred_by_id, COUNT(*) AS total_referred
FROM users
WHERE referred_by_id IS NOT NULL
GROUP BY referred_by_id
HAVING COUNT(*) > 1;   -- Aarav & Ananya -> Referred 5 users


-- ROLLUP
-- To get subtotals and grand totals, you can use ROLLUP :
-- Without Rollup it gives in male and female group there are how many users
-- but using rollup after group by, the no also gets returned in weighted avg
-- like the ount of male count + female count
SELECT gender, COUNT(*) AS total_users
FROM users
GROUP BY gender WITH ROLLUP;
