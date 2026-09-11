##REVENUE GENERATED FROM FREQUENCY SEGMENTS
WITH customer_metrics AS (
    SELECT
        Customer_ID,
        COUNT(DISTINCT Order_ID) AS total_orders,
        SUM(Revenue) AS total_revenue
    FROM transactions
    GROUP BY Customer_ID
),

customer_segments AS (
    SELECT
        Customer_ID,
        total_orders,
        total_revenue,

        CASE
            WHEN total_orders = 1
                THEN 'ONE-TIME'

            WHEN total_orders BETWEEN 2 AND 3
                THEN 'OCCASIONAL REPEAT'

            WHEN total_orders BETWEEN 4 AND 6
                THEN 'REGULAR'

            ELSE 'HIGHLY ENGAGED'
        END AS customer_segment

    FROM customer_metrics
)

SELECT
    customer_segment,
    COUNT(*) AS customer_count,
    ROUND(SUM(total_revenue), 2) AS total_revenue,

    ROUND(
        SUM(total_revenue) /
        (SELECT SUM(total_revenue) FROM customer_segments) * 100,
        2
    ) AS revenue_percentage,

    ROUND(
        AVG(total_revenue),
        2
    ) AS avg_revenue_per_customer

FROM customer_segments

GROUP BY customer_segment

ORDER BY total_revenue DESC;