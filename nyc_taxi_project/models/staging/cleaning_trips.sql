CREATE OR REPLACE TABLE STAGING.clean_trips AS
SELECT
    -- IDs
    VendorID,
    passenger_count,
    PULocationID,
    DOLocationID,

    -- Timestamps
    tpep_pickup_datetime,
    tpep_dropoff_datetime,

    -- Raw measures
    trip_distance,
    fare_amount,
    tip_amount,
    total_amount,

    -- =========================
    -- ENRICHMENTS
    -- =========================

    -- Trip duration (minutes)
    DATEDIFF('minute', tpep_pickup_datetime, tpep_dropoff_datetime) AS trip_duration_min,

    -- Time dimensions
    EXTRACT(HOUR  FROM tpep_pickup_datetime) AS pickup_hour,
    EXTRACT(DAY   FROM tpep_pickup_datetime) AS pickup_day,
    EXTRACT(MONTH FROM tpep_pickup_datetime) AS pickup_month,
    CAST(tpep_pickup_datetime AS DATE) AS pickup_date,

    -- Average speed (mph)
    CASE 
        WHEN DATEDIFF('minute', tpep_pickup_datetime, tpep_dropoff_datetime) > 0
        THEN trip_distance / (DATEDIFF('minute', tpep_pickup_datetime, tpep_dropoff_datetime) / 60.0)
        ELSE NULL
    END AS avg_speed_mph,

    -- Tip percentage
    CASE 
        WHEN fare_amount > 0 
        THEN (tip_amount / fare_amount) * 100
        ELSE NULL
    END AS tip_pct

FROM RAW.yellow_taxi_trips
WHERE
    -- Remove negative amounts
    fare_amount >= 0
    AND total_amount >= 0

    -- Logical timestamps
    AND tpep_pickup_datetime < tpep_dropoff_datetime

    -- Distance filter
    AND trip_distance BETWEEN 0.1 AND 100

    -- Non-null zones
    AND PULocationID IS NOT NULL
    AND DOLocationID IS NOT NULL;
