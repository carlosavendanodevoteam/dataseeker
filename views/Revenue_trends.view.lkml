view: revenue_trends {
  sql_table_name: `bi_dataset.Revenue_trends` ;;

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  measure: Revenue_7_days {
    type: number
    sql: ${TABLE}.Revenue_7_days ;;
  }

  measure: Revenue_14_days {
    type: number
    sql: ${TABLE}.Revenue_14_days;;
  }
}
