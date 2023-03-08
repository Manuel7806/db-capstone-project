CREATE DEFINER=`admin`@`%` PROCEDURE `CancelBooking`(IN bookingid INT)
BEGIN
DELETE FROM bookings WHERE id = bookingid;
SELECT CONCAT('Booking ', bookingid, ' cancelled');
END