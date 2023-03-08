CREATE DEFINER=`admin`@`%` PROCEDURE `AddBooking`(IN bookingdate DATE, IN partynumber INT, IN customerid INT, IN employeeid INT, IN tableid INT)
BEGIN
INSERT INTO bookings
(date, party, customers_id, employees_id, tables_id) 
VALUES
(bookingdate, partynumber, customerid, employeeid, tableid);
SELECT 'New booking added';
END