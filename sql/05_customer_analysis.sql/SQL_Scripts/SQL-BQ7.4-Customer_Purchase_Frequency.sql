##CUSTOMER PURCHASE FREQUENCY
WITH customer_orders AS(
SELECT Customer_ID,
COUNT(DISTINCT(Order_ID)) AS total_orders
FROM transactions
GROUP BY Customer_ID
ORDER BY total_orders DESC)

SELECT 
CASE
	WHEN total_orders=1 THEN 'ONE-TIME'
    WHEN total_orders BETWEEN 2 AND 3 THEN 'OCCASIONAL REPEAT'
    WHEN total_orders BETWEEN 4 AND 6 THEN 'REGULAR'
    ELSE 'HIGHLY ENGAGED'
END AS customer_segment,
COUNT(*) AS customer_count,
ROUND(
COUNT(*)/(SELECT COUNT(*) FROM customer_orders)*100,2
) AS customer_percentage
FROM customer_orders
GROUP BY customer_segment
ORDER BY customer_percentage DESC;
