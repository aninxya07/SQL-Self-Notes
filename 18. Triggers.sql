--  A trigger is a special kind of stored program that is automatically executed
-- (triggered) when a specific event occurs in a table — such as INSERT , UPDATE , or DELETE

-- Basic Trigger Structure
CREATE TRIGGER trigger_name
AFTER INSERT ON table_name
FOR EACH ROW
BEGIN
-- statements to execute
END;


USE startersql;

CREATE TABLE user_log(
	id INT AUTO_INCREMENT PRIMARY KEY,
	user_id INT,
	name VARCHAR(100),
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER after_user_insert
AFTER INSERT on users
FOR EACH ROW
BEGIN
	INSERT INTO user_log(user_id, name)
	VALUES(NEW.id, NEW.name);
    -- when entering a new entry in the 'users' table, take the id and name and put it inside the 'user_log' table automatically for each new entry
END $$

DELIMITER ;



INSERT INTO users(name, email, gender, date_of_birth, salary) VALUES
('Rohan', 'rohan@email.com', 'Male', '2007-04-04', 56000);

-- Upon inserting a new row in the 'users' table, a new entry will also be created in the 'user_log' table

SELECT * FROM users;
SELECT * FROM user_log;


DROP TRIGGER IF EXISTS after_user_insert;