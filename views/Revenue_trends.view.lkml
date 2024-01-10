view: revenue_trends {
  sql_table_name: `bi_dataset.Revenue_trends` ;;

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: Revenue_7_days {
    type: number
    sql: ${TABLE}.Revenue_7_days ;;
  }

  dimension: Revenue_14_days {
    type: number
    sql: ${TABLE}.Revenue_14_days;;
  }
}
