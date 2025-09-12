view: conversion_rates_map {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: `analysis-seeker.bi_dataset.CONVERSION_RATES_MAP`  ;;
  #
  # # Define your dimensions and measures here, like this:
   dimension: currency {
     type: string
     sql: ${TABLE}.currency ;;
   }

   dimension: rate {
     type: number
     sql: ${TABLE}.rate ;;
   }

  dimension: rate_to_eur {
    type: number
    sql: ${TABLE}.rate_to_eur ;;
  }

  dimension: rate_to_usd {
    type: number
    sql: ${TABLE}.rate_to_usd ;;
  }
}
