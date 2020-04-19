# Some important Notes regarding the virtual IDE Goorm

## To Start the MYSL server:
```
mysql-ctl start
```

## To stop the mysql server:
```
mysql-ctl stop
```

## To stop and start the Mysql server databases on your machine
```
mysql-ctl cli;
```

## Create database
```
create database name;
```

## Show avaialble databses
```
show databases;
```
## use a database to work with
```
use name;
```

## find out which database is used
```
select database();
```

## delete a database
```
drop table name;
```

## char data type
is the fixed length character

## varchar(maximum length)
is the one we usually use for the string

## int
is the one we usually use for the int numbers

## create a table
```
CREATE TABLE tablename
  (
    column_name data_type,
    column_name data_type
  );
CREATE TABLE cats
  (
    name VARCHAR(100),
    age INT
  );
  ```
  ## show all the tables
  ```
  SHOW TABLES;
  ```

  ## Show the columns of the table;
  ```
  SHOW COLUMNS FROM <table name>;

  DESC <table name>;  (this is kinda a shortcut to show the table info)
  ```

## deleteing the table
```
DROP TABLE <table name>
```

## Insert data in the table
```
INSERT INTO table_name(column_name1, column_name2) VALUES (val1,val2);
```


## view the data in a table
```
select*from tableName;
```

## Bulk insert data into tables
```
INSERT INTO cats(name, age)
VALUES ('Charlie', 10),
       ('bllue',4);
```
## Show the warning details
```
SHOW WARNINGS;
```
if in your system, it gives error when your data type or data entry length does not match with what it has to be you can fix it with 
```
set sql_mode='';
```

## make NOT Null and Default value
add NOT null as the third argument to create your table
```
CREATE TABLE cats4
  (
    name VARCHAR(20) NOT NULL DEFAULT 'unnamed',
    age INT NOT NULL DEFAULT 99
  );
  ```

  ## Primary Keys
  if yyou want to have a unique entry in each row you can use the concept of the primary key with auto-increment in order to creat e aunique id for each entry
  ```
CREATE TABLE employeas (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
middle_name VARCHAR(255) ,
age INT NOT NULL,
current_status VARCHAR(255) NOT NULL DEFAULT 'employed'
);

INSERT INTO employeas (first_name, last_name, age) VALUES
('Dora', 'smith', 58);

  ```

## Read the data form the table in a database
Note: order matters
```
SELECT * FROM <tabkeNAme>;
SELECT <name>, <age> FROM <tableName>;
```

## WHERE clause for selecting a particular row
the name is case insensitive
```
SELECT * FROM cats WHERE age=4;
SELECT cat_id, age FROM cats WHERE cat_id > age;
```

## Aliase
This is usefull when we want to change the name of the output
```
SELECT cat_id AS id, name FROM cats;
 
SELECT name AS 'cat name', breed AS 'kitty breed' FROM cats;
 
DESC cats;
```

## Update an entry in a table
```
UPDATE cats SET age=14 WHERE name='Misty';
```
Note: as a rule of thumb lets always use select to make sure that we are updating the right data. There is no undo button or actions, so make sure to not change anything by mistake.

NOTE: for the update, we can do multiple updates by sperating them with comma

## Delete an entry in the table
```
DELETE FROM cats WHERE name = 'egg';
```
## Run a sql script
in order to run the sql script in the shell, make sure you run the mysql in the corect path of the sql file and then enter.

How: 
```
source C:\Users\Bahador\Desktop\GoogleDrive\MySQL Course\Priliminaries Code\MySQL-Project/short_title.sql
```
make sure to bot put ; at the nd of the command line


``` 
source <file_name>.sql;
```

## CONCAT for better looking output
This for combining the string
CONCAT(x,y,z). This function return the custome concatenated string from the selected table.
```
SELECT CONCAT(author_fname, ' ' , author_lname) AS full_name FROM books;
```

## CONCAT_WS
concat with seperator

The first entry would be the seperator between each piece.
```
SELECT 
    CONCAT_WS(' - ', title, author_fname, author_lname) 
FROM books;
```
## Select the substring
```
SELECT SUBSTRING('Hello World',1,4)
SELECT SUBSTRING('Hello World',7) -- IT gives you the substring from that number all the way to the end

SELECT SUBSTRING('Hello World',-4) -- start from the index starting from the end and go to the right

-- A use case for this fucntion to create a short tile
SELECT CONCAT
    (
        SUBSTRING(title, 1, 10),
        '...'
    ) AS 'short title'
FROM books;
 
source book_code.sql

```

