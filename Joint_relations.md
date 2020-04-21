# Joints and relations


## Different types of the connections
1. one to one
2. one to many
3. many to many


### Foreign keys
```
CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);
CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);
```

### Cross Joint
Finding Orders Placed By George: 2 Step Process
```
SELECT id FROM customers WHERE last_name='George';
SELECT * FROM orders WHERE customer_id = 1;
```
Finding Orders Placed By George: Using a subquery
```
SELECT * FROM orders WHERE customer_id =
    (
        SELECT id FROM customers
        WHERE last_name='George'
    );
```
Cross Join Craziness
```
SELECT * FROM customers, orders;
```

### Inner Joint
here order of the table name matters if you dont exactly select what you wanna see

-- IMPLICIT INNER JOIN
```
SELECT * FROM customers, orders 
WHERE customers.id = orders.customer_id;
```

-- IMPLICIT INNER JOIN
```
SELECT first_name, last_name, order_date, amount
FROM customers, orders 
    WHERE customers.id = orders.customer_id;

```

-- EXPLICIT INNER JOINS

```
SELECT * FROM customers
JOIN orders
    ON customers.id = orders.customer_id;
    
SELECT first_name, last_name, order_date, amount 
FROM customers
JOIN orders
    ON customers.id = orders.customer_id;
    
SELECT *
FROM orders
JOIN customers
    ON customers.id = orders.customer_id;
-- ARBITRARY JOIN - meaningless, but still possible 

SELECT * FROM customers
JOIN orders ON customers.id = orders.id;
```



