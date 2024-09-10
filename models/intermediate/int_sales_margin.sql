SELECT
   products_id,
   date_date,
   orders_id,
   revenue,
   quantity,
   purchase_price,
   ROUND(CAST(s.quantity AS FLOAT64) * CAST(p.purchase_price AS FLOAT64), 2) AS purchase_cost,
   ROUND((s.revenue - CAST(s.quantity AS FLOAT64) * CAST(p.purchase_price AS FLOAT64)), 2) AS margin
FROM {{ref("stg_raw__sales")}} s
LEFT JOIN {{ref("stg_raw__product")}} p
   USING (products_id)