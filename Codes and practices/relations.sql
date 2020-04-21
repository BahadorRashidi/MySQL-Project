CREATE TABLE customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(100),
    lname VARCHAR(100),
    email VARCHAR(100)
);




CREATE TABLE orders (
	id INT PRIMARY KEY AUTO_INCREMENT,
	order_date DATE,
	amount DECIMAL(8,2),
	customer_id INT,
	FOREIGN KEY(customer_id) REFERENCES customer(id)
);

INSERT INTO customer (fname, lname, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
	   
	   
	   
SELECT * FROM oreders WHERE customer_id = 1;

SELECT * FROM orders WHERE customer_id = 
	(
	SELECT id FROM customer WHERE lname = 'George'
	);
	
	
	
SELECT * FROM customer, orders;
	



SELECT * FROM customer, orders WHERE customer.id = orders.customer_id;

	
	
	
	
	
	
	
