USE healthcare;

SELECT*FROM fact_bookings;

----- Q1. Looking at the sum of revenue realised from each property.

SELECT
    DISTINCT dim_hotels.property_name,
     dim_hotels.category,
     fact_bookings.revenue_realized
FROM dim_hotels
     INNER JOIN fact_bookings
         ON dim_hotels.property_id=fact_bookings.property_id
GROUP BY dim_hotels.property_name;
         
------ Q2. Number of total bookings and average of ratings.
SELECT 
     DISTINCT COUNT(booking_id) AS Number_Of_Total_Bookings,
     AVG(ratings_given) AS Average_Of_Ratings
FROM fact_bookings;

------ Q3. Sum of capacity and successful bookings. Also shown the occupancy %.

SELECT 
     DISTINCT SUM(capacity) AS Sum_Of_Capacity,
     SUM(successful_bookings) AS Sum_Of_Successful_bookings,
     (SUM(capacity)/SUM(successful_bookings))*100 AS Occupancy_Percentage
FROM fact_aggregated_bookings;
 
---- Q4. Show the total number pf cancelled bookings.

SELECT 
      COUNT(booking_id) AS Cancelled_Bookings
FROM fact_bookings
WHERE booking_status="Cancelled";


