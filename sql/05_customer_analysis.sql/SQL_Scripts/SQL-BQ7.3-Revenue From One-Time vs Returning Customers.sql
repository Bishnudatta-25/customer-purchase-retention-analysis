##Revenue: One-Time vs Returning Customers
WITH customer_metrics AS (
    SELECT
        Customer_ID,
        COUNT(DISTINCT Order_ID) AS total_orders,
        SUM(Revenue) AS total_revenue
    FROM transactions
    GROUP BY Customer_ID
)

SELECT
    CASE
        WHEN total_orders = 1 THEN 'ONE-TIME'
        ELSE 'RETURNING'
    END AS customer_type,

    COUNT(*) AS customer_count,

    ROUND(SUM(total_revenue), 2) AS total_revenue,

    ROUND(
        SUM(total_revenue) /
        (SELECT SUM(total_revenue) FROM customer_metrics) * 100,
        2
    ) AS revenue_percentage,

    ROUND(
        AVG(total_revenue),
        2
    ) AS avg_revenue_per_customer

FROM customer_metrics

GROUP BY
    CASE
        WHEN total_orders = 1 THEN 'ONE-TIME'
        ELSE 'RETURNING'
    END

ORDER BY total_revenue DESC;