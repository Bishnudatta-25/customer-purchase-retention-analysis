USE customer_retention_analysis;
WITH category_sales AS(
SELECT Category AS category,
SUM(Revenue) AS total_revenue,
COUNT(DISTINCT(Order_ID)) AS total_orders,
SUM(Quantity) AS total_quantity
FROM transactions
GROUP BY Category)
SELECT category,
total_revenue,
total_orders,
total_quantity,
ROUND(
total_revenue/total_orders,2
) AS average_order_value,
ROUND(
total_revenue/total_quantity,2
) AS revenue_per_unit
FROM category_sales
ORDER BY total_revenue DESC;


