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

  dimension: month{
    type: number
    sql:  EXTRACT(month FROM ${TABLE}.fecha) ;;
  }

  dimension: month_text {
    type: string
    sql: Case
          when ${month} = 1 then "Jan"
          when ${month} = 2 then "Feb"
          when ${month} = 3 then "Mar"
          when ${month} = 4 then "Apr"
          when ${month} = 5 then "May"
          when ${month} = 6 then "Jun"
          when ${month} = 7 then "Jul"
          when ${month} = 8 then "Aug"
          when ${month} = 9 then "Sep"
          when ${month} = 10 then "Oct"
          when ${month} = 11 then "Nov"
          else "Dec"
        End;;
  }

}
