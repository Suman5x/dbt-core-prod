{% snapshot supplier_snapshot %}

{{
    config(
      target_database='rawdata_db',
      target_schema='snapshots',
      unique_key='id',
      strategy='timestamp',
      updated_at='updated_at',
    )
}}

SELECT * FROM {{ ref('stg_supplier') }}

{% endsnapshot %}