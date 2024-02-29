{% snapshot stg_orders_snapshot %}

    {{ config(
        target_schema='snapshot',
        unique_key='o_orderkey',  -- Primary key of the orders table
        strategy='timestamp',
        updated_at='valid_to'  -- This should be a column in your source data indicating when the record was last updated
    ) }}

    SELECT * FROM {{ ref('stg_orders') }}

{% endsnapshot %}
