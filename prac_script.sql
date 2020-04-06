-- source C:/Users/Bahador/Desktop/GoogleDrive/MySQL Course/Priliminaries Code/MySQL-Project/prac_script.sql;

/*
SELECT 
	CONCAT(
		SUBSTRING(title, 1, 10), 
		'...') AS 'short title'
FROM books;

*/


/*
SELECT CONCAT(SUBSTRING(REPLACE(title,'e','3'),1,10),'...') FROM books;

SELECT CONCAT_WS
	(' ', author_fname, 'is', CHAR_LENGTH(author_fname), 'characters long') 
	AS new_info 
	FROM books;
*/

-- =========================================================
-- Practice chapter 8, DISTINCT, ORDER BY, LIKE and LIMIT
-- =========================================================

/*
-- Find the titles with the word stories
SELECT title FROM books WHERE title like '%stories%';


-- find the longest title 
SELECT title , pages FROM books ORDER BY pages DESC LIMIT 1;




--- 

SELECT CONCAT(title, ' - ', released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3;

-- 
SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';



SELECT title, released_year, stock_quantity FROM books ORDER BY 3 LIMIT 0,3;



SELECT title, author_lname FROM books ORDER BY 2,1;
*/

SELECT CONCAT('MY FAVORITE AUTHOR IS ', author_fname, ' ',author_lname,'!') AS yell FROM books ORDER BY author_lname; 













