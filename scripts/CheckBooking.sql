CREATE DEFINER=`admin`@`%` PROCEDURE `CheckBooking`(IN bookingdate DATE, IN tablenumber INT)
BEGIN
SELECT * FROM bookings WHERE date = bookingdate AND tables_id = tablenumber;
SELECT CONCAT('Table ', tablenumber, ' is already booked') AS 'Booking Status';
END