-- ============================================
-- SECTION 5.2: HIGH VALUE CUSTOMERS
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

ranked AS (
    SELECT *,
           NTILE(10) OVER (ORDER BY total_spend DESC) AS decile
    FROM customer_spend
)

SELECT
    CASE 
        WHEN decile = 1 THEN 'High Value (Top 10%)'
        ELSE 'Others'
    END AS segment,
    
    COUNT(customer_id) AS customer_count,
    
    SUM(total_spend) AS total_revenue,
    
    ROUND(
        SUM(total_spend) * 100.0 
        / SUM(SUM(total_spend)) OVER (),
        2
    ) AS revenue_percentage

FROM ranked
GROUP BY segment;