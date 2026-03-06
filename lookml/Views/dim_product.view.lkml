view: dim_product {
  label: "Product Dimension"
  description: "Product-level dimension containing product attributes, aisle classification, department grouping, and deterministic pricing used for revenue and margin calculations."

  sql_table_name: INSTACART_DB.MART.DIM_PRODUCT ;;

  dimension: product_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.product_id ;;
    description: "Unique identifier for each product."
  }

  dimension: product_name {
    label: "Product Name"
    type: string
    sql: ${TABLE}.product_name ;;
    description: "Name of the product as displayed in the catalog."
  }

  dimension: aisle {
    label: "Aisle"
    type: string
    sql: ${TABLE}.aisle ;;
    description: "Aisle classification representing product placement within store layout."
  }

  dimension: department {
    label: "Department"
    type: string
    sql: ${TABLE}.department ;;
    description: "Top-level product category used for financial and performance reporting."
  }

  dimension: product_price {
    label: "Product Price"
    type: number
    value_format_name: usd
    sql: ${TABLE}.product_price ;;
    description: "Deterministic simulated product price used for revenue and margin modeling."
  }

}