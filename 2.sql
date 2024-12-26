USE sql_store;

SELECT *
FROM order_items oi
JOIN sql_inventory.products p
ON oi.product_id = p.product_id;

--  JOIN and INNER JOIN are the same.

USE sql_hr;

-- Self Join 
SELECT
	e.employee_id,
    e.first_name,
    e.last_name,
    m.first_name AS manager_name
FROM employees e
JOIN employees m
	ON e.reports_to = m.employee_id;
    
    

-- Joining Multiple tables
USE sql_store;

SELECT 
	o.order_id, 
    o.order_date,
    o.customer_id, 
    c.first_name, 
    os.name AS 'Shipping Status'
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
JOIN order_statuses os
	ON o.status = os.order_status_id;






-- Joining Multiple Tables.
USE sql_invoicing;

SELECT *
FROM payments p
JOIN clients c
	ON p.client_id = c.client_id
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id;





-- Compound Join Conditions
USE sql_store;

-- order_items table has a composite primary key.
SELECT *
FROM order_items oi
JOIN order_item_notes oin
	ON oi.order_id = oin.order_id
    AND oi.product_id = oin.product_id;







-- Implicit Join
-- normal
USE sql_store;
SELECT *
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id;

-- or shorter implicit join you can do.
SELECT *
FROM orders o, customers c
WHERE o.customer_id = c.customer_id;
-- but don't use generally. Because if you forget the WHERE clause
-- while using the implicit join, the query becomes a CROSS JOIN
-- and you will get a huge table with each record from one table
-- joined with the other table. So use the normal join query (above one)
-- instead of this because you have to use use ON with JOIN for that
-- else you will get an error.







-- Outer Join
-- JOIN and INNER JOIN are same. No need to mention inner.

-- Normal Inner Join.
-- But this shows only customers who ordered. Won't show
-- customers who haven't ordered until now.
SELECT c.customer_id, c.first_name, o.order_id
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
ORDER BY customer_id;


-- so to view customers who haven't ordered until now,
-- you should use OUTER JOIN.

-- RIGHT JOIN or RIGHT OUTER JOIN
-- All customers you will see, whether they ordered or not.
SELECT c.customer_id, c.first_name, o.order_id
FROM orders o
RIGHT OUTER JOIN customers c
	ON o.customer_id = c.customer_id
ORDER BY customer_id;

-- LEFT JOIN OR LEFT OUTER JOIN.
-- All rows from orders whether the ON condition it true or not
SELECT c.customer_id, c.first_name, o.order_id
FROM orders o
LEFT JOIN customers c
	ON o.customer_id = c.customer_id
ORDER BY c.customer_id;



SELECT *
FROM products p
LEFT JOIN order_items oi
	ON p.product_id = oi.product_id;



SELECT c.customer_id, c.first_name, o.order_id, sh.name AS 'Shippers'
FROM customers c
LEFT JOIN orders o
	ON o.customer_id = c.customer_id
LEFT JOIN shippers sh
	ON o.shipper_id = sh.shipper_id
ORDER BY c.customer_id;





SELECT o.order_date, o.order_id, c.first_name, s.shipper_id, s.name, os.name AS 'Status'
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
LEFT JOIN shippers s
	ON o.shipper_id = s.shipper_id
LEFT JOIN order_statuses os
	ON o.status = os.order_status_id
ORDER BY 'Status';