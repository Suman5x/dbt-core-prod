{% snapshot stg_lineitem_snapshot %}

{{
    config(
        target_schema='snapshot',
        unique_key='composite_key',  -- Assuming there's no single PK, we might need to create a composite key
        strategy='check',
        check_cols=['l_orderkey', 'l_partkey', 'l_suppkey', 'l_linenumber']  -- List of columns to check for changes
    )
}}

SELECT *, CONCAT(l_orderkey, '-', l_partkey, '-', l_suppkey, '-', l_linenumber) AS composite_key FROM {{ ref('stg_lineitem') }}

{% endsnapshot %}
