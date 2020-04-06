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
  SHOw TABLES;
  ```

  ## Show the columns of the table;
  ```
  SHOW COLUMNS FROM <table name>;

  DESC <table name>;  (this is kinda a shortcut to show the table info)
  ```

## dleteing the table
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

What doe sth efollowing mean?
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

## Anothre importatn wildcard
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









