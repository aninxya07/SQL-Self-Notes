USE startersql;

-- deleting data
-- deleting the rows where salary is less than 65k
DELETE FROM starter WHERE salary<65000;
SELECT * FROM starter;

-- deleting the row where id is 3
DELETE FROM starter WHERE id=3;
SELECT * FROM starter;

-- deleting all the records (just like TRUNCATE)
-- DELETE FROM starter;   -- Not recommended at all!!


-- deleting the table too
-- DROP TABLE starter;    -- think before performing!!!

-- Always perform data back up before performing destructive operations like delete, truncate, drop
-- you can also run SELECT before DELETE to see what rows are gonna delete (clever trick)


