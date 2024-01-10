view: revenue_trends {
  sql_table_name: `bi_dataset.MVIEW_COMPARATION_BOOKING_BY_START_DATE` ;;

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  measure: last_7_days {
    type: number
    sql: ${TABLE}.Revenue_7_days ;;
  }

  measure: last_14_days {
    type: number
    sql: ${TABLE}.Revenue_14_days;;
  }
}
