CREATE OR REPLACE TABLE FINAL.zone_analysis AS
SELECT
    PULocationID AS pickup_zone,

    COUNT(*) AS trip_volume,
    AVG(total_amount) AS avg_revenue_per_trip,

    -- Popularity = share of total trips
    COUNT(*) * 100.0 / SUM(COUNT(*)) OVER () AS popularity_pct

FROM STAGING.clean_trips
GROUP BY PULocationID
ORDER BY trip_volume DESC;
