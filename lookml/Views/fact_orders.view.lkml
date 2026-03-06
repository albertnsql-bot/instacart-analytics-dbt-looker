view: fact_orders {

  label: "Orders"
  description: "Order-level fact table containing one row per customer order. This view supports revenue analysis, basket size analysis, and customer purchasing behavior over time."

  sql_table_name: INSTACART_DB.MART.FACT_ORDERS ;;

  dimension: order_id {
    label: "Order ID"
    description: "Unique identifier for each order."
    primary_key: yes
    type: number
    sql: ${TABLE}.ORDER_ID ;;
  }

  dimension: customer_id {
    label: "Customer ID"
    description: "Unique identifier for the customer who placed the order."
    type: number
    sql: ${TABLE}.CUSTOMER_ID ;;
  }

  dimension_group: order_date {
    label: "Order Date"
    description: "Date when the order was placed."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.ORDER_DATE ;;
  }

  dimension: total_items {
    label: "Total Items"
    description: "Total number of items purchased in the order."
    type: number
    sql: ${TABLE}.TOTAL_ITEMS ;;
  }

  dimension: unique_products {
    label: "Unique Products"
    description: "Number of unique products included in the order."
    type: number
    sql: ${TABLE}.UNIQUE_PRODUCTS ;;
  }

  dimension: avg_item_price {
    label: "Average Item Price"
    description: "Average price of items purchased within the order."
    type: number
    sql: ${TABLE}.AVG_ITEM_PRICE ;;
    value_format_name: usd
  }

  dimension: reorder_ratio {
    label: "Reorder Ratio"
    description: "Percentage of items in the order that were previously purchased by the customer."
    type: number
    sql: ${TABLE}.REORDER_RATIO ;;
    value_format_name: percent_2
  }

  # -----------------------
  # Measures
  # -----------------------

  measure: total_orders {
    label: "Total Orders"
    description: "Total number of orders placed."
    type: count_distinct
    sql: ${order_id} ;;
    value_format_name: decimal_0
  }

  measure: total_revenue {
    label: "Total Revenue"
    description: "Total revenue generated from orders."
    type: sum
    sql: ${TABLE}.ORDER_REVENUE ;;
    value_format_name: usd
    drill_fields: [order_id, customer_id, order_date]
  }

  measure: total_cost {
    label: "Total Cost"
    description: "Total cost associated with fulfilling orders."
    type: sum
    sql: ${TABLE}.ORDER_COST ;;
    value_format_name: usd
  }

  measure: total_margin {
    label: "Total Margin"
    description: "Total profit margin generated from orders."
    type: sum
    sql: ${TABLE}.ORDER_MARGIN ;;
    value_format_name: usd
  }

  measure: average_order_value {
    label: "Average Order Value"
    description: "Average revenue generated per order."
    type: average
    sql: ${TABLE}.ORDER_REVENUE ;;
    value_format_name: usd
  }

}