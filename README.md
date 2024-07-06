dbt Snowflake Project
Overview
This project demonstrates an end-to-end data engineering workflow using dbt with Snowflake, focusing on data transformation, modeling, and orchestration. The project is structured into three main layers: Staging, Data Warehouse, and Marts. Additionally, CI/CD is implemented using GitHub Actions, and orchestration is handled using Dagster.


Project Structure
1. Staging Layer
Purpose: Perform initial data transformations.
Transformation Type: 1-to-1 to the source.
Materialization: Views.
Operations: Casting, renaming columns, and applying CASE WHEN statements.
2. Data Warehouse Layer
Purpose: Data modeling.
Schema: Star schema.
Tables:
Fact Tables: Central tables in the schema containing measurable, quantitative data.
Dimension Tables: Support fact tables and provide context to the data (e.g., time, geography, products).
3. Marts Layer
Purpose: Create aggregated tables based on business requirements.
Tables:
One Big Table: Consolidated table for reporting.
Cube Tables: Pre-aggregated tables designed for fast querying and reporting.
CI/CD Using GitHub Actions
Automated Processes:
Build: Compile and test the dbt project.
Test: Run dbt tests to ensure data quality.
Deploy: Deploy the changes to the production environment.
Documentation: Host the dbt documentation using GitHub Pages (automated).
Orchestration Using Dagster
Extract & Load: Orchestrate the extraction and loading of data.
Transformations: Orchestrate the dbt transformations.
