-- {% snapshot stg_customers_snapshot %}

-- {{
--     config(
--         target_schema='snapshot',
--         unique_key='c_custkey',  -- Primary key of the customer table
--         strategy='timestamp',
--         updated_at='valid_to'  -- This is a system column managed by dbt for timestamp-based snapshots
--     )
-- }}

-- SELECT * FROM {{ ref('stg_customers') }}

-- {% endsnapshot %}


{% snapshot stg_orders_snapshot %}

{{
    config(
      target_database='rawdata_db',  -- Change this to your actual target database
      target_schema='snapshot'
       -- Assuming 'o_orderkey' is the primary key in your orders model

      strategy='timestamp'
       -- Replace 'o_orderdate' with the actual timestamp column if different
    )
}}

SELECT * FROM {{ ref('stg_customer') }}

{% endsnapshot %}
