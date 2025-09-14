DROP TABLE IF EXISTS uber_ride;

CREATE TABLE uber_ride (
    Date DATE,
    Time TIME,
    Booking_ID VARCHAR(20) NOT NULL,
    Booking_Status VARCHAR(50) NOT NULL,
    Customer_ID VARCHAR(20) NOT NULL,
    Vehicle_Type VARCHAR(30) NOT NULL,
    Pickup_Location VARCHAR(100) NOT NULL,
    Drop_Location VARCHAR(100) NOT NULL,
    Avg_VTAT NUMERIC(5,2),
    Avg_CTAT NUMERIC(5,2),
    Cancelled_Rides_by_Customer INT,
    Reason_for_Cancelling_by_Customer VARCHAR(100),
    Cancelled_Rides_by_Driver INT,
    Driver_Cancellation_Reason VARCHAR(100),
    Incomplete_Rides INT,
    Incomplete_Rides_Reason VARCHAR(100),
    Booking_Value NUMERIC(10,2),
    Ride_Distance NUMERIC(6,2),
    Driver_Ratings NUMERIC(2,1),
    Customer_Rating NUMERIC(2,1),
    Payment_Method VARCHAR(20)
);

-- Import CSV into table
COPY uber_ride(
    Date, Time, Booking_ID, Booking_Status, Customer_ID, Vehicle_Type,
    Pickup_Location, Drop_Location, Avg_VTAT, Avg_CTAT,
    Cancelled_Rides_by_Customer, Reason_for_Cancelling_by_Customer,
    Cancelled_Rides_by_Driver, Driver_Cancellation_Reason,
    Incomplete_Rides, Incomplete_Rides_Reason,
    Booking_Value, Ride_Distance, Driver_Ratings, Customer_Rating, Payment_Method)
FROM 'C:\Users\Dell\Downloads\ncr_ride_bookings.csv'
DELIMITER ','
CSV HEADER
NULL 'null';

SELECT*FROM uber_ride;


-- 1. Show first 10 rows
SELECT*FROM uber_ride
LIMIT 10;

-- 2. Count total rides
SELECT COUNT(booking_id) AS total_rides FROM uber_ride;

-- 3. Count rides by booking status
SELECT Booking_Status, COUNT(*) AS ride_count
FROM uber_ride
GROUP BY Booking_Status;

-- 4. Count rides by vehicle type
SELECT COUNT(vehicle_type) AS ride_count_vehicle_type
FROM uber_ride
GROUP BY vehicle_type;

SELECT Vehicle_Type, COUNT(*) AS total
FROM uber_ride
GROUP BY Vehicle_Type;


-- 5. Find distinct payment methods used
SELECT DISTINCT(payment_method) AS Types_of_payment
FROM uber_ride;

-- 6. Average ride distance
SELECT AVG(ride_distance) AS Average_ride_distance
FROM uber_ride;

-- 7. Average booking value
SELECT AVG(booking_value) AS average_booking_value
FROM uber_ride;

-- 8. Find total rides cancelled by customers
SELECT SUM(cancelled_rides_by_customer) AS total_customer_cancels
FROM uber_ride;

-- 9. List top 5 pickup locations by ride count
SELECT Pickup_Location, COUNT(*) AS ride_count
FROM uber_ride
GROUP BY Pickup_Location
ORDER BY ride_count DESC
LIMIT 5;

-- 10. Show all completed rides with rating >= 4.5
SELECT Booking_ID, Customer_ID, Driver_Ratings, Customer_Rating
FROM uber_ride
WHERE booking_status='Completed'AND Customer_rating>= '4.5';


SELECT*FROM uber_ride;
--Advanced Queries:

--Top 3 drivers by average rating who completed more than 50 rides
SELECT Customer_ID AS Driver_ID, 
       AVG(Driver_Ratings) AS avg_rating,
       COUNT(*) AS completed_rides
FROM uber_ride
WHERE Booking_Status = 'Completed'
GROUP BY Customer_ID
HAVING COUNT(*) > 50
ORDER BY avg_rating DESC
LIMIT 3;

--Day with the highest total booking value
SELECT TO_CHAR(DATE,'DAY') AS day_name, EXTRACT(DAY FROM DATE) AS DAY_OF_MONTH, SUM(booking_value) AS day_with_highest_booking
FROM uber_ride
GROUP BY TO_CHAR(DATE,'DAY'), EXTRACT(DAY FROM DATE) 
ORDER BY day_with_highest_booking DESC
LIMIT 1;


--Percentage of rides cancelled by customers vs drivers per vehicle type
SELECT Vehicle_Type,
       SUM(Cancelled_Rides_by_Customer) * 100.0 / COUNT(*) AS customer_cancel_percent,
       SUM(Cancelled_Rides_by_Driver) * 100.0 / COUNT(*) AS driver_cancel_percent
FROM uber_ride
GROUP BY Vehicle_Type;


--Average ride distance and booking value per payment method
SELECT payment_method,
AVG(ride_distance) AS avg_ride_distance, 
AVG(booking_value) AS avg_booking_value
FROM uber_ride
GROUP BY payment_method;

--Rank pickup locations by total booking value
SELECT pickup_location,
SUM(booking_value) AS total_booking_value,
RANK() OVER (ORDER BY SUM(booking_value) DESC)
FROM uber_ride
GROUP BY pickup_location ;


--Customers who never cancelled a ride but have average rating below 3
SELECT customer_id, 
        AVG(customer_rating) AS average_rating
FROM uber_ride
GROUP BY customer_id
HAVING SUM(cancelled_rides_by_customer)=0
        AND AVG (Customer_rating)< 3;


--Vehicle type with highest average booking value for rides > 10 km
SELECT vehicle_type,
AVG(booking_value) AS average_booking_value
FROM uber_ride
WHERE ride_distance>'10'
GROUP BY vehicle_type
ORDER BY average_booking_value DESC
LIMIT 1;

--For each driver, show total completed rides and total cancelled rides
SELECT Customer_ID AS Driver_ID,
       SUM(CASE WHEN Booking_Status='Completed' THEN 1 ELSE 0 END) AS completed_rides,
       SUM(Cancelled_Rides_by_Driver) AS cancelled_by_driver
FROM uber_ride
GROUP BY Customer_ID;


--Monthly trend of completed rides
SELECT EXTRACT(MONTH FROM Date) AS month,
       COUNT(*) AS completed_rides
FROM uber_ride
WHERE Booking_Status='Completed'
GROUP BY EXTRACT(MONTH FROM Date)
ORDER BY month;

--Top 5 customers contributing to highest revenue
SELECT Customer_ID,
       SUM(Booking_Value) AS total_spent
FROM uber_ride
GROUP BY Customer_ID
ORDER BY total_spent DESC
LIMIT 5;

