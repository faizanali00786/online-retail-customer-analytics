-- ============================================
-- SECTION 4: COHORT ANALYSIS (RETENTION)
-- ============================================

WITH base AS (
    SELECT 
        customer_id,
        invoice_date
    FROM online_retail
    WHERE customer_id IS NOT NULL
      AND quantity > 0
),

first_purchase AS (
    SELECT 
        customer_id,
        MIN(invoice_date) AS first_purchase_date
    FROM base
    GROUP BY customer_id
),

cohort_data AS (
    SELECT 
        b.customer_id,
        DATE_FORMAT(f.first_purchase_date, '%Y-%m') AS cohort_month,
        TIMESTAMPDIFF(MONTH, f.first_purchase_date, b.invoice_date) + 1 AS cohort_index
    FROM base b
    JOIN first_purchase f
        ON b.customer_id = f.customer_id
),

customer_count AS (
    SELECT 
        cohort_month,
        cohort_index,
        COUNT(DISTINCT customer_id) AS customers
    FROM cohort_data
    GROUP BY cohort_month, cohort_index
),

cohort_size AS (
    SELECT 
        cohort_month,
        COUNT(DISTINCT customer_id) AS cohort_size
    FROM cohort_data
    WHERE cohort_index = 1
    GROUP BY cohort_month
)

SELECT 
    c.cohort_month,
    c.cohort_index,
    ROUND(c.customers * 100.0 / s.cohort_size, 2) AS retention_rate
FROM customer_count c
JOIN cohort_size s
ON c.cohort_month = s.cohort_month
ORDER BY c.cohort_month, c.cohort_index;