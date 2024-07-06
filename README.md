## Overview
This repository contains the dbt project structure for an end-to-end data engineering workflow using Snowflake. The project focuses on data transformation, modeling, orchestration, and automation using CI/CD. Below is the architecture diagram that outlines the various layers and components of the project.

### Project Data Architecture Diagram
![readme-](https://github.com/dbtrick/project01_dbt_snowflake/assets/172040645/c61a9942-bf02-451b-add2-3e94a93bb0b9)

### dbt Project Structure
## [Staging Layer](https://github.com/dbtrick/project01_dbt_snowflake/tree/main/models/staging/gsheets)
- **Materialized as Views:** Data is materialized as views.
- **One-to-One to the Sources:** Each staging model corresponds directly to a source table.
- **Transformations:**
    - **Casting:** Ensure data types are correctly cast.
    - **Renaming:** Rename columns to align with naming conventions.
    - **SQL Conditional Statements:** Utilize CASE WHEN statements for conditional logic.
- **Automation:** Utilized dbt [codegen](https://hub.getdbt.com/dbt-labs/codegen/latest/) to automate the extraction of source tables and columns.
  
### [Warehouse Layer](https://github.com/dbtrick/project01_dbt_snowflake/tree/main/models/warehouse)
- **Facts and Dimensions Tables:** Create fact and dimension tables based on the star schema.
- **Surrogate Keys:** Utilized [dbt_utils](https://hub.getdbt.com/dbt-labs/dbt_utils/latest/) to generate surrogate keys.
  
### [Marts Layer](https://github.com/dbtrick/project01_dbt_snowflake/tree/main/models/marts)
- **One Big Table:** Aggregate data into a single table for easy access and analysis.
- **Cube Table:** Create aggregate tables based on business requirements.

### [CI/CD with GitHub Actions](https://github.com/dbtrick/project01_dbt_snowflake/tree/main/.github/workflows)
- **Automate dbt Build:** Automate the dbt build process before deploying models.
- **Automate dbt Documentation:** Generate dbt documentation and host it using GitHub Pages.

### [Orchestration with Dagster](https://github.com/dbtrick/project01_dbt_snowflake/tree/main/dw_dagster)
- **Airbyte for Extraction:** Orchestrate the data extraction process using Airbyte.
- **dbt for Transformation:** Orchestrate the data transformation process using dbt.

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
