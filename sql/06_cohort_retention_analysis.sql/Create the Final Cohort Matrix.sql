##Create the Final Cohort Matrix
WITH customer_first_purchase AS (
    SELECT
        Customer_ID,

        DATE_FORMAT(
            MIN(Order_Date),
            '%Y-%m-01'
        ) AS cohort_month

    FROM transactions

    GROUP BY Customer_ID
),

customer_activity AS (
    SELECT DISTINCT
        Customer_ID,

        DATE_FORMAT(
            Order_Date,
            '%Y-%m-01'
        ) AS order_month

    FROM transactions
),

customer_cohort_activity AS (
    SELECT
        c.Customer_ID,
        c.cohort_month,

        TIMESTAMPDIFF(
            MONTH,
            STR_TO_DATE(c.cohort_month, '%Y-%m-%d'),
            STR_TO_DATE(a.order_month, '%Y-%m-%d')
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
),

cohort_retention AS (
    SELECT
        cohort_month,
        months_since_first_purchase,
        active_customers,

        FIRST_VALUE(active_customers) OVER (
            PARTITION BY cohort_month
            ORDER BY months_since_first_purchase
        ) AS cohort_size

    FROM cohort_counts
)

SELECT
    cohort_month,

    ROUND(
        MAX(CASE
            WHEN months_since_first_purchase = 0
            THEN active_customers / cohort_size * 100
        END), 2
    ) AS M0,

    ROUND(
        MAX(CASE
            WHEN months_since_first_purchase = 1
            THEN active_customers / cohort_size * 100
        END), 2
    ) AS M1,

    ROUND(
        MAX(CASE
            WHEN months_since_first_purchase = 2
            THEN active_customers / cohort_size * 100
        END), 2
    ) AS M2,

    ROUND(
        MAX(CASE
            WHEN months_since_first_purchase = 3
            THEN active_customers / cohort_size * 100
        END), 2
    ) AS M3,

    ROUND(
        MAX(CASE
            WHEN months_since_first_purchase = 4
            THEN active_customers / cohort_size * 100
        END), 2
    ) AS M4,

    ROUND(
        MAX(CASE
            WHEN months_since_first_purchase = 5
            THEN active_customers / cohort_size * 100
        END), 2
    ) AS M5,

    ROUND(
        MAX(CASE
            WHEN months_since_first_purchase = 6
            THEN active_customers / cohort_size * 100
        END), 2
    ) AS M6,

    ROUND(
        MAX(CASE
            WHEN months_since_first_purchase = 7
            THEN active_customers / cohort_size * 100
        END), 2
    ) AS M7,

    ROUND(
        MAX(CASE
            WHEN months_since_first_purchase = 8
            THEN active_customers / cohort_size * 100
        END), 2
    ) AS M8,

    ROUND(
        MAX(CASE
            WHEN months_since_first_purchase = 9
            THEN active_customers / cohort_size * 100
        END), 2
    ) AS M9,

    ROUND(
        MAX(CASE
            WHEN months_since_first_purchase = 10
            THEN active_customers / cohort_size * 100
        END), 2
    ) AS M10,

    ROUND(
        MAX(CASE
            WHEN months_since_first_purchase = 11
            THEN active_customers / cohort_size * 100
        END), 2
    ) AS M11

FROM cohort_retention

GROUP BY cohort_month

ORDER BY cohort_month;