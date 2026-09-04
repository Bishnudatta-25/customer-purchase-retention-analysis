##Marketing Channel Performance
USE customer_retention_analysis;

SELECT
    Marketing_Channel AS marketing_channel,

    COUNT(DISTINCT Customer_ID) AS total_customers,

    COUNT(DISTINCT Order_ID) AS total_orders,

    ROUND(SUM(Revenue), 2) AS total_revenue,

    ROUND(
        SUM(Revenue) / COUNT(DISTINCT Order_ID),
        2
    ) AS average_order_value,

    ROUND(
        SUM(Revenue) / COUNT(DISTINCT Customer_ID),
        2
    ) AS revenue_per_customer

FROM transactions

GROUP BY Marketing_Channel

ORDER BY total_revenue DESC;