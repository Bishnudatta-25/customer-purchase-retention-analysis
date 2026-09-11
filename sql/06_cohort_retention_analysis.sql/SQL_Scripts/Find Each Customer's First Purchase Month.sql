###Cohort Retention Analysis
##Find Each Customer's First Purchase Month
SELECT
    Customer_ID,
    MIN(Order_Date) AS first_order_date,
    DATE_FORMAT(
        MIN(Order_Date),
        '%Y-%m'
    ) AS cohort_month
FROM transactions
GROUP BY Customer_ID
ORDER BY first_order_date;
    