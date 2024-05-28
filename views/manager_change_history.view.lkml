view: manager_change_history {
  sql_table_name: `bi_dataset.MANAGER_CHANGE_HISTORY` ;;

  dimension: changes {
    type: string
    sql: ${TABLE}.changes ;;
  }
  dimension: data {
    type: string
    sql: ${TABLE}.data ;;
  }
  dimension: entity_identifier {
    type: string
    sql: ${TABLE}.entity_identifier ;;
  }
  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }
  dimension: previous_data {
    type: string
    sql: ${TABLE}.previous_data ;;
  }
  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
  dimension: user {
    type: string
    sql: ${TABLE}.user ;;
  }
  measure: count {
    type: count
  }
}