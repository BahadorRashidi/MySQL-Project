# MySQL-Project
Including different set of codes for MYSQL

## Some usefull command for the first part of the course
SELECT * FROM NameOfTables

This just select the tables and show it

*SELECT * FROM NameOfTables ORDER BY columnOfTable DESC*

This shows the result in the descending order for the selected column


*SELECT
	customerName, 
    COUNT(*) AS 'Number of orders'
From customers
INNER JOIN orders 
	ON orders.customerID = customers.customerID
GROUP By customers.customerID;*

This is for counting the number of the orders by joining two different tables




## hat is the DataBase? (DB)
1. It is the collection of data. 
2. Aphone Book is a database.
3. hat if we have a gigantic dataBase and we have aquestion that is a mixture of the columns, how can we solve it.

It is a structured set of computerized data with and accessible interface

## DataBase Management Systems (DBMS)
This is the machine language that give us the access to the DB from our application

The examples of DBMS:

PstgreSQL, MYSQL, Oracle DataBase, SLite
-----------------------

SQL: structred uery Language: it is the language that we use to talk to our dataBase