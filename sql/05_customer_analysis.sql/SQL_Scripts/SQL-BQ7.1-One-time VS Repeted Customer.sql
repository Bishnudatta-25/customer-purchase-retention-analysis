###CUSTOMER RETAINTION ANALYSIS
##One-time VS Repeted Customer

WITH customer_orders AS(
SELECT Customer_ID,
COUNT(DISTINCT(Order_ID)) AS total_orders
FROM transactions
GROUP BY Customer_ID)
SELECT
	CASE
		WHEN total_orders>1 THEN "RETURNING"
        ELSE "ONE-TIME"
	END AS customer_type,
    COUNT(*) AS customer_count
FROM customer_orders
GROUP BY
	CASE
		WHEN total_orders>1 THEN "RETURNING"
        ELSE "ONE-TIME"
	END
ORDER BY customer_count DESC;