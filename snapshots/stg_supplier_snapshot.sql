{% snapshot stg_orders_snapshot %}

{{
    config(
      target_database='rawdata_db',  -- Change this to your actual target database
      target_schema='snapshot',
       -- Assuming 'o_orderkey' is the primary key in your orders model

      strategy='timestamp'
       -- Replace 'o_orderdate' with the actual timestamp column if different
    )
}}

SELECT * FROM {{ ref('stg_supplier') }}

{% endsnapshot %}