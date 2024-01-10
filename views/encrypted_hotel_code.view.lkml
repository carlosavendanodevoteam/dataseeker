view: encrypted_hotel_code {
  sql_table_name: `bi_dataset.encrypted_hotel_code` ;;

  dimension: hotel_code{
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: encrypted{
    type: string
    sql: ${TABLE}.encrypted ;;
  }
}
