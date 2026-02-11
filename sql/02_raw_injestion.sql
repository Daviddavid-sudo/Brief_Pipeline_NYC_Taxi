USE DATABASE NYC_TAXI_DB;
USE SCHEMA RAW;

CREATE OR REPLACE FILE FORMAT parquet_format
TYPE = PARQUET;


CREATE OR REPLACE STAGE raw_internal_stage;
list @raw_internal_stage;

CREATE OR REPLACE TABLE RAW.yellow_taxi_trips
USING TEMPLATE (
    SELECT ARRAY_AGG(OBJECT_CONSTRUCT(*))
    FROM TABLE(
        INFER_SCHEMA(
            LOCATION => '@raw_internal_stage/yellow_tripdata_2025-09.parquet',
            FILE_FORMAT => 'parquet_format'
        )
    )
);

DESC TABLE RAW.yellow_taxi_trips;

COPY INTO RAW.yellow_taxi_trips
FROM @raw_internal_stage
FILE_FORMAT = (FORMAT_NAME = parquet_format)
MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE
PATTERN = '.*yellow_tripdata_2025.*.parquet';

SELECT COUNT(*) FROM RAW.yellow_taxi_trips;