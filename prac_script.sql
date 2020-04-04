-- C:\Users\Bahador\Desktop\GoogleDrive\MySQL Course\Priliminaries Code\MySQL-Project\prac_script.sql

/*
SELECT 
	CONCAT(
		SUBSTRING(title, 1, 10), 
		'...') AS 'short title'
FROM books;

*/

SELECT CONCAT(SUBSTRING(REPLACE(title,'e','3'),1,10),'...') FROM books;

SELECT CONCAT_WS
	(' ', author_fname, 'is', CHAR_LENGTH(author_fname), 'characters long') 
	AS new_info 
	FROM books;