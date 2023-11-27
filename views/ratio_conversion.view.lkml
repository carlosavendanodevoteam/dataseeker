view: ratio_conversion {
  # The name of this view in Looker is "Mview Datos Reservas 6"
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.MVIEW_DATOS_RESERVAS_6` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Account" in Explore.

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: identifier {
    type: string
    sql: ${TABLE}.identifier ;;
  }

  dimension: hotel_name {
    type: string
    sql: ${TABLE}.hotel_name;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: nights {
    type: number
    sql: ${TABLE}.nights ;;
  }

  dimension: num_rooms {
    type: number
    sql: ${TABLE}.numRooms ;;
  }

  dimension: original_price_before_discount {
    type: number
    sql: ${TABLE}.original_price_before_discount ;;
  }

  dimension: package_name {
    type: string
    sql: ${TABLE}.PackageName ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: price_supplements {
    type: number
    sql: ${TABLE}.priceSupplements ;;
  }


  dimension: rate {
    type: string
    sql: ${TABLE}.rate ;;
  }

  dimension: rate_name {
    type: string
    sql: ${TABLE}.RateName ;;
  }

  dimension: reference_timestamp {
    type: string
    sql: ${TABLE}.referenceTimestamp ;;
  }

  dimension_group: partition_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.partitionTimestamp ;;
  }


  dimension: room {
    type: string
    sql: ${TABLE}.Room ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: source_fixed {
    type: string
    sql: ${TABLE}.source_fixed ;;
  }

  dimension: start_date {
    type: string
    sql: ${TABLE}.startDate ;;
  }

  dimension_group: start_date_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: cast(${TABLE}.startDate as timestamp);;
  }

  dimension: revenue {
    type: number
    sql: CASE
        WHEN ${TABLE}.cancelled = True THEN 0
        WHEN ${TABLE}.cancelled = False THEN ${TABLE}.price + COALESCE(${TABLE}.priceSupplements, 0)
      END;;
  }

  dimension: rn {
    type: number
    sql: CASE
        WHEN ${TABLE}.cancelled = True THEN 0
        WHEN ${TABLE}.cancelled = False THEN ${TABLE}.nights * CAST(${TABLE}.numRooms as INTEGER)
      END;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp ;;
  }

  dimension: timestamp_date_datos_reservas_6 {
    type: string
    sql: ${TABLE}.timestamp_date ;;
  }

  dimension: timestamp_dayofweek {
    type: number
    sql: ${TABLE}.timestamp_dayofweek ;;
  }

  measure: count {
    type: count
    drill_fields: [hotel_name, rate_name, name, package_name]
  }

  measure: num_reservas {
    type:  count
    drill_fields: [identifier]
  }

  dimension: advance{
    type: number
    sql: date_diff(cast(${TABLE}.startDate as timestamp), cast(${TABLE}.timestamp as timestamp), day) ;;
  }

}
