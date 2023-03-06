-- WEEK 2 TASK 2

USE little_lemon_db;

SELECT customers.id AS 'Customer ID', customers.name AS 'Customer Name', orders.id AS 'Order ID', orders.cost AS 'Total Cost', items.name AS 'Item Name' FROM customers
INNER JOIN 
orders ON customers.id = orders.customers_id
INNER JOIN
items ON orders.items_id = items.id
WHERE orders.cost > 150;