-- ============================================
-- SECTION 8: PARETO ANALYSIS
-- ============================================

WITH customer_spend AS (
    SELECT
        customer_id,
        SUM(quantity * unit_price) AS total_spend
    FROM online_retail
    WHERE customer_id IS NOT NULL
      AND quantity > 0
    GROUP BY customer_id
),

ordered AS (
    SELECT
        customer_id,
        total_spend,

        SUM(total_spend) OVER (
            ORDER BY total_spend DESC
        ) AS running_total,

        SUM(total_spend) OVER () AS total

    FROM customer_spend
)

SELECT
    customer_id,
    total_spend,

    ROUND(
        running_total * 100.0 / total,
        2
    ) AS cumulative_revenue_pct

FROM ordered
ORDER BY total_spend DESC;