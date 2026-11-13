-- E-Commerce Complete Sales Report
-- Joining all 5 Star Schema tables

SELECT
    c.cus_id,
    c.cus_name,
    c.city AS customer_city,

    p.product_id,
    p.product_name,
    p.category,

    r.city AS sales_city,
    r.state,
    r.country,

    t.full_date,
    t.month_name,
    t.quarter,
    t.year,

    f.quantity,
    f.total_amount

FROM fact_sales f

JOIN dim_customer c
    ON f.cus_key = c.cus_key

JOIN dim_product p
    ON f.product_key = p.product_key

JOIN dim_region r
    ON f.region_key = r.region_key

JOIN dim_time t
    ON f.time_key = t.time_key

ORDER BY t.full_date;
