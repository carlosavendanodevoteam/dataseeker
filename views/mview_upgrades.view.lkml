view: mview_upgrades {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: `bi_dataset.MVIEW_UPGRADES` ;;

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: identifier {
    primary_key: yes
    type: string
    sql: ${TABLE}.identifier ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp;;
  }

  dimension: original_room {
    type: string
    sql: ${TABLE}.original_room ;;
  }

  dimension: upgraded_room {
    type: string
    sql: ${TABLE}.upgraded_room ;;
  }

  dimension: original_rate {
    type: string
    sql: ${TABLE}.original_rate ;;
  }

  dimension: upgraded_rate {
    type: string
    sql: ${TABLE}.upgraded_rate ;;
  }

  dimension: original_board {
    type: string
    sql: ${TABLE}.original_board ;;
  }

  dimension: upgraded_board {
    type: string
    sql: ${TABLE}.upgraded_board ;;
  }

  dimension: original_price {
    type: number
    sql: ${TABLE}.original_price ;;
  }

  dimension: upgraded_price {
    type: number
    sql: ${TABLE}.upgraded_price ;;
  }

  measure: count {
    type: count
    drill_fields: [hotel_code, identifier]
  }
}
