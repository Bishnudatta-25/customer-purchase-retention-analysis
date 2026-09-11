###CUSTOMER RETAINTION ANALYSIS
##Repeat_Customer_Rate
WITH a AS (
SELECT Customer_ID,
COUNT(DISTINCT(Order_ID)) AS total_orders
FROM transactions
GROUP BY Customer_ID),
b AS (
SELECT 
	Customer_ID,
	CASE
		WHEN total_orders>1 THEN"RETURNING"
        ELSE "ONE-TIME"
	END AS customer_type
FROM a)
SELECT 
customer_type,
COUNT(*) AS customer_count,
ROUND(COUNT(*)/(SELECT COUNT(*) FROM b)*100,2) AS customer_percentage
FROM b
GROUP BY customer_type
ORDER BY customer_count;
