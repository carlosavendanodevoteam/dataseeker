view: ratio_conversion {
  derived_table: {
    sql:
      SELECT
        DR.hotel_code,
        DR.identifier,
        MIN(B.count_busquedas) as count_busquedas,
        MIN(B.Ok) as busquedas_ok,
        COUNT(*) as total_reservas,
        'Ratio conversion' as query_source
      FROM
        `bi_dataset.VIEW_DATOS_RESERVAS_6` DR
      LEFT JOIN (
        SELECT
          hotel_code,
          COUNT(*) as count_busquedas,
          SUM(CASE WHEN result='OK' THEN 1 ELSE 0 END) as Ok
        FROM
          `bi_dataset.VIEW_BUSQUEDAS`
        WHERE
          EXTRACT(DATE FROM referenceTimestamp) >= PARSE_DATE('%Y%m%d', @DS_START_DATE) AND EXTRACT(DATE FROM referenceTimestamp) <= PARSE_DATE('%Y%m%d', @DS_END_DATE)
        GROUP BY
          hotel_code
      ) AS B ON B.hotel_code = DR.hotel_code
      WHERE
        EXTRACT(DATE FROM DR.timestamp) >= PARSE_DATE('%Y%m%d', @DS_START_DATE) AND EXTRACT(DATE FROM DR.timestamp) <= PARSE_DATE('%Y%m%d', @DS_END_DATE) AND cancelled = FALSE
      GROUP BY
        DR.hotel_code
  ;;
  }
  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
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

  dimension: identifier {
    type: string
    sql: ${TABLE}.identifier ;;
  }

  measure: num_reservas {
    type:  count
    drill_fields: [identifier]
  }
  measure: ok {
    type: sum
    sql: ${TABLE}.busquedas_ok;;
  }

  measure: conversion_rate{
    type: number
    sql: CASE WHEN sum(${TABLE}.ok) = 0 THEN NULL ELSE SUM(${TABLE}.total_reservas) / sum(${TABLE}.ok) END;;
    value_format: "0.00%"
  }

  dimension: referenceTimestamp {
    type: number
    sql: ${TABLE}.referenceTimestamp;;
  }


}
