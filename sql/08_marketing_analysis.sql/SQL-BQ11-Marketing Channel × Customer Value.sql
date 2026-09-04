##Marketing Channel × Customer Value
USE customer_retention_analysis;

WITH customer_metrics AS (
    SELECT
        Customer_ID,
        Marketing_Channel,
        SUM(Revenue) AS total_revenue
    FROM transactions
    GROUP BY Customer_ID, Marketing_Channel
),

customer_quartiles AS (
    SELECT
        Customer_ID,
        Marketing_Channel,
        total_revenue,

        NTILE(4) OVER (
            ORDER BY total_revenue
        ) AS revenue_quartile

    FROM customer_metrics
)

SELECT
    Marketing_Channel AS marketing_channel,

    COUNT(DISTINCT Customer_ID) AS total_customers,

    SUM(
        CASE
            WHEN revenue_quartile = 4 THEN 1
            ELSE 0
        END
    ) AS high_value_customers,

    ROUND(
        SUM(
            CASE
                WHEN revenue_quartile = 4 THEN 1
                ELSE 0
            END
        )
        / COUNT(DISTINCT Customer_ID) * 100,
        2
    ) AS high_value_customer_percentage

FROM customer_quartiles

GROUP BY Marketing_Channel

ORDER BY high_value_customer_percentage DESC;