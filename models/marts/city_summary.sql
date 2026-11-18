-- Downstream of customer_summary: city-level rollup for E2E lineage testing
SELECT
    city,
    COUNT(*) AS total_customers,
    SUM(total_accounts) AS total_accounts,
    SUM(total_balance) AS total_balance
FROM {{ ref('customer_summary') }}
GROUP BY city
