##Customer Lifetime Value Analysis
WITH customer_metrics AS (
    SELECT
        Customer_ID,

        COUNT(DISTINCT Order_ID) AS total_orders,

        ROUND(SUM(Revenue), 2) AS total_revenue,

        ROUND(
            SUM(Revenue) / COUNT(DISTINCT Order_ID),
            2
        ) AS revenue_per_order,

        MIN(Order_Date) AS first_order_date,

        MAX(Order_Date) AS last_order_date

    FROM transactions

    GROUP BY Customer_ID
)

SELECT
    Customer_ID,
    total_orders,
    total_revenue,
    revenue_per_order,
    first_order_date,
    last_order_date,

    TIMESTAMPDIFF(
        MONTH,
        first_order_date,
        last_order_date
    ) AS customer_lifetime_months

FROM customer_metrics

ORDER BY total_revenue DESC;