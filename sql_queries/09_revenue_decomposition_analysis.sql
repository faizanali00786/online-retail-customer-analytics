-- ============================================
-- SECTION 7: REVENUE DECOMPOSITION
-- ============================================

WITH base AS (
    SELECT
        customer_id,
        DATE_FORMAT(invoice_date, '%Y-%m') AS month,
        InvoiceNo,
        quantity * unit_price AS revenue
    FROM online_retail
    WHERE customer_id IS NOT NULL
      AND quantity > 0
),

monthly AS (
    SELECT
        month,

        COUNT(DISTINCT customer_id) AS customers,

        COUNT(DISTINCT InvoiceNo) AS orders,

        SUM(revenue) AS revenue,

        SUM(revenue) / COUNT(DISTINCT InvoiceNo) AS average_order_value,

        COUNT(DISTINCT InvoiceNo) * 1.0 
        / COUNT(DISTINCT customer_id) AS purchase_frequency

    FROM base
    GROUP BY month
),

lagged AS (
    SELECT *,

        LAG(customers) OVER (ORDER BY month) AS prev_customers,

        LAG(average_order_value) OVER (ORDER BY month) AS prev_AOV,

        LAG(purchase_frequency) OVER (ORDER BY month) AS prev_frequency

    FROM monthly
)

SELECT *,

    ROUND(
        (customers - prev_customers) * 100.0 
        / prev_customers,
        2
    ) AS pct_customers,

    ROUND(
        (average_order_value - prev_AOV) * 100.0 
        / prev_AOV,
        2
    ) AS pct_AOV,

    ROUND(
        (purchase_frequency - prev_frequency) * 100.0 
        / prev_frequency,
        2
    ) AS pct_frequency

FROM lagged;