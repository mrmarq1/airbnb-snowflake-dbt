# Airbnb dbt project

Project aims to provide practice for Snowflake-dbt stack. Cloud-based pipeline to involve extraction of RDS dataset (sourced from insideairbnb.com) into Snowflake with dbt sitting over the transformation layer and the BI tool Preset working to generate business insight.

## Configured Snowflake-dbt stack
- Set up Snowflake account and created the roles, users, permissions, database, schema and tables (3) in preparation for the RDS dataset.
- Loaded RDS data into related tables in Snowflake.
- Created local 'dbtlearn' project (dbt-snowflake version 1.5.0).
- Established connection with Snowflake account and previously set-up database.