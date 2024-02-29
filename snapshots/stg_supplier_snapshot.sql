{% snapshot stg_supplier_snapshot %}

{{
    config(
        target_schema='snapshot',
        unique_key='s_suppkey',  -- Primary key of the supplier table
        strategy='timestamp',
        updated_at='valid_to'  -- System column managed by dbt
    )
}}

SELECT * FROM {{ ref('stg_supplier') }}

{% endsnapshot %}