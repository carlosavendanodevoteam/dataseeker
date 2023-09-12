# The name of this view in Looker is "Z to Delete Acumulado Otb D M Y"
view: z_to_delete_acumulado_otb_d_m_y {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.Z_TO_DELETE_ACUMULADO_OTB_D_M_Y` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cancelaciones" in Explore.

  dimension: cancelaciones {
    type: number
    sql: ${TABLE}.Cancelaciones ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cancelaciones {
    type: sum
    sql: ${cancelaciones} ;;  }
  measure: average_cancelaciones {
    type: average
    sql: ${cancelaciones} ;;  }

  dimension: day {
    type: number
    sql: ${TABLE}.day ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: reservas {
    type: number
    sql: ${TABLE}.Reservas ;;
  }

  dimension: startdate {
    type: string
    sql: ${TABLE}.startdate ;;
  }

  dimension: ventas {
    type: number
    sql: ${TABLE}.Ventas ;;
  }

  dimension: ventas_canceladas {
    type: number
    sql: ${TABLE}.VentasCanceladas ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }
  measure: count {
    type: count
  }
}