## Replace the char in string
This is good when we want to replace some character in a string. WE can also mix the replace command with others suchas concat or substring.
```
SELECT CONCAT(SUBSTRING(REPLACE(title,'e','3'),1,10),'...') FROM books;
```

## REVERSE
this function reverse the string as it is
```
SELECT REVERSE('WOOOOOF');
```

## Find the length of the string
count the number of chars in a string
```
SELECT CHAR_LENGTH('Hello world klaksjdlkasjdlaksdj');
```
Note: we can always use sql-format.com to format the sql scripts for nicer look.

## Change the upper and lower cases
```
SELECT UPPER('hello world);
SELECT LOWER('HELLO WORLD HEY');
```
Note: order of the condition here somehow matters. UPPER only takes one argument and CONCAT takes two or more arguments, so they can't be switched in that way.

---------------------------------------

# some good weapons

## DISTINCT
```
SELECT DISTINCT author_lname FROM books;
```
and
```
SELECT DISTINCT author_fname, author_lname FROM books;
```

## Order by (sorting)
Ascending by default
```
SELECT author_lname from books ORDER BY author_lname;
```
to chabge it we can do it as ;
```
SELECT title from books ORDER BY title DESC;
```
or we can add ASC for asceding order

What does the following mean?
```
SELECT title, author_fname, author_lname from books ORDER BY 2;
```
that number 2 refers to the secend argument


If you wanna sort by two different argument
```
SELECT auhtor_fname, author_lname from Books ORDER BY ahtor_lname, author_fname;
```
this stament will first wort them by the author_lname and then as the second layer will sort it by author_fname.


## limit the number of show (LIMIT)
```
SELECT title FROM books LIMIT 3;
```
another example
```
SELECT title, released_year FROM books ORDER BY released_year LIMIT 5;
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 1,3;
```
if you put a giagantic number as the cap limit, it will show all the rows that it has.
```
SELECT title, released_year FROM books LIMIT 8,3;
```
This means that show from the index 8 to the next 3.


## LIKE for better searching
helps for better general searching
```
SELECT title, author_fname from books where author_fname like '%da%';
```
```
SELECT title, author_fname from books where author_fname like 'da%';
```
if the first wildcard is gone, the it will look for the fname that exactly start with 'da'


Here is all the combination at once
```
SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';
 
SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%';
 
SELECT title FROM books WHERE  title LIKE 'the';
 
SELECT title FROM books WHERE  title LIKE '%the';
 
SELECT title FROM books WHERE title LIKE '%the%';
```

## Anothre important wildcards
if you want to search based on the numbe of characters that is the length of the 
```
SELECT title, stock_quantity FROM books;
 
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____';
 
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '__';
 
(235)234-0987 LIKE '(___)___-____'
 
SELECT title FROM books;
 
SELECT title FROM books WHERE title LIKE '%\%%'
 
SELECT title FROM books WHERE title LIKE '%\_%'
```

--------------
# Aggregation Functions
The followings are the basics for having functions to do analysis on our data

## COUNT
count the number of occurance.
```
SELECT COUNT(*) FROM books;
 
SELECT COUNT(author_fname) FROM books;
 
SELECT COUNT(DISTINCT author_fname) FROM books;
 
SELECT COUNT(DISTINCT author_lname) FROM books;
 
SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;
 
SELECT title FROM books WHERE title LIKE '%the%';
 
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';
```

## GROUP BY
this is for grouping rows together and have a something so called mega row with a unique identity that the group by is set accordingly.
```
SELECT title, author_lname FROM books
GROUP BY author_lname;
 
SELECT author_lname, COUNT(*) 
FROM books GROUP BY author_lname;
 
 
SELECT title, author_fname, author_lname FROM books;
 
SELECT title, author_fname, author_lname FROM books GROUP BY author_lname;
 
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname;
 
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;
 
SELECT released_year FROM books;
 
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
 
SELECT CONCAT('In ', released_year, ' ', COUNT(*), ' book(s) released') AS year FROM books GROUP BY released_year;
```

## MIN and MAX
do the min and max calculation for the parametrs of the tables
```
SELECT MAX(pages) 
FROM books;
 
SELECT MAX(released_year) 
FROM books;
```

