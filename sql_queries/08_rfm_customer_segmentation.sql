-- ============================================
-- SECTION 6: RFM ANALYSIS
-- ============================================

WITH base AS (
    SELECT 
        customer_id,
        invoice_date,
        quantity * unit_price AS revenue,
        InvoiceNo
    FROM online_retail
    WHERE customer_id IS NOT NULL
      AND quantity > 0
),

customer_metrics AS (
    SELECT 
        customer_id,
        COUNT(DISTINCT InvoiceNo) AS frequency,
        SUM(revenue) AS monetary,
        MAX(invoice_date) AS last_purchase_date
    FROM base
    GROUP BY customer_id
),

max_date AS (
    SELECT MAX(last_purchase_date) AS max_date
    FROM customer_metrics
),

rfm AS (
    SELECT 
        c.customer_id,
        DATEDIFF(m.max_date, c.last_purchase_date) AS recency,
        c.frequency,
        c.monetary
    FROM customer_metrics c
    CROSS JOIN max_date m
),

rfm_scores AS (
    SELECT *,

        NTILE(5) OVER (ORDER BY recency DESC) AS r_score,
        NTILE(5) OVER (ORDER BY frequency) AS f_score,
        NTILE(5) OVER (ORDER BY monetary) AS m_score

    FROM rfm
)

SELECT *,

    CASE 
        WHEN r_score >= 4 
         AND f_score >= 4 
         AND m_score >= 4
        THEN 'High Value'

        WHEN r_score >= 3 
         AND f_score >= 3
        THEN 'Mid Value'

        ELSE 'Low Value'
    END AS segment

FROM rfm_scores;