# Logical Operators in MYSQL
This section is about to review the logical operator and some realistic usage of them in mysql.

## Not Equal
```
SELECT title, author_lname FROM books WHERE author_lname = 'Harris';
 
SELECT title, author_lname FROM books WHERE author_lname != 'Harris';
```
## NOT LIKE
```
SELECT title FROM books WHERE title NOT LIKE 'W%';
```
## Greater Than and Less Than
```
SELECT title, released_year FROM books 
WHERE released_year >= 2000 ORDER BY released_year;
```

## AND
&&
we are not limitted to have only 2 components. If it is more than 3 and then your structure is not good and there might be a better choice.
```
SELECT * 
FROM books
WHERE author_lname='Eggers' 
    AND released_year > 2010 
    AND title LIKE '%novel%';
```

## OR
||

```
SELECT title, 
       author_lname, 
       released_year, 
       stock_quantity 
FROM   books 
WHERE  author_lname = 'Eggers' 
              || released_year > 2010 
OR     stock_quantity > 100;
```
## BETWEEN
this for finding something between two values.

NOT BETWEEN
```

```

## CAST()
convert one data type to another
```
SELECT title, released_year FROM books WHERE released_year >= 2004 && released_year <= 2015;
 
SELECT title, released_year FROM books 
WHERE released_year BETWEEN 2004 AND 2015;
 
SELECT title, released_year FROM books 
WHERE released_year NOT BETWEEN 2004 AND 2015;
 
SELECT CAST('2017-05-02' AS DATETIME);
 
show databases;
 
use new_testing_db;
 
SELECT name, birthdt FROM people WHERE birthdt BETWEEN '1980-01-01' AND '2000-01-01';
 
SELECT 
    name, 
    birthdt 
FROM people
WHERE 
    birthdt BETWEEN CAST('1980-01-01' AS DATETIME)
    AND CAST('2000-01-01' AS DATETIME);
```

## IN
this IN is similar to the in in python for seeing if that component exists in the series. there exists also a NOT IN as as well.

## %
remainder

```
SELECT title, released_year FROM books
WHERE released_year NOT IN 
(2000,2002,2004,2006,2008,2010,2012,2014,2016);
 
SELECT title, released_year FROM books
WHERE released_year >= 2000
AND released_year NOT IN 
(2000,2002,2004,2006,2008,2010,2012,2014,2016);
 
SELECT title, released_year FROM books
WHERE released_year >= 2000 AND
released_year % 2 != 0;
 
SELECT title, released_year FROM books
WHERE released_year >= 2000 AND
released_year % 2 != 0 ORDER BY released_year;
```

## CASE STATEMENTS
These are provide the ability of else and if condition in MYSQL programming
```
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        WHEN stock_quantity BETWEEN 101 AND 150 THEN '***'
        ELSE '****'
    END AS STOCK
FROM books;
 
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books; 
```














