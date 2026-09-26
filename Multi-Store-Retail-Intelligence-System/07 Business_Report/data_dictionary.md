# Data Dictionary

## Users

| Column | Description |
|----------|----------|
| user_id | Unique user identifier |
| name | Customer name |
| email | Customer email |
| gender | Customer gender |
| city | Customer city |
| signup_date | Date when user registered |

---

## Products

| Column | Description |
|----------|----------|
| product_id | Unique product identifier |
| product_name | Product name |
| category | Product category |
| brand | Product brand |
| price | Product selling price |
| rating | Product rating |

---

## Orders

| Column | Description |
|----------|----------|
| order_id | Unique order identifier |
| user_id | Customer who placed order |
| order_date | Order date |
| order_status | Current order status |
| total_amount | Total order value |

---

## Order Items

| Column | Description |
|----------|----------|
| order_item_id | Unique order item identifier |
| order_id | Related order |
| product_id | Purchased product |
| quantity | Number of units purchased |
| item_price | Price per unit |
| item_total | Total value of item |
| user_id | Customer who purchased |

---

## Reviews

| Column | Description |
|----------|----------|
| review_id | Unique review identifier |
| order_id | Related order |
| product_id | Reviewed product |
| user_id | Customer who reviewed |
| rating | Product rating given by customer |
| review_text | Customer review |
| review_date | Date of review |

---

## Events

| Column | Description |
|----------|----------|
| event_id | Unique event identifier |
| user_id | Customer identifier |
| product_id | Product identifier |
| event_type | Action performed (view/cart/wishlist) |
| event_timestamp | Date and time of action |