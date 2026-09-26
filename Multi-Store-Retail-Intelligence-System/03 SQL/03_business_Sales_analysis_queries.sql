# Sales Analysis


#1.Total Revenue Generated
SELECT
    ROUND(SUM(item_total), 2) AS total_revenue
FROM order_items;


#2.How Many Orders Were Placed?
SELECT
    COUNT(*) AS total_orders
FROM orders;


#3.Average Order Value (AOV)
SELECT
    ROUND(AVG(total_amount), 2) AS avg_order_value
FROM orders;


#4.Products Generating Highest Revenue
SELECT
    p.product_name,
    ROUND(SUM(oi.item_total), 2) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 10;


#5.Categories Generating Highest Revenue
SELECT
    p.category,
    ROUND(SUM(oi.item_total), 2) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;


#6.Brands Generating Highest Revenue
SELECT
    p.brand,
    ROUND(SUM(oi.item_total), 2) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.brand
ORDER BY revenue DESC;


#7.Monthly Revenue Trend
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    ROUND(SUM(oi.item_total), 2) AS revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;


#8.Monthly Order Trend
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;
