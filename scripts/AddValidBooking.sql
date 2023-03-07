CREATE DEFINER=`admin`@`%` PROCEDURE `AddValidBooking`(IN bookingdate DATE, IN party INT, IN customerid INT, IN employeeid INT, IN tablenumber INT)
BEGIN

-- Create a variable to store the number of results for the query
DECLARE num_rows INT DEFAULT 0;

START TRANSACTION;

-- Check if a booking with the same date and table number already exists 
-- and if it does hold that record in the num_rows variable
SELECT COUNT(*) INTO num_rows FROM bookings WHERE date = bookingdate AND tables_id = tablenumber;

-- Create the insert statement
INSERT INTO bookings (date, party, customers_id, employees_id, tables_id) VALUES (bookingdate, party, customerid, employeeid, tablenumber);

IF num_rows <> 0 THEN
-- If there was a record found
SELECT CONCAT('Table ', tablenumber, ' is already booked - booking canelled') AS 'Booking Status';
ROLLBACK;
ELSE
-- If no record was found
SELECT CONCAT('Your booking has been made for ', bookingdate, ' with table number ', tablenumber) AS 'Booking confirmation';
COMMIT;
END IF;

END