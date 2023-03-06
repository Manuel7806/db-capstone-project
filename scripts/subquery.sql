USE little_lemon_db;


SELECT name FROM items WHERE id = ANY (SELECT items_id FROM orders GROUP BY items_id HAVING COUNT(items_id) > 2);
