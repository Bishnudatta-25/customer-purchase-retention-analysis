##ORDER VOLUME V/S REVENUE

SELECT
    Product_Name,
    Category,
    SUM(Revenue) AS total_revenue,
    COUNT(DISTINCT Order_ID) AS total_orders,
    ROUND(
    SUM(Revenue)/COUNT(DISTINCT Order_ID),2)AS revenue_per_order
FROM transactions
GROUP BY
    Product_Name,
    Category
ORDER BY revenue_per_order DESC
LIMIT 10;