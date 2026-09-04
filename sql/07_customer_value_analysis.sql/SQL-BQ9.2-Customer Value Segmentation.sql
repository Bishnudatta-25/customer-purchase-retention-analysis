##Customer Value Segmentation
WITH customer_revenue AS (
    SELECT
        Customer_ID,
        SUM(Revenue) AS total_revenue
    FROM transactions
    GROUP BY Customer_ID
),

customer_quartiles AS (
    SELECT
        Customer_ID,
        total_revenue,

        NTILE(4) OVER (
            ORDER BY total_revenue
        ) AS revenue_quartile

    FROM customer_revenue
)

SELECT
    revenue_quartile,
    COUNT(*) AS customer_count,
    ROUND(MIN(total_revenue), 2) AS minimum_revenue,
    ROUND(MAX(total_revenue), 2) AS maximum_revenue,
    ROUND(AVG(total_revenue), 2) AS average_revenue

FROM customer_quartiles

GROUP BY revenue_quartile

ORDER BY revenue_quartile;