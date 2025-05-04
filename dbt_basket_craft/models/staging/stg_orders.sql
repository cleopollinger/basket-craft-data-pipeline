WITH raw_orders AS (
   SELECT *
   FROM {{ source('basket_craft', 'orders') }}
),
stg_orders AS (
   SELECT
       order_id,
       created_at,
       description AS order_description, – added order_ prefix
       order_name,
       CURRENT_TIMESTAMP AS loaded_at – for auditing and debugging
   FROM raw_orders
)
SELECT *
FROM stg_orders