# The name of this view in Looker is "Datos Reservas Gha 2023"
view: DATOS_RESERVAS_GHA_2023 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `analysis-seeker.Google_ads_dataset.DATOS_RESERVAS_GHA_2023_FIXED` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Clics" in Explore.

  dimension: clics {
    type: number
    sql: ${TABLE}.Clics ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_clics {
    type: sum
    sql: ${clics} ;;  }
  measure: average_clics {
    type: average
    sql: ${clics} ;;  }

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

  dimension: month {
    type: number
    sql: ${TABLE}.MONTH ;;
  }

  dimension: porcentaje_diff_precio {
    type: number
    sql: ${TABLE}.porcentaje_diff_precio ;;
  }

  dimension: roas {
    type: number
    sql: ${TABLE}.ROAS ;;
  }
  measure: count {
    type: count
  }

  measure: COSTE {
    type: number
    sql: ${TABLE}.COSTE;;
  }

  measure: AVG_CPC {
    type: number
    sql: ${TABLE}.AVG_CPC;;
  }

}
