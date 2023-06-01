# Airbnb dbt project

Lightweight project that aims to provide practice for Snowflake-dbt stack. Cloud-based pipeline to involve extraction of RDS dataset (sourced from insideairbnb.com) into Snowflake with dbt sitting over the transformation layer and the BI tool Preset working to generate business insight.

## Configured Snowflake-dbt stack
- Set up Snowflake account and created the roles, users, permissions, database, schema and 3 tables in preparation for the RDS dataset.
- Loaded RDS data into related tables in Snowflake.
- Created local 'dbtlearn' project (dbt-snowflake version 1.5.0).
- Established connection with Snowflake account and previously set-up database.

## Created staging layer (raw layer transformations)

- Added 3 'src' dbt models to perform lightweight transformations of raw layer creating three views: src_hosts, src_listings and src_reviews.

## Created core layer (staging layer transformations)

- Added 2 'dim' dbt models: performed transformation of src_listings and src_hosts, creating dim_listings_cleaned and dim_hosts_cleaned respectively.
- Added one 'fct' dbt model: created an incremental materialisation of src_reviews with a Jinja function specifying that only new reviews (by review_date order) to be appended.
- Added one 'dim' dbt model: combined previous two dim tables with left join (dim_listings_cleaned and dim_hosts_cleaned).
- Updated dbt_project.yml to specify default materialisation (view) and model-specific materialisations (dim: table, src: ephemeral).
- Materialisations as per yml file for dim_listings_cleaned and dim_hosts_cleaned overwritten to enforce views as tables not required for these models.

## Added sources.yml

- Aliased raw layer to enable staging layer to reference them via source template.
- Created a refreshness check for raw_reviews with a warning or error thrown if records not updated with 1hr or  24hrs respectively.

## Created snapshot

- Snapshotted raw_listings so SCD type 2 updating strategy applied to new record insertion.
