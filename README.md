# merkle_repo

This repository organizes a data pipeline into three layers, each with its own notebooks:

* **00_bronze_layer/00_ntb_ddl.ipynb**: For DDL scripts.
* **00_bronze_layer/00_ntb_bronze_ingest_data.ipynb**: Ingests raw data into the bronze layer, performing minimal transformations and storing the initial dataset for further processing.
* **01_silver_layer/01_ntb_silver_clean_data.ipynb**: Cleans and refines the bronze data and prepares a high-quality silver dataset for analytics.
* **02_gold_layer/02_ntb_gold_create_dataframe.ipynb**: Aggregates and analyzes the silver data to produce gold-level analytics marts, such as top item views by platform and year.

Each notebook builds upon the previous layer, enabling robust, modular data engineering and analytics workflows.


------------------------------------------------------------------------------------------------------------

**Questions and Answers**

1. What steps are missing to industrialize such solution further

**Orchestration & Scheduling**

Current: Manual notebook execution

Missing:

Workflow orchestration (Databricks Workflows)

Scheduled runs with dependencies

Error handling and retry logic

Alerting on failures

**Version Control & CI/CD**

Current: Git integration for notebooks 

Missing:


Git integration for notebooks

Deployment pipelines

Environment management (dev/staging/prod)

**Data Quality & Testing**

Current: No data quality checks

Missing:

Schema validation

Data quality rules (Great Expectations, dbt tests)

Data freshness monitoring

Row count and uniqueness checks

**Documentation & Metadata**

Current: Basic README

Missing:

Data catalog (column descriptions, lineage)

Business logic documentation

**Configuration Management**

Current: Hardcoded values (S3 paths, table names)

Missing:

Environment-specific configs

Parameterized notebooks/jobs

Secrets management - files are reachable from the Internet

**Monitoring & Observability**

Current: Print statements

Missing:

Structured logging

Metrics (execution time, data volumes)

Dashboard for pipeline health

Cost tracking

**Performance Optimization**

Current: Basic partitioning, Full Load

Missing:

Z-ordering/clustering

Caching strategies

Query optimization

Resource tuning

Incremental Load

If the solution was implemented in dbt-core, how would the overall architecture change?

2. **Current Architecture (Databricks Notebooks)**

S3 → Databricks Notebooks (PySpark) → Delta Tables (Bronze/Silver/Gold)

**Proposed Architecture (dbt-core)**

S3 → Databricks (Bronze) → dbt-core (Silver/Gold) → Delta Tables

**Separation of Concerns**

Bronze: Keep in Databricks (raw ingestion)

Silver/Gold: Move to dbt-core models

dbt runs on Databricks: Uses dbt-databricks adapter

**Execution Model**

Current: Notebook cells executed sequentially

dbt: DAG-based execution with dependency management

Models defined as SQL files with Jinja templating

**Transformation Logic**

Current: PySpark DataFrames

dbt: SQL-based transformations (Spark SQL)

Reusable macros for common patterns

**Additional Cloud Resources Needed**

No Additional Resources

dbt-core runs on your local machine or existing compute

Databricks remains the compute/storage layer

No new cloud services required

3. **Upsides and Downsides of dbt-core** 

**Upsides**

SQL-First Approach (Easier for SQL-focused analysts, less Python knowledge required)

Dependency Management (Automatic DAG building, Incremental model runs)

Easier Testing - Built-in testing (not_null, unique, relationships), Custom tests

Incremental Models - Built-in incremental strategies, Efficient processing of new data

Environment Management - Easy dev/staging/prod switching, Environment-specific variables

No Vendor Lock - You can switch between vendors (no-vendor lock) to the future - thanks to ability to switch between database adaptors. 

**Downsides**

Learning New Tool (Jinja templating required, Different workflow than notebooks)

SQL Limitations (Complex Python logic harder to express)

Local Development Setup (Need local dbt installation, Connection to Databricks required)

Debugging (Less interactive than notebooks, Harder to inspect intermediate results)

Migration Effort (Rewrite PySpark logic to SQL, Some transformations may be more complex in SQL)

Databricks Integration (dbt-databricks adapter required, Some Databricks-specific features may need workarounds)

4. **Implementation**
Since I have never worked with dtb I think, I would need more time to implement solution. On the other hand, if we would implement it this stage of the project, adding dtb into the current architecture should not be hard task - I would say 3 MDs.



