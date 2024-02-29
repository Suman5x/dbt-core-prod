{% snapshot stg_customers_snapshot %}

{{
    config(
        target_schema='snapshot',
        unique_key='c_custkey',  -- Primary key of the customer table
        strategy='timestamp',
        updated_at='valid_to'  -- This is a system column managed by dbt for timestamp-based snapshots
    )
}}

SELECT * FROM {{ ref('stg_customers') }}

{% endsnapshot %}
