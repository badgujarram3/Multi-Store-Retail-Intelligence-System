# Order Analysis


#1. What is the distribution of orders by status?
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;


#2. What percentage of orders are cancelled?
SELECT
    ROUND(
        SUM(CASE
                WHEN order_status = 'cancelled' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
        2
    ) AS cancelled_percentage
FROM orders;


#3. Which month records the highest number of orders?
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY total_orders DESC
LIMIT 1;


#4. Which month generates the highest revenue?
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    ROUND(SUM(total_amount), 2) AS revenue
FROM orders
GROUP BY month
ORDER BY revenue DESC
LIMIT 1;


#5. Monthly Order Trend
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;


#6. Monthly Revenue Trend
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    ROUND(SUM(total_amount), 2) AS revenue
FROM orders
GROUP BY month
ORDER BY month;