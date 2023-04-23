-- Criando a tabela items_costs


{{ config(materialized='table') }}


SELECT
  `dbt_shop.items`.product_id as product,
  SUM(`dbt_shop.items`.price + `dbt_shop.items`.freight_value) as item_total_cost

FROM
   `dbt_shop.items` 
GROUP BY
  1
