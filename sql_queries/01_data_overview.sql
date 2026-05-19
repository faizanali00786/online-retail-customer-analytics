-- ============================================
-- SECTION 1: DATA OVERVIEW
-- ============================================

SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT InvoiceNo) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    MIN(invoice_date) AS start_date,
    MAX(invoice_date) AS end_date
FROM online_retail;