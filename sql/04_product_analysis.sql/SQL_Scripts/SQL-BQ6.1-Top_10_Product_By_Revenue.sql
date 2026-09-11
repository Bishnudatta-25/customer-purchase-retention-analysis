SELECT
    Product_ID,
    Product_Name,
    Category,
    COUNT(DISTINCT Order_ID) AS total_orders,
    SUM(Revenue) AS total_revenue,
    SUM(Quantity) AS total_quantity
FROM transactions
GROUP BY
    Product_ID,
    Product_Name,
    Category
ORDER BY total_revenue DESC
LIMIT 10;