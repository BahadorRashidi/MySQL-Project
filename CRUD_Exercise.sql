 CREATE DATABASE shirts_db;
 
 CREATE TABLE short (
	shirt_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	article VARCHAR(50) NOT NULL,
	color VARCHAR(50),
	shirt_size VARCHAR(50),
	last_worn INT(10));
	
	
INSERT INTO shirts (article, color, shirt_Size, last_Worn) VALUES
		('t-shirt', 'white', 'S', 10),
		('t-shirt', 'green', 'S', 200),
		('polo shirt', 'black', 'M', 10),
		('tank top', 'blue', 'S', 50),
		('t-shirt', 'pink', 'S', 0),
		('polo shirt', 'red', 'M', 5),
		('tank top', 'white', 'S', 200),
		('tank top', 'blue', 'M', 15);
		
-- Doing some custome CRUD actions

INSERT INTO shirts (article, clor, shirt_size, last_worn) VALUES ('tank shirt','red','M',125);


SELECT article, shirt_size FROM shirts WHERE shirt_size = 'M';


--  update the size of the shirt with the size M

SELECT * FROM shirts WHERE article = 'polo shirts';


UPDATE shirts SET color= 'off white', shirt_size= 'XL' WHERE color= 'white';


