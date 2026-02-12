CREATE OR REPLACE TABLE FINAL.daily_summary AS
SELECT
    pickup_date,

    COUNT(*) AS total_trips,
    AVG(trip_distance) AS avg_distance_miles,
    SUM(total_amount) AS total_revenue

FROM STAGING.clean_trips
GROUP BY pickup_date
ORDER BY pickup_date;
