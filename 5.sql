INSERT INTO customers
VALUES (
	DEFAULT,
    'John',
    'Smith',
    '1990-01-01',
	NULL,
    'address',
    'city',
    'CA',
    DEFAULT);

-- OR

INSERT INTO customers (
	first_name,
    last_name,
    birth_date,
    address,
    city,
    state)
VALUES (
    'John',
    'Smith',
    '1990-01-01',
    'address',
    'city',
    'CA');




INSERT INTO shippers (name)
VALUES ('Shipper1'),
	   ('Shipper2'),
	   ('Shipper3');


SELECT * FROM products;

INSERT INTO products (name, quantity_in_stock, unit_price)
VALUES
	('Blueberries', 200, 2.99),
    ('Salted Chips', 499, 1.09),
    ('Blatt Spinat', 75, 1.69);


SELECT * FROM customers;
-- Inserting into multiple tables.
-- Orders table is parent
-- Order_items table is child.
-- 1 row in parent can have 1/more rows in child.

-- first run this.
INSERT INTO orders (customer_id, order_date, status)
VALUES (1, '2019-07-24', 1);
-- then run this.
INSERT INTO order_items
VALUES 
	(LAST_INSERT_ID(), 1, 1, 2.95),
    (LAST_INSERT_ID(), 2, 1, 3.95);

-- gives the value of the last inserted id 
SELECT LAST_INSERT_ID();






-- creates a soft copy where no primary key / auto increment is there.
CREATE TABLE orders_archived AS
SELECT * FROM orders;


INSERT INTO orders_archived
SELECT * FROM orders
WHERE order_date < '2019-01-01';



CREATE TABLE invoice_archived AS
SELECT * FROM invoices;


SELECT * FROM invoices;

CREATE TABLE invoices_archived AS
SELECT i.invoice_id, i.client_id, c.name, i.payment_date
FROM invoices i
JOIN clients c
	ON i.client_id = c.client_id
    AND payment_date IS NOT NULL;






UPDATE invoices
SET payment_total = 10, payment_date = '2019-03-01'
WHERE invoice_id = 1;

SELECT * FROM invoices;

UPDATE invoices
SET payment_total = DEFAULT, payment_date = NULL
WHERE invoice_id = 1;


UPDATE invoices
SET 
	payment_total = invoice_total * 0.5, 
	payment_date = due_date
WHERE invoice_id = 3;
-- 23:29:24	UPDATE invoices SET   payment_total = invoice_total * 0.5,   payment_date = due_date WHERE invoice_id = 3	
-- 1 row(s) affected, 1 warning(s): 1265 Data truncated for column 'payment_total' at row 1 Rows matched: 1  Changed: 1  Warnings: 1	0.015 sec

SELECT * FROM invoices;

UPDATE invoices
SET 
	payment_total = invoice_total * 0.5, 
	payment_date = due_date
WHERE client_id = 3;
-- 23:34:01	UPDATE invoices SET   payment_total = invoice_total * 0.5,   payment_date = due_date WHERE client_id = 3	
-- 5 row(s) affected, 4 warning(s): 1265 Data truncated for column 'payment_total' at row 1 1265 Data truncated for 
-- column 'payment_total' at row 2 1265 Data truncated for column 'payment_total' at row 3 1265 Data truncated for 
-- column 'payment_total' at row 4 Rows matched: 5  Changed: 5  Warnings: 4	0.016 sec

UPDATE invoices
SET 
	payment_total = invoice_total * 0.5, 
	payment_date = due_date
WHERE client_id IN (3, 4);
-- where clause is optional. If you want to update all the rows, leave it out.






SELECT * FROM sql_store.customers;

UPDATE customers
SET points = points + 50
WHERE birth_date < '1990-01-01';





-- Sub queries
UPDATE invoices
SET 
	payment_total = invoice_total * 0.6, 
	payment_date = due_date
WHERE client_id =
			(SELECT client_id
			FROM clients
			WHERE name = 'Myworks');


UPDATE invoices
SET 
	payment_total = invoice_total * 0.5, 
	payment_date = due_date
WHERE client_id IN
			(SELECT client_id
			FROM clients
            WHERE state IN ('NY', 'CA'));





--
SELECT * FROM sql_store.orders;

SELECT *
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
    AND points > 3000;

UPDATE orders
SET comments = 'Gold Customer'
WHERE customer_id IN
			(SELECT customer_id 
            FROM sql_store.customers 
            WHERE points > 3000);
            


-- Delete

-- this deleted everything.
-- DELETE FROM invoices


DELETE FROM invoices
WHERE id IN
			(SELECT client_id
			FROM clients
			WHERE name='Myworks');


