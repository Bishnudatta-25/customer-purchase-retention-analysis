#Phase 3.2 — Sales Trend Analysis
/* Management's next question is:
	"How has revenue changed over time?" */
/* This is important because a business can have ₹117.7M in total revenue but still be declining.
	We want to discover:
		Monthly revenue
		Monthly orders
		Monthly quantity sold
		Average Order Value
		Growth/decline patterns */
        
        
SELECT DATE_FORMAT(Order_Date,'%Y-%m') AS month,
SUM(Revenue) AS total_revenue,
COUNT(DISTINCT(Order_ID)) AS total_orders,
SUM(Quantity) AS total_quantity,
ROUND(SUM(Revenue)/COUNT(DISTINCT(Order_ID)),2) AS average_order_value
FROM transactions
GROUP BY DATE_FORMAT(Order_Date,'%Y-%m')
ORDER BY month ASC;