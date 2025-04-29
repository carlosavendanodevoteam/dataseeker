view: MVIEW_HOTEL_DATA_WIHP_DERBY {
  sql_table_name: `bi_dataset.MVIEW_HOTEL_DATA_WIHP_DERBY` ;;

  dimension: avg_hotel_price_diff {
    type: number
    sql: ${TABLE}.avg_hotel_price_diff ;;
  }
  dimension: sum_booking {
    type: number
    sql: ${TABLE}.sum_booking ;;
  }
  dimension: sum_clicks {
    type: number
    sql: ${TABLE}.sum_clicks ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }
  dimension: origin {
    type: string
    sql: ${TABLE}.origin ;;
  }
  dimension: sum_elegible_impresion {
    type: number
    sql: ${TABLE}.sum_elegible_impresion ;;
  }

  dimension: hotel_code {
    primary_key: yes
    type: string
    sql: ${TABLE}.hotel_code ;;
  }
  dimension: sum_impr {
    type: number
    sql: ${TABLE}.sum_impr ;;
  }
  dimension: market {
    type: string
    sql: upper(${TABLE}.market) ;;
  }
  dimension: sum_missed_impression {
    type: number
    sql: ${TABLE}.sum_missed_impression ;;
  }
  dimension: sum_revenue {
    type: number
    sql: ${TABLE}.sum_revenue ;;
  }
  dimension_group: partition_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.partition_timestamp ;;
  }

}
