USE startersql;

-- A subquery is a query nested inside another query.
-- Subqueries are useful for breaking down complex problems into smaller parts.

-- Return the name of those who earn more than avg salary of all users
SELECT id, name, salary
FROM users
WHERE salary > (
 SELECT AVG(salary) FROM users  -- subquery
);

-- Subquery with IN
-- Give information about all the users who were referred by users
-- whose salary were greater than 60000
SELECT id, name, referred_by_id
FROM users
WHERE referred_by_id IN (
 SELECT id FROM users WHERE salary > 60000
);

-- Give information about all the users who were referred by users
-- whose salary were greater than avg salary of all users
SELECT id, name, referred_by_id
FROM users
WHERE referred_by_id IN (
	SELECT id FROM users WHERE salary > (SELECT AVG(salary) FROM users)
);
