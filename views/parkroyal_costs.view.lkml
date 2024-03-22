view: parkroyal_costs {
  sql_table_name: `ga-bigquery-storage.costs.parkroyal_costs` ;;

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fecha ;;
  }

  dimension: google_ads {
    type: number
    sql: ${TABLE}.google_ads ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: social_ads {
    type: number
    sql: ${TABLE}.social_ads ;;
  }
}
