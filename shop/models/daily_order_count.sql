 
 
   {{ config(materialized='table') }}

   SELECT
      DATE(order_delivered_carrier_date) AS shipping_date, 
      count(order_id) AS num_orders1 
   FROM 
      `dbt_shop.orders` 
   WHERE 
      DATE(order_delivered_carrier_date)='{{ var("ingestion_date") }}' 
   GROUP BY 
      1
