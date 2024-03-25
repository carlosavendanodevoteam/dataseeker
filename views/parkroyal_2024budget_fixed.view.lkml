# The name of this view in Looker is "Parkroyal 2024budget Fixed"
view: parkroyal_2024budget_fixed {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `ga-bigquery-storage.costs.parkroyal_2024budget_fixed` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Adr Mxn" in Explore.

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
    sql: ${TABLE}.ingresos_MXN ;;
  }

  dimension: ingresos_usd {
    type: number
    sql: ${TABLE}.ingresos_USD ;;
  }

  dimension: inversion_mxn {
    type: number
    sql: ${TABLE}.inversion_MXN ;;
  }

  dimension: inversion_usd {
    type: number
    sql: ${TABLE}.inversion_USD ;;
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
}
