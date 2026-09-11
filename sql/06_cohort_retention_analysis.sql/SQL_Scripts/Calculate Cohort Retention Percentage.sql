##Calculate Cohort Retention %
WITH customer_first_purchase AS (
    SELECT
        Customer_ID,
        MIN(Order_Date) AS first_order_date,
        DATE_FORMAT(MIN(Order_Date), '%Y-%m') AS cohort_month
    FROM transactions
    GROUP BY Customer_ID
),

customer_activity AS (
    SELECT DISTINCT
        Customer_ID,
        DATE_FORMAT(Order_Date, '%Y-%m') AS order_month
    FROM transactions
),

customer_cohort_activity AS (
    SELECT
        c.Customer_ID,
        c.cohort_month,
        TIMESTAMPDIFF(
            MONTH,
            c.first_order_date,
            STR_TO_DATE(
                CONCAT(a.order_month, '-01'),
                '%Y-%m-%d'
            )
        ) AS months_since_first_purchase
    FROM customer_first_purchase c
    JOIN customer_activity a
        ON c.Customer_ID = a.Customer_ID
),

cohort_counts AS (
    SELECT
        cohort_month,
        months_since_first_purchase,
        COUNT(DISTINCT Customer_ID) AS active_customers
    FROM customer_cohort_activity
    GROUP BY
        cohort_month,
        months_since_first_purchase
)

SELECT
    cohort_month,
    months_since_first_purchase,
    active_customers,

    FIRST_VALUE(active_customers) OVER (
        PARTITION BY cohort_month
        ORDER BY months_since_first_purchase
    ) AS cohort_size,

    ROUND(
        active_customers /
        FIRST_VALUE(active_customers) OVER (
            PARTITION BY cohort_month
            ORDER BY months_since_first_purchase
        ) * 100,
        2
    ) AS retention_percentage

FROM cohort_counts

ORDER BY
    cohort_month,
    months_since_first_purchase;
