-- JOINS are for combining Columns From multiple tables.
-- Unions are for combining rows from multiple tables.

SELECT
	order_id,
    order_date,
    'Active' AS status
FROM orders o
WHERE order_date >= '2019-01-01'
UNION
SELECT
	order_id,
    order_date,
    'Archived' AS status
FROM orders o
WHERE order_date < '2019-01-01';



-- Always both tables should return same number of columns.
SELECT first_name AS namescustomers
FROM customers
UNION
SELECT name
FROM shippers;





SELECT
	c.customer_id,
    c.first_name,
    c.points,
    'Bronze' AS Tier
FROM customers c
WHERE points < 2000
UNION
SELECT
	c.customer_id,
    c.first_name,
    c.points,
    'Silver' AS Tier
FROM customers c
WHERE (points > 2000 AND points < 3000)
-- WHERE points BETWEEN 2000 AND 3000
UNION
SELECT
	c.customer_id,
    c.first_name,
    c.points,
    'Gold' AS Tier
FROM customers c
WHERE points >=3000
ORDER BY first_name;