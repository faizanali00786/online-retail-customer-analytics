-- ============================================
-- SECTION 2: DATA CLEANING BASE
-- ============================================

WITH base AS (
    SELECT 
        customer_id,
        InvoiceNo,
        invoice_date,
        quantity,
        unit_price,
        quantity * unit_price AS revenue
    FROM online_retail
    WHERE customer_id IS NOT NULL
      AND quantity > 0
)

SELECT * 
FROM base;