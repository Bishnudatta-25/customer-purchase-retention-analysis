#Phase 3.3 — Month-over-Month Revenue Growth

/* Business question
	"How much did revenue increase or decrease compared with the previous month?" */
USE customer_retention_analysis; 
SELECT DATE_FORMAT(Order_Date,'%Y-%m') AS month,
SUM(Revenue) AS total_revenue,
LAG(SUM(Revenue)) 
OVER (ORDER BY DATE_FORMAT(Order_Date,'%Y-%m')) AS previous_month_revenue,
ROUND(
(SUM(Revenue)-LAG(SUM(Revenue))OVER(ORDER BY DATE_FORMAT(Order_Date,'%Y-%m')))/
LAG(SUM(Revenue))OVER(ORDER BY DATE_FORMAT(Order_Date,'%Y-%m'))*100,2) as mom_growth_in_percentage

FROM transactions
GROUP BY DATE_FORMAT(Order_Date,'%Y-%m')
ORDER BY month;

#OR

WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(Order_Date, '%Y-%m') AS month,
        SUM(Revenue) AS total_revenue
    FROM transactions
    GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
),

monthly_comparison AS (
    SELECT
        month,
        total_revenue,
        LAG(total_revenue) OVER (
            ORDER BY month
        ) AS previous_month_revenue
    FROM monthly_sales
)

SELECT
    month,
    total_revenue,
    previous_month_revenue,
    ROUND(
        (total_revenue - previous_month_revenue)
        / previous_month_revenue * 100,
        2
    ) AS mom_revenue_growth_pct
FROM monthly_comparison
ORDER BY month;