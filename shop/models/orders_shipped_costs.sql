
         {{config(materialized='view')}}
      
         SELECT
            `dbt_shop.orders`.order_id,
            SUM(`dbt_shop.items`.price + `dbt_shop.items`.freight_value) AS order_total_cost
         FROM
            `dbt_shop.items`
            JOIN 
            `dbt_shop.orders`
            ON `dbt_shop.items`.order_id = `dbt_shop.orders`.order_id
         WHERE
         `dbt_shop.orders`.order_status = 'shipped'
         GROUP BY
         `dbt_shop.orders`.order_id
