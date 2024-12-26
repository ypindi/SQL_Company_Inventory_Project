-- everything is case insensitive.

USE sql_store;

SELECT * FROM sql_store.customers;

SELECT 1, 2;

SELECT * 
FROM sql_store.orders 
-- WHERE customer_id = 2 
ORDER BY first_name; 

SELECT *
FROM sql_store.customers
ORDER BY first_name;


SELECT 
	customer_id, 
    first_name, 
    points, 
    points + 25,
    points%10+100 AS 'discount factor'
FROM customers
WHERE points>2000;


SELECT *
FROM customers
-- WHERE points >=2000;

-- WHERE state <> 'VA';
-- state is not equal to Virginia.

-- WHERE state = 'va';

WHERE birth_date > '1990-01-01';

UPDATE sql_store.customers SET state = 'MA' WHERE customer_id = 1;
UPDATE `sql_store`.`customers` SET `state` = 'VA' WHERE (`customer_id` = '1');
-- both are correct.

SELECT DISTINCT state
FROM customers;

SELECT *, unit_price*1.1 AS 'new price'
FROM products;


SELECT *
FROM orders 
WHERE order_date >= '2017-01-01' AND order_date <= '2017-12-31'
ORDER BY order_date;


SELECT *
FROM orders 
JOIN customers AS cus
WHERE (order_date >= '2017-01-01' AND order_date <= '2017-12-31') OR cus.points > 3500
ORDER BY order_date;


SELECT *
FROM customers
-- WHERE birth_date > '1990-01-01' OR points > 1000;

-- WHERE NOT (birth_date > '1990-01-01' OR points > 1000);
WHERE birth_date <= '1990-01-01' AND points <=1000;
-- both the above 2 statements are same.



SELECT *
FROM order_items
WHERE order_id = 6 AND quantity*unit_price > 30;



SELECT *
FROM customers
-- WHERE state = 'VA' OR state = 'FL' OR state = 'MA';
-- WHERE state IN ('VA', 'FL', 'MA');
-- both above are same.
WHERE state NOT IN ('VA', 'FL', 'MA');




SELECT *
FROM products
WHERE quantity_in_stock IN (49, 38, 72);


SELECT *
FROM customers
-- WHERE points BETWEEN 1000 AND 3000;
-- WHERE points >= 1000 and points <= 3000;

-- WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

-- WHERE last_name LIKE '%b%';
-- WHERE last_name LIKE '%y';

-- WHERE last_name LIKE '_y';
-- exactly 2 characters long with last character = 'y'

WHERE last_name LIKE '_____y';

-- % any number of characters
-- _ single character.




SELECT *
FROM customers
WHERE address LIKE '%TRAIL%' OR 
	  address LIKE '%AVENUE%';

SELECT *
FROM customers
WHERE phone LIKE '%9';

SELECT *
FROM customers
-- WHERE last_name LIKE '%field%';
-- WHERE last_name REGEXP 'field';

-- WHERE last_name REGEXP '^field';
-- last name has to start with field.

-- WHERE last_name REGEXP 'll$';
-- last name has to end with $ .

-- WHERE last_name REGEXP 'field|mac';
-- last_name should have field or mac.

-- WHERE last_name REGEXP '^field|mac';
-- start with field or have mac.

-- WHERE last_name REGEXP 'field$|mac';
-- end with field or have mac somewhere.

-- WHERE last_name REGEXP '[gim]e';
-- name should have ge or ie or me.

-- WHERE last_name REGEXP 'e[yif]';
-- name should have ey or ei or ef

WHERE last_name REGEXP '[a-h]e';
-- before e, can be a to h.


-- ^ beginning
-- $ end
-- | logical or
-- [abcd] or [a-h] ranges.




SELECT *
FROM customers
-- WHERE first_name REGEXP 'ELKA|AMBUR';
-- WHERE last_name REGEXP 'ey$|on$';
-- WHERE last_name REGEXP '^my|se';
WHERE last_name REGEXP 'b[ru]';





SELECT *
FROM customers
-- WHERE phone IS NOT NULL;
-- WHERE phone IS NULL;
-- ORDER BY first_name DESC;
ORDER BY state DESC, first_name;




SELECT *
FROM orders
WHERE shipper_id IS NULL;



SELECT *, quantity*unit_price AS total_price
FROM order_items
WHERE order_id = 2
-- ORDER BY quantity*unit_price DESC;
ORDER BY total_price DESC;



SELECT *
FROM customers
-- LIMIT 3;
LIMIT 6,3;
-- skips the first 6.



SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3;





SELECT order_id, c.customer_id, first_name, last_name
FROM orders AS o
JOIN customers AS c
ON o.customer_id = c.customer_id;





-- order of the Commands:
-- SELECT
-- FROM
-- WHERE
-- ORDER BY 
-- LIMIT





SELECT order_id, o.product_id, quantity, o.unit_price, name, quantity_in_stock
FROM order_items o
JOIN products p
ON o.product_id = p.product_id;