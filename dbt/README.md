# 🛒 Instacart Analytics Warehouse  
**Snowflake + dbt End-to-End Analytics Engineering Project**

##  Overview

This project builds a production-style ecommerce analytics warehouse using Snowflake and dbt.  
Raw Instacart transactional data is transformed into a scalable star schema supporting:

- Customer retention & cohort analysis  
- Revenue & profitability modeling  
- Basket and reorder behavior analysis  
- RFM customer segmentation  

The architecture follows modern analytics engineering best practices with layered transformations and incremental fact modeling.

---

## Architecture

RAW → STAGING → INTERMEDIATE → MART → BI

**RAW**  
Source data loaded into Snowflake without transformation.

**STAGING (Views)**  
Column standardization and cleaning using `source()` references.

**INTERMEDIATE (Views)**  
Cumulative customer timeline logic and synthetic `order_date` generation.

**MART (Tables / Incremental)**  
Star schema with business-ready fact and dimension models.

---

## ⭐ Data Model

### Fact Tables

**fact_order_items (Incremental)**  
Grain: 1 row per product per order  
- revenue  
- cost  
- margin  
- reordered flag  

**fact_orders**  
Grain: 1 row per order  
- total_items  
- order_revenue  
- avg_item_price  
- reorder_ratio  

---

### Dimension Tables

**dim_product** – product, aisle, department  
**dim_customer** – first/last order, lifetime metrics  
**dim_date** – calendar date spine  

---

## 📊 Analytical Models

- **customer_cohorts** → monthly retention analysis  
- **customer_rfm** → recency, frequency, monetary segmentation  
- **product_performance** → revenue & reorder analysis by product  

---

## 🚀 Key KPIs Enabled

- Average Order Value (AOV)  
- Customer Lifetime Value (LTV)  
- Monthly Retention Rate  
- Reorder Ratio  
- Revenue by Department  
- Basket Size Analysis  

---

## ⚙ Technical Highlights

- Layered warehouse architecture  
- Incremental fact modeling with composite keys  
- Window functions for cumulative logic  
- Explicit grain definition per model  
- Business-oriented star schema design  

---

## 🛠 Tech Stack

- Snowflake  
- dbt  
- SQL (Window Functions, Incremental Modeling)  
- Star Schema Design  