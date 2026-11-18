SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(a.account_id) AS total_accounts,
    COALESCE(SUM(a.balance), 0) AS total_balance
FROM {{ source('banking', 'customers') }} c
LEFT JOIN {{ source('banking', 'accounts') }} a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
