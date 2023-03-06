CREATE DEFINER=`admin`@`%` PROCEDURE `CancelOrder`(IN orderid INT)
BEGIN
DELETE FROM orders WHERE id = orderid;
SELECT CONCAT('Order ', orderid, ' is cancelled') AS 'Confirmation';
END