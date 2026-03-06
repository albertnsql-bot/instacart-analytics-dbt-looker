connection: "instacart_snowflake"

include: "/views/*.view"


#################################################
# Orders Explore
#################################################

explore: fact_orders {

  group_label: "Orders & Revenue"
  label: "Orders"
  description: "Order-level analytics including revenue, margin, basket size, and customer purchasing behavior."

  join: dim_customers {
    type: left_outer
    sql_on: ${fact_orders.customer_id} = ${dim_customers.customer_id} ;;
    relationship: many_to_one
    view_label: "Customer"
  }

  join: dim_date {
    type: left_outer
    sql_on: ${fact_orders.order_date_date} = ${dim_date.date_date} ;;
    relationship: many_to_one
    view_label: "Date"
  }

}


#################################################
# Order Items Explore (Basket Analysis)
#################################################

explore: fact_order_items {

  group_label: "Orders & Revenue"
  label: "Order Items"
  description: "Line-item level order analytics used for basket composition, product revenue analysis, and reorder behavior."

  join: dim_product {
    type: left_outer
    sql_on: ${fact_order_items.product_id} = ${dim_product.product_id} ;;
    relationship: many_to_one
    view_label: "Product"
  }

  join: fact_orders {
    type: left_outer
    sql_on: ${fact_order_items.order_id} = ${fact_orders.order_id} ;;
    relationship: many_to_one
    view_label: "Order"
  }

}


#################################################
# Product Performance Explore
#################################################

explore: product_performance {

  group_label: "Product Analytics"
  label: "Product Performance"
  description: "Aggregated product performance metrics including revenue, margin, reorder rate, and customer reach."

}


#################################################
# Customer Segmentation (RFM)
#################################################

explore: customer_rfm {

  group_label: "Customer Analytics"
  label: "Customer RFM"
  description: "Customer segmentation based on Recency, Frequency, and Monetary value."

  join: dim_customers {
    type: left_outer
    sql_on: ${customer_rfm.customer_id} = ${dim_customers.customer_id} ;;
    relationship: many_to_one
    view_label: "Customer"
  }

}


#################################################
# Customer Cohort Analysis
#################################################

explore: customer_cohorts {

  group_label: "Customer Analytics"
  label: "Customer Cohorts"
  description: "Customer cohort analysis used to track retention and repeat purchasing behavior over time."

}