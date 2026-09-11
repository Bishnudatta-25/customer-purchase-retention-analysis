##Customer Cohort Retention
WITH customer_months AS (
    SELECT DISTINCT
        Customer_ID,
        DATE_FORMAT(Order_Date, '%Y-%m') AS order_month
    FROM transactions
)
SELECT
    Customer_ID,
    order_month
FROM customer_months
ORDER BY
    Customer_ID,
    order_month;
