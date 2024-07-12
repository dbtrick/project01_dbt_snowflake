## Overview
For this project, I worked with sample client DVD Rental to revolutionize their DVD rental operations. Using advanced data technologies, I implemented a comprehensive solution for data management and analytics. The project includes leveraging Snowflake for scalable data storage, Airbyte for seamless data integration, dbt for automated data transformations, Git and GitHub for version control, GitHub Actions for CI/CD automation, Looker for intuitive data visualization, and Dagster for orchestrating data workflows. The dataset provided by DVD Rental encompasses critical insights into their rental business operations. [DVD Rental Sample Datasets.](https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/)
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
- **View dbt documentation:** https://dbtrick.github.io/project01_dbt_snowflake/#!/overview

### [Orchestration with Dagster](https://github.com/dbtrick/project01_dbt_snowflake/tree/main/dw_dagster)
- **Airbyte for Extraction:** Orchestrate the data extraction process using Airbyte.
- **dbt for Transformation:** Orchestrate the data transformation process using dbt.

### [Data Visualization using Looker](https://lookerstudio.google.com/reporting/4b27a047-c5e6-4e6a-bd0e-f913677c2b79/page/Dub4D)
- Enhanced sales insights with a detailed ”Contribution of Each Store to Total Sales” chart.
- Boosted team performance through the ”Top Performing Employees” chart.
- Improved customer retention strategies using ”Customer Engagement Levels” analysis.
- Refined marketing strategies by identifying ”Most Popular DVD Rental Locations.”


