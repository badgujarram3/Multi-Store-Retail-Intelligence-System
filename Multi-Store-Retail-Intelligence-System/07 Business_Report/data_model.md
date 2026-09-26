# 🛒 E-Commerce Data Model

## 📌 Project Overview

This document describes the database structure used in the E-Commerce Analytics Project.

The database stores information related to:

- Users
- Products
- Orders
- Order Items
- Reviews
- Events

---

# 🗄️ Database Tables

| Table Name | Description |
|------------|-------------|
| Users | Customer information |
| Products | Product catalog |
| Orders | Order transactions |
| Order_Items | Products included in each order |
| Reviews | Customer feedback and ratings |
| Events | User activity tracking |

---

# 🔑 Primary Keys

| Table | Primary Key |
|--------|-------------|
| Users | user_id |
| Products | product_id |
| Orders | order_id |
| Order_Items | order_item_id |
| Reviews | review_id |
| Events | event_id |

---

# 🔗 Foreign Key Relationships

### Orders

- Orders.user_id → Users.user_id

### Order_Items

- Order_Items.order_id → Orders.order_id
- Order_Items.product_id → Products.product_id
- Order_Items.user_id → Users.user_id

### Reviews

- Reviews.order_id → Orders.order_id
- Reviews.product_id → Products.product_id
- Reviews.user_id → Users.user_id

### Events

- Events.user_id → Users.user_id
- Events.product_id → Products.product_id

---

# 📊 Entity Relationship Overview

Users
│
├── Orders
│     └── Order_Items
│              └── Products
│
├── Reviews
│      └── Products
│
└── Events
       └── Products

---

# 🔄 Business Process Flow

```text
User Registration
        ↓
Browse Products
        ↓
View Product Details
        ↓
Add To Cart / Wishlist
        ↓
Place Order
        ↓
Order Created
        ↓
Order Items Generated
        ↓
Delivery
        ↓
Product Review
```

---

# 📈 Analytics Questions Supported

The data model can answer:

- Top selling products
- Revenue by category
- Customer lifetime value
- Repeat customer analysis
- Product review analysis
- Cart abandonment analysis
- User behavior tracking
- Conversion funnel analysis

---

# 🎯 Purpose

This data model is designed to support:

- SQL Analysis
- Exploratory Data Analysis (EDA)
- Business Intelligence Dashboards
- Customer Analytics
- Sales Analytics
- Product Performance Analysis
- Forecasting Models