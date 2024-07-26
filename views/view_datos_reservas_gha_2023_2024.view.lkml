# The name of this view in Looker is "View Datos Reservas Gha 2023 2024"
view: view_datos_reservas_gha_2023_2024 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `analysis-seeker.Google_ads_dataset.VIEW_DATOS_RESERVAS_GHA_2023_2024` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Clicks" in Explore.

  dimension: clicks {
    type: number
    sql: ${TABLE}.Clicks ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_clicks {
    type: sum
    sql: ${clicks} ;;
  }
  measure: average_clicks {
    type: average
    sql: ${clicks} ;;
  }

  dimension: coste {
    type: number
    sql: ${TABLE}.Coste ;;
  }

  dimension: ctr {
    type: number
    sql: ${TABLE}.CTR ;;
  }

  dimension: generated {
    type: number
    sql: ${TABLE}.Generated ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: mont_name {
    type: string
    sql: ${TABLE}.MONT_NAME ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.MONTH ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: partition_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.partitionTimestamp ;;
  }

  dimension: porcentaje_diff_precio {
    type: number
    sql: ${TABLE}.porcentaje_diff_precio ;;
  }

  dimension: roas {
    type: number
    sql: ${TABLE}.ROAS ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }
  measure: count {
    type: count
    drill_fields: [mont_name]
  }

  measure: avg.cpc {
    type: number
    sql:  if( ${coste} > 0 and ${clicks} > 0, ${coste}/${clicks}, 0)  ;;
  }
}
