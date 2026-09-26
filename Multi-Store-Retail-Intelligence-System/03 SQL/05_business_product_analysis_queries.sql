# Product Analysis


#1. Which products are sold most frequently?
SELECT
    p.product_name,
    COUNT(oi.order_id) AS order_frequency
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY order_frequency DESC
LIMIT 10;


#2. Which products generate the highest sales quantity?
SELECT
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 10;


#3. Which products have the highest average ratings?
SELECT
    p.product_name,
    ROUND(AVG(r.rating), 2) AS avg_rating
FROM reviews r
JOIN products p
    ON r.product_id = p.product_id
GROUP BY p.product_name
HAVING COUNT(r.review_id) >= 5
ORDER BY avg_rating DESC
LIMIT 10;


#4. Which products receive the most reviews?
SELECT
    p.product_name,
    COUNT(r.review_id) AS total_reviews
FROM reviews r
JOIN products p
    ON r.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_reviews DESC
LIMIT 10;


#5. Which categories have the highest average ratings?
SELECT
    p.category,
    ROUND(AVG(r.rating), 2) AS avg_rating
FROM reviews r
JOIN products p
    ON r.product_id = p.product_id
GROUP BY p.category
ORDER BY avg_rating DESC;


#6. Which brands have the highest average ratings?
SELECT
    p.brand,
    ROUND(AVG(r.rating), 2) AS avg_rating
FROM reviews r
JOIN products p
    ON r.product_id = p.product_id
GROUP BY p.brand
ORDER BY avg_rating DESC;


