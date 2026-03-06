view: fact_order_items {

  label: "Order Line Items"
  description: "Product level transactional fact table at the line item grain (one row per product per order). Supports merchandising analysis, revenue tracking, and reorder behavior insights."

  sql_table_name: INSTACART_DB.MART.FACT_ORDER_ITEMS ;;

  dimension: order_product_key {
    primary_key: yes
    hidden: yes
    sql: concat(${TABLE}.order_id,${TABLE}.product_id) ;;
  }

  dimension: order_id {
    label: "Order ID"
    description: "Unique identifier for each customer order."
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: product_id {
    label: "Product ID"
    description: "Unique identifier for each purchased product."
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: reordered {
    label: "Reordered"
    description: "Indicates whether the product was previously purchased by the same customer."
    type: yesno
    sql: ${TABLE}.reordered ;;
  }

  # measures 
  measure: total_items {
    label: "Total Items"
    description: "Total number of purchased product line items."
    type: count
    value_format_name: decimal_0
  }

  measure: total_revenue {
    label: "Total Revenue"
    description: "Total revenue generated from purchased products."
    type: sum
    sql: ${TABLE}.revenue ;;
    value_format_name: usd
    drill_fields: [order_id, product_id]
  }

  measure: reorder_rate {
    label: "Reorder Rate"
    description: "Percentage of purchased items that were repeat purchases."
    type: average
    sql: ${TABLE}.reordered ;;
    value_format_name: percent_2
  }

}