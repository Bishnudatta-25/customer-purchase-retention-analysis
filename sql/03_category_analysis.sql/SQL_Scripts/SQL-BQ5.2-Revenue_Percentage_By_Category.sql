
USE customer_retention_analysis;

WITH category_sales AS (
	SELECT Category AS category,
    SUM(Revenue) AS total_revenue,
    COUNT(DISTINCT(Order_ID)) AS total_orders,
    SUM(Quantity) AS total_quantity
    FROM transactions
    GROUP BY Category
    )
SELECT
category,
total_revenue,
total_orders,
total_quantity,
ROUND(
	total_revenue/SUM(total_revenue) OVER() *100,2
) AS category_pct
FROM category_sales
ORDER BY category_pct DESC;