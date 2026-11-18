SELECT
    customer_id,
    customer_name,
    COUNT(*) AS total_records
FROM {{ ref('customer_summary') }}
GROUP BY
    customer_id,
    customer_name
