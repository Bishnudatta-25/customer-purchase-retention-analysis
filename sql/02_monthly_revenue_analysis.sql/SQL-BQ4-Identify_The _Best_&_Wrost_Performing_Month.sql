#Phase 3.5 — Identify the Best & Worst Performing Months

/* Business questions-Management wants to know:
		Which month generated the highest revenue?
		Which month generated the lowest revenue?
		Which month had the highest positive MoM growth?
		Which month had the largest MoM decline? */
        
USE  customer_retention_analysis;   

##WHICH MONTH GENERATE HIGHEST REVENUE?

SELECT DATE_FORMAT(Order_Date,'%Y-%m') AS month,
SUM(Revenue) AS total_revenue
FROM transactions
GROUP BY DATE_FORMAT(Order_Date,'%Y-%m')
ORDER BY total_revenue DESC
LIMIT 1;

##WHICH MONTH GENERATE LOWEST REVENUE?

SELECT DATE_FORMAT(Order_Date,'%Y-%m') AS month,
SUM(Revenue) AS total_revenue
FROM transactions
GROUP BY DATE_FORMAT(Order_Date,'%Y-%m')
ORDER BY total_revenue ASC
LIMIT 1;

##WHICH MONTH HAD THE HIGHEST MoM GROWTH?

WITH monthly_sales AS (
	SELECT DATE_FORMAT(Order_Date,'%Y-%m') AS month,
	SUM(Revenue) AS total_revenue
	FROM transactions
	GROUP  BY DATE_FORMAT(Order_Date,'%Y-%m')
    ),
monthly_comparison AS (
	SELECT month,
    total_revenue,
    LAG(total_revenue)
    OVER(ORDER BY month) AS previous_month_revenue 
    FROM monthly_sales
    GROUP BY month
    ),
growth_analysis AS (
	SELECT month,
    total_revenue,
    previous_month_revenue,
    ROUND(((total_revenue-previous_month_revenue)/previous_month_revenue)*100,2) AS mom_growth_pct
    FROM monthly_comparison
)
SELECT *
FROM growth_analysis
WHERE previous_month_revenue IS NOT NULL
GROUP BY month
ORDER BY mom_growth_pct DESC
LIMIT 1;

##WHICH MONTH GENERATE LOWEST REVENUE?

SELECT DATE_FORMAT(Order_Date,'%Y-%m') AS month,
SUM(Revenue) AS total_revenue
FROM transactions
GROUP BY DATE_FORMAT(Order_Date,'%Y-%m')
ORDER BY total_revenue ASC
LIMIT 1;

##WHICH MONTH HAD THE HIGHEST MoM DECLINE?

WITH monthly_sales AS (
	SELECT DATE_FORMAT(Order_Date,'%Y-%m') AS month,
	SUM(Revenue) AS total_revenue
	FROM transactions
	GROUP  BY DATE_FORMAT(Order_Date,'%Y-%m')
    ),
monthly_comparison AS (
	SELECT month,
    total_revenue,
    LAG(total_revenue)
    OVER(ORDER BY month) AS previous_month_revenue 
    FROM monthly_sales
    GROUP BY month
    ),
growth_analysis AS (
	SELECT month,
    total_revenue,
    previous_month_revenue,
    ROUND(((total_revenue-previous_month_revenue)/previous_month_revenue)*100,2) AS mom_growth_pct
    FROM monthly_comparison
)
SELECT *
FROM growth_analysis
WHERE previous_month_revenue IS NOT NULL
GROUP BY month
ORDER BY mom_growth_pct ASC
LIMIT 1;

