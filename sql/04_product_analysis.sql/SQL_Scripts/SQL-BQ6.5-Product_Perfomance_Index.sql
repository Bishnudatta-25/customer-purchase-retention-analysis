##PRODUCT PERFORMANCE INDEX

WITH product_metrics AS (
    SELECT
        Product_ID,
        Product_Name,
        Category,
        COUNT(DISTINCT Order_ID) AS total_orders,
        SUM(Revenue) AS total_revenue,
        ROUND(
            SUM(Revenue) / COUNT(DISTINCT Order_ID),
            2
        ) AS revenue_per_order
    FROM transactions
    GROUP BY
        Product_ID,
        Product_Name,
        Category
)

SELECT
    Product_ID,
    Product_Name,
    Category,
    total_orders,
    total_revenue,
    revenue_per_order,

    CASE
        WHEN total_orders > 736
             AND revenue_per_order > 2523
            THEN 'Core High-Value'

        WHEN total_orders <= 736
             AND revenue_per_order > 2523
            THEN 'Premium/Niche'

        WHEN total_orders > 736
             AND revenue_per_order <= 2523
            THEN 'Volume Product'

        ELSE 'Low-Value/Low-Volume'
    END AS product_segment

FROM product_metrics

ORDER BY
    product_segment,
    total_revenue DESC;