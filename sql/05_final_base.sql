-- Ready for dbt analytics layer
-- =====================================================

CREATE OR REPLACE TABLE FINAL.fact_trips AS
SELECT

    VENDOR_ID,
    PASSENGER_COUNT,
    TRIP_DISTANCE,
    RATE_CODE_ID,
    PU_LOCATION_ID,
    DO_LOCATION_ID,
    PAYMENT_TYPE,
    FARE_AMOUNT,
    EXTRA,
    MTA_TAX,
    TIP_AMOUNT,
    TOLLS_AMOUNT,
    TOTAL_AMOUNT,

    PICKUP_TS,
    DROPOFF_TS,

    -- Derived metrics (basic enrichment only)
    DATEDIFF(minute, PICKUP_TS, DROPOFF_TS) AS TRIP_DURATION_MINUTES,

    -- Date breakdown (very useful for dbt later)
    DATE(PICKUP_TS) AS TRIP_DATE,
    YEAR(PICKUP_TS) AS TRIP_YEAR,
    MONTH(PICKUP_TS) AS TRIP_MONTH,
    DAY(PICKUP_TS) AS TRIP_DAY,
    HOUR(PICKUP_TS) AS TRIP_HOUR

FROM STAGING.clean_trips;