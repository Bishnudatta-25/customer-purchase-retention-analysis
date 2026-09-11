##REVENUE BY CATEGORY

USE customer_retention_analysis;
SELECT Category,
SUM(Revenue) AS total_revenue,
COUNT(DISTINCT(Order_ID)) AS total_orders,
SUM(Quantity) AS total_quantity
FROM transactions
GROUP BY Category
ORDER BY total_revenue DESC;
