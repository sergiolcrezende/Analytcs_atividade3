--3. De acordo com o resultado do exercício 2 retorne apenas os estados que tem mais de 5000 pedidos, esse número deve ser 
--  passado via variável `number_of_orders` do `dbt`.

{{
  config(
    materialized='view'
  )
}}

SELECT
  `dbt_shop.custmers`.customer_state,
  COUNT(`dbt_shop.orders`.order_id) AS num_orders
FROM
    `dbt_shop.custmers`
JOIN
    `dbt_shop.orders` 
ON
  `dbt_shop.custmers`.customer_id = `dbt_shop.orders`.customer_id
GROUP BY
  1
HAVING
  COUNT(`dbt_shop.orders`.order_id) > {{ var('number_of_orders') }}

