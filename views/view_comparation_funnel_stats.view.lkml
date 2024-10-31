# The name of this view in Looker is "View Comparation Funnel Stats"
view: view_comparation_funnel_stats {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.VIEW_COMPARATION_FUNNEL_STATS` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "B1 to B2" in Explore.

  dimension: b1_to_b2 {
    type: number
    sql: ${TABLE}.b1_to_b2 ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_b1_to_b2 {
    type: sum
    sql: ${b1_to_b2} ;;  }
  measure: average_b1_to_b2 {
    type: average
    sql: ${b1_to_b2} ;;  }

  dimension: b1_unique_ips_to_b2 {
    type: number
    sql: ${TABLE}.b1_unique_ips_to_b2 ;;
  }

  dimension: b2_to_b3 {
    type: number
    sql: ${TABLE}.b2_to_b3 ;;
  }

  dimension: booking1 {
    type: number
    sql: ${TABLE}.booking1 ;;
  }

  dimension: booking1_unique_ips {
    type: number
    sql: ${TABLE}.booking1_unique_ips ;;
  }

  dimension: booking2 {
    type: number
    sql: ${TABLE}.booking2 ;;
  }

  dimension: booking3 {
    type: number
    sql: ${TABLE}.booking3 ;;
  }

  dimension: booking4 {
    type: number
    sql: ${TABLE}.booking4 ;;
  }

  dimension: booking4_gateway {
    type: number
    sql: ${TABLE}.booking4_gateway ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: last_year_booking {
    type: number
    sql: ${TABLE}.last_year_booking ;;
  }

  dimension_group: partition_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.partitionTimestamp ;;
  }

  dimension: visitas {
    type: number
    sql: ${TABLE}.visitas ;;
  }
  measure: count {
    type: count
  }

  dimension_group: comparation_partitiontimestamp_without_future{
    type: time
    sql: IF(${TABLE}.last_year_booking = 0, ${TABLE}.partitionTimestamp,
      CASE
        WHEN CAST(${TABLE}.partitionTimestamp AS timestamp) > CURRENT_TIMESTAMP() THEN NULL
        ELSE CAST(${TABLE}.partitionTimestamp AS timestamp)
      END);;
    timeframes: [raw, time, date, week, month, quarter, year]
  }

}
