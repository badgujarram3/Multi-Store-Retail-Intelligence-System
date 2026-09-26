#Use database
USE ecommerce_analytics;

# Show tables
SHOW TABLES;

# Row counts
SELECT COUNT(*) FROM users;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;
SELECT COUNT(*) FROM reviews;
SELECT COUNT(*) FROM events;

# View sample records
SELECT * FROM users LIMIT 5;
SELECT * FROM products LIMIT 5;
SELECT * FROM orders LIMIT 5;

# Check date range
SELECT MIN(order_date), MAX(order_date)
FROM orders;

# Check order statuses
SELECT order_status, COUNT(*)
FROM orders
GROUP BY order_status;

#Check event types
SELECT event_type, COUNT(*)
FROM events
GROUP BY event_type;