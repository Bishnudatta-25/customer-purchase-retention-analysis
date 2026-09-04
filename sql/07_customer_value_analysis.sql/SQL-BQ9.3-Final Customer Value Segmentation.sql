##Final Customer Value Segmentation
WITH customer_revenue AS (
    SELECT
        Customer_ID,
        SUM(Revenue) AS total_revenue
    FROM transactions
    GROUP BY Customer_ID
),

customer_quartiles AS (
    SELECT
        Customer_ID,
        total_revenue,

        NTILE(4) OVER (
            ORDER BY total_revenue
        ) AS revenue_quartile

    FROM customer_revenue
),

customer_segments AS (
    SELECT
        Customer_ID,
        total_revenue,

        CASE
            WHEN revenue_quartile = 1 THEN 'LOW VALUE'
            WHEN revenue_quartile = 2 THEN 'MEDIUM-LOW VALUE'
            WHEN revenue_quartile = 3 THEN 'MEDIUM-HIGH VALUE'
            WHEN revenue_quartile = 4 THEN 'HIGH VALUE'
        END AS customer_segment

    FROM customer_quartiles
)

SELECT
    customer_segment,

    COUNT(*) AS customer_count,

    ROUND(
        COUNT(*) / (SELECT COUNT(*) FROM customer_segments) * 100,
        2
    ) AS customer_percentage,

    ROUND(
        SUM(total_revenue),
        2
    ) AS total_revenue,

    ROUND(
        SUM(total_revenue) /
        (SELECT SUM(total_revenue) FROM customer_segments) * 100,
        2
    ) AS revenue_percentage,

    ROUND(
        AVG(total_revenue),
        2
    ) AS avg_revenue_per_customer

FROM customer_segments

GROUP BY customer_segment

ORDER BY
    CASE customer_segment
        WHEN 'HIGH VALUE' THEN 1
        WHEN 'MEDIUM-HIGH VALUE' THEN 2
        WHEN 'MEDIUM-LOW VALUE' THEN 3
        WHEN 'LOW VALUE' THEN 4
    END;