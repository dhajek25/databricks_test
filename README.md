# merkle_repo

This repository organizes a data pipeline into three layers, each with its own notebook:

* **00_bronze_layer/00_ntb_bronze_ingest_data.ipynb**: Ingests raw data into the bronze layer, performing minimal transformations and storing the initial dataset for further processing.
* **01_silver_layer/01_ntb_silver_clean_data.ipynb**: Cleans and refines the bronze data and prepares a high-quality silver dataset for analytics.
* **02_gold_layer/02_ntb_gold_create_dataframe.ipynb**: Aggregates and analyzes the silver data to produce gold-level analytics marts, such as top item views by platform and year.

Each notebook builds upon the previous layer, enabling robust, modular data engineering and analytics workflows.