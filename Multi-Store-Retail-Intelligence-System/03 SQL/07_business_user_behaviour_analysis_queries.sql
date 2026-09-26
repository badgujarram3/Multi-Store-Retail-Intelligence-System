# User Behavior Analysis


#1. Which products receive the highest number of views?
SELECT
    p.product_name,
    COUNT(*) AS total_views
FROM events e
JOIN products p
    ON e.product_id = p.product_id
WHERE e.event_type = 'view'
GROUP BY p.product_name
ORDER BY total_views DESC
LIMIT 10;


#2. Which products are added to cart most frequently?
SELECT
    p.product_name,
    COUNT(*) AS total_cart_additions
FROM events e
JOIN products p
    ON e.product_id = p.product_id
WHERE e.event_type = 'cart'
GROUP BY p.product_name
ORDER BY total_cart_additions DESC
LIMIT 10;


#3. Which products are added to wishlist most frequently?
SELECT
    p.product_name,
    COUNT(*) AS total_wishlist_additions
FROM events e
JOIN products p
    ON e.product_id = p.product_id
WHERE e.event_type = 'wishlist'
GROUP BY p.product_name
ORDER BY total_wishlist_additions DESC
LIMIT 10;


#4. What is the distribution of user actions by event type?
SELECT
    event_type,
    COUNT(*) AS total_actions
FROM events
GROUP BY event_type
ORDER BY total_actions DESC;


#5. Which products have high views but low purchases?
SELECT
    p.product_name,
    COUNT(CASE WHEN e.event_type = 'view' THEN 1 END) AS total_views,
    COALESCE(SUM(oi.quantity),0) AS total_purchases
FROM products p
LEFT JOIN events e
    ON p.product_id = e.product_id
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_name
HAVING total_views > 50
ORDER BY total_views DESC, total_purchases ASC
LIMIT 10;


#6. Which products have high cart activity but low purchases?
SELECT
    p.product_name,
    COUNT(CASE WHEN e.event_type = 'cart' THEN 1 END) AS total_cart_events,
    COALESCE(SUM(oi.quantity),0) AS total_purchases
FROM products p
LEFT JOIN events e
    ON p.product_id = e.product_id
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_name
HAVING total_cart_events > 20
ORDER BY total_cart_events DESC, total_purchases ASC
LIMIT 10;

