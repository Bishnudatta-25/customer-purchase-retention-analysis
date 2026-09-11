##Frequency vs. Customer Value
WITH customer_metrics AS (
    SELECT
        Customer_ID,

        COUNT(DISTINCT Order_ID) AS total_orders,

        SUM(Revenue) AS total_revenue,

        SUM(Revenue) / COUNT(DISTINCT Order_ID) AS revenue_per_order

    FROM transactions

    GROUP BY Customer_ID
),

customer_quartiles AS (
    SELECT
        Customer_ID,
        total_orders,
        total_revenue,
        revenue_per_order,

        NTILE(4) OVER (
            ORDER BY total_revenue
        ) AS revenue_quartile

    FROM customer_metrics
)

SELECT
    CASE
        WHEN revenue_quartile = 1 THEN 'LOW VALUE'
        WHEN revenue_quartile = 2 THEN 'MEDIUM-LOW VALUE'
        WHEN revenue_quartile = 3 THEN 'MEDIUM-HIGH VALUE'
        WHEN revenue_quartile = 4 THEN 'HIGH VALUE'
    END AS customer_segment,

    COUNT(*) AS customer_count,

    ROUND(AVG(total_orders), 2) AS avg_orders_per_customer,

    ROUND(AVG(total_revenue), 2) AS avg_revenue_per_customer,

    ROUND(AVG(revenue_per_order), 2) AS avg_revenue_per_order

FROM customer_quartiles

GROUP BY revenue_quartile

ORDER BY revenue_quartile DESC;