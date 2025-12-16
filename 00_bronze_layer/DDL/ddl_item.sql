CREATE SCHEMA IF NOT EXISTS workspace.bronze_layer;

-- Create the item table
CREATE TABLE IF NOT EXISTS workspace.bronze_layer.bronze_item (
  adjective STRING,
  category STRING,
  created_at STRING,
  id STRING,
  modifier STRING,
  name STRING,
  price STRING,
  tc_ingestion_timestamp TIMESTAMP,
  tc_source_file STRING,
  tc_bronze_id BIGINT
)
USING DELTA
TBLPROPERTIES (delta.enableChangeDataFeed = true);



