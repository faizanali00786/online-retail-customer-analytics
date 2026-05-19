-- ============================================
-- SECTION 3: BASIC METRICS
-- ============================================

WITH base AS (
    SELECT 
        customer_id,
        InvoiceNo,
        quantity * unit_price AS revenue
    FROM online_retail
    WHERE customer_id IS NOT NULL
      AND quantity > 0
)

SELECT 
    COUNT(DISTINCT customer_id) AS customers,
    COUNT(DISTINCT InvoiceNo) AS orders,
    SUM(revenue) AS total_revenue,
    SUM(revenue) / COUNT(DISTINCT InvoiceNo) AS average_order_value,
    COUNT(DISTINCT InvoiceNo) * 1.0 / COUNT(DISTINCT customer_id) AS purchase_frequency
FROM base;