# The name of this view in Looker is "Hotels Data"
view: hotels_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.HOTELS_DATA` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Account" in Explore.

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: amenities {
    type: string
    sql: ${TABLE}.amenities ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
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

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: goals {
    type: string
    sql: ${TABLE}.goals ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: hotel_encoded {
    type: string
    sql: ${TABLE}.hotel_encoded ;;
  }

  dimension: hotel_fingersprint {
    type: number
    sql: ${TABLE}.hotel_fingersprint ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_hotel_fingersprint {
    type: sum
    sql: ${hotel_fingersprint} ;;  }
  measure: average_hotel_fingersprint {
    type: average
    sql: ${hotel_fingersprint} ;;  }

  dimension: latitude {
    type: string
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: string
    sql: ${TABLE}.longitude ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: percentage {
    type: string
    sql: ${TABLE}.percentage ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: zone {
    type: string
    sql: ${TABLE}.zone ;;
  }

  dimension: web_budget {
    type: number
    sql: ${TABLE}.web_budget ;;
  }

  dimension: ring2travel_budget {
    type: number
    sql: ${TABLE}.ring2travel_budget ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
