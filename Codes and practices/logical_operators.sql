SELECT title, author_fname, CASE
    WHEN title LIKE '%stories%' THEN 'SHORT Stories'
    WHEN title LIKE '%Memoir%' THEN 'Memoiri'
    ELSE 'EVErtyhing else' 
    END AS 'TYPE'
    FROM books;



SELECT title, author_lname, CONCAT(count(*), ' ', CASE
    WHEN count(*) <= 1 THEN 'book'
    ELSE 'books'
    END) As 'count'
    FROM books GROUP BY author_fname, author_lname;
