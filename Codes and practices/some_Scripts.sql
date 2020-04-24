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


CREATE TABLE reviews (
	review_id INT PRIMARY KEY AUTO_INCREMENT,
	review_note VARCHAR(250),
	order_id INT,
	FOREIGN KEY (order_id) REFERENCES orders(id)
	);
	
INSERT INTO reviews (review_note, order_id)


-- implicit joins

SELECT * FROM orders where customer_id = 
	(
	
		SELECT id FROM customer WHERE lname = 'George'
	);
	
-- Explicit joins
SELECT fname, lname, amount FROM customer
	JOIN orders ON customer.id = orders.customer_id;
	
	