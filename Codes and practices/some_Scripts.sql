CREATE TABLE cats (
	cat_id INT NOt NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(150),
	breed VARCHAR(150),
	age INT);


INSERT INTO cats (name, breed, age) VALUES
	('blue', 'persian', 2),
	('peach', 'bingo', 4),
	('rex', 'tingo',5),
	('shelby', 'persian',2),
	('plato', 'german',11);


DROP DATABASE IF EXISTS test_app;
CREATE DATABASE test_app;
use test_app;