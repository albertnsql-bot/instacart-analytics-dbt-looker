view: customer_cohorts {

  label: "Customer Cohorts"
  description: "Customer cohort analysis table used to track retention over time. Each row represents a cohort of customers grouped by their first order month and their activity in subsequent months."

  sql_table_name: INSTACART_DB.MART.CUSTOMER_COHORTS ;;

  dimension_group: cohort_month {
    label: "Cohort Month"
    description: "Month when the customer first placed an order."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.COHORT_MONTH ;;
  }

  dimension_group: order_month {
    label: "Order Month"
    description: "Month when the customer returned and placed another order."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.ORDER_MONTH ;;
  }

  dimension: cohort_index {
    label: "Cohort Index (Months Since First Order)"
    description: "Number of months since the customer's first purchase."
    type: number
    sql: ${TABLE}.COHORT_INDEX ;;
  }

  measure: active_customers {
    label: "Active Customers"
    description: "Number of customers from the cohort who placed an order in the given month."
    type: sum
    sql: ${TABLE}.ACTIVE_CUSTOMERS ;;
    value_format_name: decimal_0
  }

  measure: retention_rate {
    label: "Retention Rate"
    description: "Percentage of customers from the cohort who returned in a given month."
    type: number
    sql: ${active_customers} / NULLIF(MAX(${active_customers}) OVER (PARTITION BY ${cohort_month}),0) ;;
    value_format_name: percent_2
}

}