CREATE DEFINER=`admin`@`%` PROCEDURE `UpdateBooking`(IN bookingid INT, IN bookingdate DATE)
BEGIN
UPDATE bookings SET date = bookingdate WHERE id = bookingid;
SELECT CONCAT('Booking updated for id ', bookingid);
END