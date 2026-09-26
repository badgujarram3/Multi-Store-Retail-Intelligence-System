# Advanced Business Analysis



#1. Identify customers who registered but never placed an order.
SELECT
    u.user_id,
    u.name,
    u.email,
    u.signup_date
FROM users u
LEFT JOIN orders o
    ON u.user_id = o.user_id
WHERE o.order_id IS NULL;



#2. Identify products that were never purchased.
SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.brand
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;



#3. Find repeat customers who placed multiple orders.
SELECT
    u.user_id,
    u.name,
    COUNT(o.order_id) AS total_orders
FROM users u
JOIN orders o
    ON u.user_id = o.user_id
GROUP BY u.user_id, u.name
HAVING COUNT(o.order_id) > 1
ORDER BY total_orders DESC;



#4. Calculate each product's contribution to total revenue.
SELECT
    p.product_name,
    ROUND(SUM(oi.item_total),2) AS product_revenue,

    ROUND(
        SUM(oi.item_total) * 100 /
        (SELECT SUM(item_total) FROM order_items),
        2
    ) AS revenue_percentage

FROM order_items oi

JOIN products p
    ON oi.product_id = p.product_id

GROUP BY p.product_name

ORDER BY revenue_percentage DESC;



#5. Compare product engagement versus actual purchases.
SELECT
    p.product_name,

    COUNT(CASE 
        WHEN e.event_type = 'view'
        THEN 1
    END) AS total_views,

    COUNT(CASE 
        WHEN e.event_type = 'cart'
        THEN 1
    END) AS total_cart,

    COALESCE(SUM(oi.quantity),0) AS total_purchases

FROM products p

LEFT JOIN events e
    ON p.product_id = e.product_id

LEFT JOIN order_items oi
    ON p.product_id = oi.product_id

GROUP BY p.product_name

ORDER BY total_views DESC;


