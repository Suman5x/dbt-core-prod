{% snapshot stg_orders_snapshot %}


SELECT * FROM {{ ref('stg_supplier') }}

{% endsnapshot %}