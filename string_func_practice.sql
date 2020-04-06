-- String functions Excersice
SELECT REVERSE(UPPER('Why does my cat look at me with such hatred?'));

SELECT title, CHAR_LENGTH(title) AS 'character count' FROM books;


-- Create a new table woth first column the shorten title and second column author name and the third quantity
SELECT CONCAT(
	SUBSTRING(title, 1,10),'...') AS 'Short Title', 
	CONCAT(author_lname,',',author_fname) AS author, 
	CONCAT_WS(' ',stock_quantity, 'in', 'stock') AS quantity
		FROM books;