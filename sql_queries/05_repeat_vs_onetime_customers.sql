-- ============================================
-- SECTION 5.1: REPEAT VS ONE-TIME CUSTOMERS
-- ============================================

WITH order_count AS (
    SELECT
        customer_id,
        COUNT(DISTINCT InvoiceNo) AS total_orders,
        SUM(quantity * unit_price) AS revenue
    FROM online_retail
    WHERE customer_id IS NOT NULL
      AND quantity > 0
    GROUP BY customer_id
),

customer_segment AS (
    SELECT
        customer_id,
        revenue,
        CASE 
            WHEN total_orders > 1 THEN 'Repeat'
            ELSE 'One-time'
        END AS customer_type
    FROM order_count
)

SELECT
    customer_type,
    COUNT(customer_id) AS customer_count,
    SUM(revenue) AS total_revenue,
    ROUND(
        SUM(revenue) * 100.0 / SUM(SUM(revenue)) OVER (),
        2
    ) AS revenue_percentage
FROM customer_segment
GROUP BY customer_type;