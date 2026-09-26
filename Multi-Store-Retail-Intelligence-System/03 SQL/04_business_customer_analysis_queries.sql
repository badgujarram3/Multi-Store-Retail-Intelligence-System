# Customer Analysis


#1. Who are the top customers by spending?
SELECT
    u.user_id,
    u.name,
    ROUND(SUM(o.total_amount), 2) AS total_spent
FROM users u
JOIN orders o
    ON u.user_id = o.user_id
GROUP BY u.user_id, u.name
ORDER BY total_spent DESC
LIMIT 10;


#2. Which customers place the highest number of orders?
SELECT
    u.user_id,
    u.name,
    COUNT(o.order_id) AS total_orders
FROM users u
JOIN orders o
    ON u.user_id = o.user_id
GROUP BY u.user_id, u.name
ORDER BY total_orders DESC
LIMIT 10;


#3. What is the average spending per customer?
SELECT
    ROUND(AVG(customer_spending), 2) AS avg_spending_per_customer
FROM
(
    SELECT
        user_id,
        SUM(total_amount) AS customer_spending
    FROM orders
    GROUP BY user_id
) t;


#4. Which cities generate the highest revenue?
SELECT
    u.city,
    ROUND(SUM(o.total_amount), 2) AS revenue
FROM users u
JOIN orders o
    ON u.user_id = o.user_id
GROUP BY u.city
ORDER BY revenue DESC;


#5. Which cities have the highest number of customers?
SELECT
    city,
    COUNT(*) AS total_customers
FROM users
GROUP BY city
ORDER BY total_customers DESC;


#6. How many new users register each month?
SELECT
    DATE_FORMAT(signup_date, '%Y-%m') AS month,
    COUNT(*) AS new_users
FROM users
GROUP BY month
ORDER BY month;


#7. What is the customer growth trend over time?
SELECT
    month,
    new_users,
    SUM(new_users) OVER (ORDER BY month) AS cumulative_users
FROM
(
    SELECT
        DATE_FORMAT(signup_date, '%Y-%m') AS month,
        COUNT(*) AS new_users
    FROM users
    GROUP BY month
) t;