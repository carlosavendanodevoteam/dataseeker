view: reservas_historicas_gf {
  sql_table_name: `bi_dataset.reservas_historicas_GF` ;;

  dimension: bookings {
    type: number
    sql: ${TABLE}.bookings ;;
  }
  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }
  dimension: last_year_booking {
    type: number
    sql: ${TABLE}.last_year_booking ;;
  }
  dimension: lead_time {
    type: number
    sql: ${TABLE}.lead_time ;;
  }

  dimension_group: partition_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.partitionTimestamp ;;
  }

  dimension: revenue_gross {
    type: number
    sql: ${TABLE}.revenue_gross ;;
  }
  dimension: revenue_net {
    type: number
    sql: ${TABLE}.revenue_net ;;
  }
  dimension: roomnights {
    type: number
    sql: ${TABLE}.roomnights ;;
  }
  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }
  measure: count {
    type: count
  }
}
