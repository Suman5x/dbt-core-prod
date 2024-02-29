{% snapshot my_table_snapshot %}

{{
    config(
        target_schema='historical',  -- Replace with your target schema for snapshots
        unique_key='id',             -- The primary key of the source table, used to identify changes
        strategy='timestamp',        -- 'timestamp' or 'check'. Use 'check' for non-timestamp-based models.
        updated_at='updated_at'      -- The column that gets updated with a new timestamp on record change.
    )
}}

SELECT * FROM {{ ref('my_source_table') }} -- Replace with your source table reference

{% endsnapshot %}
