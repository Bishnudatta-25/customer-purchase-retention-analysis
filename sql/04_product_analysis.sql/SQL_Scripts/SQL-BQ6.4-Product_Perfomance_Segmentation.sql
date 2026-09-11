##PRODUCT PERFOMANCE SEGMENTATION

WITH product_metrics AS (
    SELECT
        Product_ID,
        Product_Name,
        Category,
        COUNT(DISTINCT Order_ID) AS total_orders,
        SUM(Revenue) AS total_revenue,
        SUM(Revenue) / COUNT(DISTINCT Order_ID) AS revenue_per_order
    FROM transactions
    GROUP BY
        Product_ID,
        Product_Name,
        Category
),

ranked AS (
    SELECT
        *,
        ROW_NUMBER() OVER (ORDER BY total_orders) AS order_rank,
        ROW_NUMBER() OVER (ORDER BY revenue_per_order) AS revenue_rank
    FROM product_metrics
)

SELECT
    MAX(CASE WHEN order_rank = 12 THEN total_orders END) AS median_orders,
    ROUND(
    MAX(CASE WHEN revenue_rank = 12 THEN revenue_per_order END),2) AS median_revenue_per_order
FROM ranked;