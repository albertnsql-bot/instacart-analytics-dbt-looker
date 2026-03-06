view: dim_customer {

  label: "Customer"
  description: "Customer level dimension containing lifecycle and purchasing summary metrics. Each row represents a unique customer and supports retention, lifetime value, and order frequency analysis."

  sql_table_name: INSTACART_DB.MART.DIM_CUSTOMER ;;

  dimension: customer_id {
    label: "Customer ID"
    description: "Unique identifier for each customer."
    primary_key: yes
    type: number
    sql: ${TABLE}.CUSTOMER_ID ;;
  }

  dimension_group: first_order_date {
    label: "First Order Date"
    description: "Date of the customer's first recorded order."
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.FIRST_ORDER_DATE ;;
  }

  dimension_group: last_order_date {
    label: "Last Order Date"
    description: "Date of the customer's most recent order."
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.LAST_ORDER_DATE ;;
  }

  dimension: total_orders {
    label: "Total Orders"
    description: "Total number of completed orders placed by the customer."
    type: number
    sql: ${TABLE}.TOTAL_ORDERS ;;
  }

  dimension: customer_lifetime_days {
    label: "Customer Lifetime (Days)"
    description: "Total number of days between the customer's first and most recent order."
    type: number
    sql: ${TABLE}.CUSTOMER_LIFETIME_DAYS ;;
  }

  ## Measures

  measure: total_customers {
    label: "Total Customers"
    description: "Total number of unique customers."
    type: count_distinct
    sql: ${customer_id} ;;
    value_format_name: decimal_0
  }

  measure: avg_orders_per_customer {
    label: "Average Orders per Customer"
    description: "Average number of orders placed per customer."
    type: average
    sql: ${total_orders} ;;
    value_format_name: decimal_2
  }

  measure: avg_customer_lifetime_days {
    label: "Average Customer Lifetime (Days)"
    description: "Average number of days customers remain active."
    type: average
    sql: ${customer_lifetime_days} ;;
    value_format_name: decimal_0
  }

}