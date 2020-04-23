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

### Left Join
Here we get all the component of the first table or the left table in the result no matter if those have a common intersection.
```
SELECT 
    first_name, 
    last_name,
    IFNULL(SUM(amount), 0) AS total_spent
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent;
```
### How do we replace nul with a value/string
IFNULL(SUM(amount), 0)


### Right Join
This is going to select the components that exists in the right table but those not have the intersection to the left side
```
SELECT 
    IFNULL(first_name,'MISSING') AS first, 
    IFNULL(last_name,'USER') as last, 
    order_date, 
    amount, 
    SUM(amount)
FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY first_name, last_name;
```

### On DELETE CASCADE
When you want to have the ability of deleting a customer and then it deletes the corresponding orders, then add this to the table design.
```
CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) 
        REFERENCES customers(id)
        ON DELETE CASCADE
);
```
### Is there a difference between left and right join if we change the order of the tables"
No they are the same if we change the order of the tables
```
SELECT * FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id;
SELECT * FROM orders
RIGHT JOIN customers
    ON customers.id = orders.customer_id;    
SELECT * FROM orders
LEFT JOIN customers
    ON customers.id = orders.customer_id;    
SELECT * FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id;
```

