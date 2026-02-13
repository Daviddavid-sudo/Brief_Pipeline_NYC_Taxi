CREATE OR REPLACE TABLE FINAL.hourly_patterns AS
SELECT
    pickup_hour,

    COUNT(*) AS demand_trips,
    SUM(total_amount) AS hourly_revenue,
    AVG(avg_speed_mph) AS avg_speed_mph

FROM STAGING.clean_trips
GROUP BY pickup_hour
ORDER BY pickup_hour;
