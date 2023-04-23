

---1. Crie uma tabela `orders_by_year` a partir de `orders` que agrupa a quantidade de pedidos por ano, considerando a coluna `order_approved_at`
{{ config(materialized='table') }}

SELECT
    EXTRACT(YEAR FROM order_approved_at) AS order_approved_year,
    COUNT(order_id) AS num_orders
FROM
     `dbt_shop.orders`
GROUP BY
    1
 
