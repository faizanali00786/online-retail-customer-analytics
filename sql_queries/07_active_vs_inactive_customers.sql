-- ============================================
-- SECTION 5.3: ACTIVE VS INACTIVE CUSTOMERS
-- ============================================

WITH last_purchase AS (
    SELECT
        customer_id,
        MAX(invoice_date) AS last_purchase_date,
        SUM(quantity * unit_price) AS total_revenue
    FROM online_retail
    WHERE customer_id IS NOT NULL
      AND quantity > 0
    GROUP BY customer_id
),

max_date AS (
    SELECT MAX(last_purchase_date) AS max_date
    FROM last_purchase
),

customer_status AS (
    SELECT
        l.customer_id,
        l.total_revenue,
        DATEDIFF(m.max_date, l.last_purchase_date) AS days_since_last_purchase,

        CASE 
            WHEN DATEDIFF(m.max_date, l.last_purchase_date) <= 90 
            THEN 'Active'
            ELSE 'Inactive'
        END AS customer_status

    FROM last_purchase l
    CROSS JOIN max_date m
)

SELECT
    customer_status,
    COUNT(customer_id) AS customer_count,
    SUM(total_revenue) AS total_revenue,

    ROUND(
        SUM(total_revenue) * 100.0 
        / SUM(SUM(total_revenue)) OVER (),
        2
    ) AS revenue_percentage

FROM customer_status
GROUP BY customer_status;