view: MVIEW_HOTEL_DATA_WIHP_DERBY {
  sql_table_name: `analysis-seeker.bi_dataset.MVIEW_HOTEL_DATA_WIHP_DERBY` ;;

  dimension: avg_hotel_price_diff {
    type: number
    sql: ${TABLE}.avg_hotel_price_diff ;;
  }
  dimension: sum_booking {
    type: number
    sql: ${TABLE}.bookings_raw ;;
  }
  #dimension: campaign {
  #  type: string
  #  sql: ${TABLE}.campaign ;;
  #}
  #dimension: chanel {
  #  type: string
  #  sql: ${TABLE}.chanel ;;
  #}
  dimension: sum_clicks {
    type: number
    sql: ${TABLE}.sum_clicks ;;
  }
  #dimension: ctr_raw {
  #  type: number
  #  sql: ${TABLE}.CTR_raw ;;
  #}
  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }
  dimension: sum_elegible_impresion {
    type: number
    sql: ${TABLE}.sum_elegible_impresion ;;
  }
  #dimension: first_position_share_raw {
  #  type: number
  #  sql: ${TABLE}.first_position_share_raw ;;
  #}
  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }
  #dimension: impression_share_raw {
  #  type: number
  #  sql: ${TABLE}.impression_share_raw ;;
  #}
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
    datatype: datetime
    sql: ${TABLE}.partition_timestamp ;;
  }
  measure: count {
    type: count
    drill_fields: [hotel_code]
  }

}
