-- ============================================
-- Query  : Sales Report
-- Project: pt_sejahtera_bersama
-- DB     : Google BigQuery (GoogleSQL)
-- ============================================

SELECT 
    o.Date                              AS order_date, 
    pc.CategoryName                     AS category_name, 
    p.ProdName                          AS product_name, 
    p.Price                             AS product_price, 
    o.Quantity                          AS order_qty, 
    (p.Price * o.Quantity)              AS total_sales, 
    SPLIT(CustomerEmail, '#')[OFFSET(0)] AS cust_email, 
    c.CustomerCity                      AS cust_city

FROM `revou-sql-class-465823.pt_sejahtera_bersama.orders` o
    LEFT JOIN `revou-sql-class-465823.pt_sejahtera_bersama.products` p
        ON o.ProdNumber = p.ProdNumber
    LEFT JOIN `revou-sql-class-465823.pt_sejahtera_bersama.product_category` pc
        ON p.Category = pc.CategoryID
    LEFT JOIN `revou-sql-class-465823.pt_sejahtera_bersama.customers` c
        ON o.CustomerID = c.CustomerID

ORDER BY order_date ASC;
