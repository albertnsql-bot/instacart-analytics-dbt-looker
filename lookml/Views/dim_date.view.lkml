view: dim_date {

  label: "Date"
  description: "Calendar date dimension used for time-based reporting including daily, weekly, monthly, and yearly performance analysis."

  sql_table_name: MART.DIM_DATE ;;

  # Primary Date Field
  dimension_group: date {
    label: "Date"
    description: "Calendar date."
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.DATE_DAY ;;
    primary_key: yes
  }

  dimension: year {
    label: "Year"
    description: "Calendar year."
    type: number
    sql: ${TABLE}.YEAR ;;
  }

  dimension: month_number {
    label: "Month"
    description: "Calendar month number (1 to 12)."
    type: number
    sql: ${TABLE}.MONTH ;;
  }

  dimension: day_of_month {
    label: "Day of Month"
    description: "Day number within the month."
    type: number
    sql: ${TABLE}.DAY ;;
  }

  dimension: week_number {
    label: "Week Number"
    description: "Week number within the year."
    type: number
    sql: ${TABLE}.WEEK ;;
  }

  dimension: day_of_week {
    label: "Day of Week"
    description: "Day of the week."
    type: string
    sql: ${TABLE}.DAY_OF_WEEK ;;
  }

  dimension: is_weekend {
    label: "Is Weekend"
    description: "Indicates whether the date falls on a weekend."
    type: yesno
    sql: ${TABLE}.IS_WEEKEND ;;
  }

}