-- models/staging/stg_customers.sql
--change to test slimci
{{ config(materialized='view', tags=['staging', 'customers']) }}

WITH source AS (
    SELECT * FROM {{ source('tpch', 'customer') }}
)
SELECT
    c_custkey,
    c_name,
    c_address,
    c_nationkey,
    c_phone,
    c_acctbal,
    c_mktsegment,
    c_comment
FROM source
