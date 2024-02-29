{% snapshot customer_snapshot %}

{{
    config(
      target_database='rawdat_db',
      target_schema='snapshots',
      unique_key='id',
      strategy='timestamp',
      updated_at='updated_at',
    )
}}

SELECT * FROM {{ ref('stg_customers') }}

{% endsnapshot %}
