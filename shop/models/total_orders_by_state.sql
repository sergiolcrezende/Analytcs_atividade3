
-- 2. Crie uma `view` que agrega os totais de pedidos por estado. Considere as tabelas _customers_ para obter os estados (coluna _customer_state_)
--   e _orders_ para contabilizar a quantidade de pedidos.

{{ config(materialized='view') }}

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


