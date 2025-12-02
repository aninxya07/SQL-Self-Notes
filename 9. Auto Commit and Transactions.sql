USE startersql;
SELECT * FROM starter;

-- When you're performing any crucial task, and you don't wanna mess up things always set autocommit to 'OFF'
-- SET autocommit = 0   by default MySQL uses autocommit as 'ON' but if we need it we can set it to 'OFF'
-- COMMIT : After each query when you write COMMIT, then only the query/transaction gets permanently executed
-- ROLLBACK : If you think any mistake occured, so use this to restore back to last COMMIT stage


-- Suppose we want to delete Fardhan (id=5), but accidentaly we deleted Priyanka (id=6), let's handle this
SET autocommit = 0;
SELECT * FROM starter;
COMMIT;   -- Saving a checkpoint when everything was perfect
DELETE FROM starter WHERE id=6;   
SELECT * FROM starter;		-- Oops! Priyanka deleted
ROLLBACK;   -- Rolling back to the last COMMIT when everything was perfectly working
SELECT * FROM starter;    -- As we can see, we're now back to the last commited state again using ROLLBACK
DELETE FROM starter WHERE id=5;   -- let's try to delete again but this time correctly lol
SELECT * FROM starter;	-- Now the current row which we were wanting has been deleted 
COMMIT;    -- let's finally COMMIT this (after hitting COMMIT if we again use ROLLBACK we can't go to previous COMMIT)
SET autocommit = 1;   -- again setting it to 1 for MySQL's default workflow