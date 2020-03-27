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

## Bulk insert data inti tables
```
INSERT INTO cats(name, age)
VALUES ('Charlie', 10),
       ('bllue',4);
```













