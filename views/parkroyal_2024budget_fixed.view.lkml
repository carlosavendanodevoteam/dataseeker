# The name of this view in Looker is "Parkroyal 2024budget Fixed"
view: parkroyal_2024budget_fixed {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `analysis-seeker.bi_dataset.parkroyal_2024budget_fixed` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Adr Mxn" in Explore.

  dimension: hotel_name {
    type: string
    sql: ${TABLE}.hotel_name ;;
  }

  dimension: adr_mxn {
    type: number
    sql: ${TABLE}.ADR_MXN ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_adr_mxn {
    type: sum
    sql: ${adr_mxn} ;;  }
  measure: average_adr_mxn {
    type: average
    sql: ${adr_mxn} ;;  }

  dimension: adr_usd {
    type: number
    sql: ${TABLE}.ADR_USD ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: ingresos_mxn {
    type: number
    sql: ${TABLE}.Ingresos_MXN ;;
  }

  dimension: ingresos_usd {
    type: number
    sql: ${TABLE}.Ingresos_USD ;;
  }

  dimension: inversion_mxn {
    type: number
    sql: ${TABLE}.Inversion_MXN ;;
  }

  dimension: inversion_usd {
    type: number
    sql: ${TABLE}.Inversion_USD ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: rn {
    type: number
    sql: ${TABLE}.RN ;;
  }
  measure: count {
    type: count
  }

  dimension: month_text {
    type: string
    sql: Case
          when UPPER(${month}) = "ENERO" then "January"
          when UPPER(${month}) = "FEBRERO" then "February"
          when UPPER(${month}) = "MARZO" then "March"
          when UPPER(${month}) = "ABRIL" then "April"
          when UPPER(${month}) = "MAYO" then "May"
          when UPPER(${month}) = "JUNIO" then "June"
          when UPPER(${month}) = "JULIO" then "July"
          when UPPER(${month}) = "AGOSTO" then "August"
          when UPPER(${month}) = "SEPTIEMBRE" then "September"
          when UPPER(${month}) = "OCTUBRE" then "October"
          when UPPER(${month}) = "NOVIEMBRE" then "November"
          else "December"
        End;;
  }

  dimension: month_short_text {
    type: string
    sql: Case
          when UPPER(${month}) = "ENERO" then "Jan"
          when UPPER(${month}) = "FEBRERO" then "Feb"
          when UPPER(${month}) = "MARZO" then "Mar"
          when UPPER(${month}) = "ABRIL" then "Apr"
          when UPPER(${month}) = "MAYO" then "May"
          when UPPER(${month}) = "JUNIO" then "Jun"
          when UPPER(${month}) = "JULIO" then "Jul"
          when UPPER(${month}) = "AGOSTO" then "Aug"
          when UPPER(${month}) = "SEPTIEMBRE" then "Sep"
          when UPPER(${month}) = "OCTUBRE" then "Oct"
          when UPPER(${month}) = "NOVIEMBRE" then "Nov"
          else "Dec"
        End;;
  }

  dimension: month_timestamp {
    type: string
    sql: Case
          when UPPER(${month}) = "ENERO" then "2025-01"
          when UPPER(${month}) = "FEBRERO" then "2025-02"
          when UPPER(${month}) = "MARZO" then "2025-03"
          when UPPER(${month}) = "ABRIL" then "2025-04"
          when UPPER(${month}) = "MAYO" then "2025-05"
          when UPPER(${month}) = "JUNIO" then "2025-06"
          when UPPER(${month}) = "JULIO" then "2025-07"
          when UPPER(${month}) = "AGOSTO" then "2025-08"
          when UPPER(${month}) = "SEPTIEMBRE" then "2025-09"
          when UPPER(${month}) = "OCTUBRE" then "2025-10"
          when UPPER(${month}) = "NOVIEMBRE" then "2025-11"
          else "2025-12"
        End;;
  }

  dimension: year {
    type: number
    sql:${TABLE}.year ;;
  }
  dimension_group: month_date {
    type: time
    timeframes: [month]
    sql: ${month_timestamp} ;;
  }

}
