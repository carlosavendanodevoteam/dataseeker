# The name of this view in Looker is "Costa Del Sol Rsv Data 20211214"
view: costa_del_sol_rsv_data_20211214 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.COSTA_DEL_SOL_RSV_DATA_20211214` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Board" in Explore.

  dimension: board {
    type: string
    sql: ${TABLE}.board ;;
  }

  dimension: cancelled {
    type: yesno
    sql: ${TABLE}.cancelled ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: days {
    type: number
    sql: ${TABLE}.days ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: fecha_reserva {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fechaReserva ;;
  }

  dimension: fecha_viaje {
    type: string
    sql: ${TABLE}.fechaViaje ;;
  }

  dimension: hotel_category {
    type: string
    sql: ${TABLE}.hotel_category ;;
  }

  dimension: ip_geo_city {
    type: string
    sql: ${TABLE}.ip_geo_city ;;
  }

  dimension: ip_geo_latlon {
    type: string
    sql: ${TABLE}.ip_geo_latlon ;;
  }

  dimension: is_nacional {
    type: number
    sql: ${TABLE}.IsNacional ;;
  }

  dimension: total_price {
    type: number
    sql: ${TABLE}.total_price ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_total_price {
    type: sum
    sql: ${total_price} ;;  }
  measure: average_total_price {
    type: average
    sql: ${total_price} ;;  }
  measure: count {
    type: count
  }
}
