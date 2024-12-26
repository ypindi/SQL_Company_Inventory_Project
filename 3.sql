USE sql_hr;

-- Self Joins

-- Self Inner Join
-- Here finding out who all report to a particular manager (37270).
SELECT
	e.employee_id,
    e.first_name,
    m.first_name AS manager
FROM employees e
JOIN employees m
	ON e.reports_to = m.employee_id;

-- returns everyone whether they have a manager or not.
SELECT
	e.employee_id,
    e.first_name,
    m.first_name AS manager
FROM employees e
LEFT JOIN employees m
	ON e.reports_to = m.employee_id;






-- Using clause. When 2 tables have same column name.
USE sql_store;

SELECT *
FROM orders o
JOIN customers c
	-- ON o.customer_id = c.customer_id;
	USING (customer_id)
LEFT JOIN shippers s
	USING (shipper_id);





-- USING also works on composite primary keys.
SELECT *
FROM order_items oi
LEFT JOIN order_item_notes oin
	USING (order_id, product_id);







SELECT 
	p.date, 
    c.name AS client,
    p.amount,
    pm.name
FROM payments p
LEFT JOIN clients c
	USING (client_id)
LEFT JOIN payment_methods pm
	ON p.payment_id = pm.payment_method_id;






-- Natural Joins
-- don't use much. Sometimes gives unexpected results.
-- database will look at both the tables and join them
-- based on the columns with same name.
SELECT *
FROM orders
NATURAL JOIN customers;








-- Cross Join
-- Join every record in 1st table to every record in 2nd table.
-- no conditions (no ON).
SELECT c.first_name AS customer, p.name as product
FROM customers c
CROSS JOIN products p
ORDER BY c.first_name;


-- this is also cross join.
SELECT *
FROM customers, products;



SELECT sh.name AS Shipper, p.name AS Product
FROM shippers AS sh, products AS p
ORDER BY sh.name;
-- or
SELECT sh.name AS Shipper, p.name AS Product
FROM shippers AS sh
CROSS JOIN products AS p
ORDER BY sh.name;