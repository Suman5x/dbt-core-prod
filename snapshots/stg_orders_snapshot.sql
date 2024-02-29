{% snapshot orders_snapshot %}

{{
    config(
      target_database='rawdata_db',
      target_schema='snapshots',
      unique_key='o_orderkey',
      strategy='timestamp',
      updated_at='updated_at',
    )
}}

SELECT * FROM {{ ref('stg_orders') }}

{% endsnapshot %}