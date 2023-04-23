--4. Crie uma `view` chamada `customers_by_region` que utiliza os dados da tabela `customers`. A visão deve realizar uma agregação por
-- região do Brasil (Norte, Nordeste, Sudeste, Centro Oeste e Sul) e contar o número de clientes em cada uma d

{{
  config(
    materialized='view'
  )
}}

SELECT
  CASE
    WHEN customer_state IN ('AC', 'AM', 'AP', 'PA', 'RO', 'RR', 'TO') THEN 'Norte'
    WHEN customer_state IN ('AL', 'BA', 'CE', 'MA', 'PB', 'PE', 'PI', 'RN', 'SE') THEN 'Nordeste'
    WHEN customer_state IN ('ES', 'MG', 'RJ', 'SP') THEN 'Sudeste'
    WHEN customer_state IN ('DF', 'GO', 'MS', 'MT') THEN 'Centro-Oeste'
    WHEN customer_state IN ('PR', 'RS', 'SC') THEN 'Sul'
  END AS region,
  COUNT(DISTINCT customer_id) AS num_customers
FROM
    `dbt_shop.custmers`
GROUP BY
  1