## Subqueries for using MIN and MAX
the subqueries are usually slow because they are bruteforce actions. somethies there is a smarter and faster way of acheiving the same result.
```
SELECT title, pages FROM books 
WHERE pages = (SELECT Max(pages) 
                FROM books); 
 
SELECT title, pages FROM books 
WHERE pages = (SELECT Min(pages) 
                FROM books); 
 
SELECT * FROM books 
ORDER BY pages ASC LIMIT 1;
 
SELECT * FROM books 
ORDER BY pages DESC LIMIT 1;
```

for using the min and max alongside with the group by action we can have

```
SELECT author_fname, 
       author_lname, 
       Min(released_year) 
FROM   books 
GROUP  BY author_lname, 
          author_fname;
 
SELECT
  author_fname,
  author_lname,
  Max(pages)
FROM books
GROUP BY author_lname,
         author_fname;
 
SELECT
  CONCAT(author_fname, ' ', author_lname) AS author,
  MAX(pages) AS 'longest book'
FROM books
GROUP BY author_lname,
         author_fname;
```

## SUM
sum the attributes of groups 
```
SELECT author_fname,
       author_lname,
       Sum(released_year)
FROM books
GROUP BY
    author_lname,
    author_fname;
```


## AVG
find the average number of something
```
SELECT author_fname, author_lname, AVG(pages) FROM books
GROUP BY author_lname, author_fname;
```

---------------------------------
# DATA_TYPES

## CHAR and VARCHAR
char has a fixed length. CHAR is also faster for the fixed length texts.

Basicaly, when we use CAHR, with a fixed length CHAR(4) it always reserve 4 bytes in the DB to save that variables. But if we use the VARCHAR(4) it will be flixible depend of the length of the variables inside it.

## NUMBERS

### DECIMALS(M,D)
M is the number of digits in total and D is the number of decimal after point.


*NOTE* the FLOAT and DOUBLE are approximate. FLOAT and DOUBLE requires less space to preseve larger numbers.

### FLOAT
length of it in the DB is 4 bytes
7 digits
### DOUBLE
length of it in the DB is 8 bytes15 digits.
In general it is god to use the decimal not the float and doubles.

### DATES
yyyy-MM-DD format


### TIME
HH:MMM:SSS format

### DATETIME
'YYYY-MM-DD HH:MM:SS' format

CRDATE() => gives the current date

CRTIME() => gives the current time

NOW() => gives the current datetime
we use NOW more often because it gives all the info needed.

### some functions:
DAY()
DAYNAME()
DAYOFWEEK()
DAYOFYEAR()


DATE_FROMAT() is a good method that we cam format the dataetime
```

SELECT CONCAT(MONTHNAME(birthdate), ' ', DAY(birthdate), ' ', YEAR(birthdate)) FROM people;
 
SELECT DATE_FORMAT(birthdt, 'Was born on a %W') FROM people;
 
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y') FROM people;
 
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') FROM people;
```
search to find the attributes of this function anytime you need it

### DATE Function MATH
DATEDIFF(expr1, expr2) is basically subtract them


```
SELECT * FROM people;
 
SELECT DATEDIFF(NOW(), birthdate) FROM people;
 
SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM people;
 
SELECT birthdt FROM people;
 
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
 
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 10 SECOND) FROM people;
 
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) FROM people;
 
SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;
 
SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM people;
 
SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;
```

### TimeSTAMPS
The main difference between the timestamp and the datetime is the range that they support
```
CREATE TABLE comments (
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);
 
INSERT INTO comments (content) VALUES('lol what a funny article');
 
INSERT INTO comments (content) VALUES('I found this offensive');
 
INSERT INTO comments (content) VALUES('Ifasfsadfsadfsad');
 
SELECT * FROM comments ORDER BY created_at DESC;
 
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);
 
INSERT INTO comments2 (content) VALUES('dasdasdasd');
 
INSERT INTO comments2 (content) VALUES('lololololo');
 
INSERT INTO comments2 (content) VALUES('I LIKE CATS AND DOGS');
 
UPDATE comments2 SET content='THIS IS NOT GIBBERISH' WHERE content='dasdasdasd';
 
SELECT * FROM comments2;
 
SELECT * FROM comments2 ORDER BY changed_at;
 
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
);
```
















