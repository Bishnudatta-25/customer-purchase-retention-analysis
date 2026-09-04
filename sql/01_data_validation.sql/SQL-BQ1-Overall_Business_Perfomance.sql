# Business Question #1: Overall Business Performance

/* They ask:
"Give me a quick snapshot of how the business performed during the period." */

/* We need these 5 KPIs:
Total Revenue
Total Orders
Total Customers
Total Quantity Sold
Average Order Value (AOV) */

SELECT
	SUM(Revenue) AS total_revenue,
	COUNT(DISTINCT(Order_ID)) AS total_orders,
    COUNT(DISTINCT(Customer_ID)) AS total_customer,
    SUM(Quantity) AS total_quantity_sold,
	ROUND(SUM(Revenue)/COUNT(DISTINCT(Order_ID)),2) AS average_order_value
FROM transactions;