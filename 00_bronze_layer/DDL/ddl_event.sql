CREATE SCHEMA IF NOT EXISTS workspace.bronze_layer;

-- Create the event table
CREATE TABLE IF NOT EXISTS workspace.bronze_layer.bronze_event (
  event_id STRING,
  event_time STRING,
  user_id STRING,
  event_payload STRING,
  tc_ingestion_timestamp TIMESTAMP,
  tc_source_file STRING,
  tc_bronze_id BIGINT
)
USING DELTA
TBLPROPERTIES (delta.enableChangeDataFeed = true);