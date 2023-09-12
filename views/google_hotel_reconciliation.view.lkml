# The name of this view in Looker is "Google Hotel Reconciliation"
view: google_hotel_reconciliation {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.GOOGLE_HOTEL_RECONCILIATION` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Customer ID" in Explore.

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
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

  dimension: hotel_commission_rate_micros {
    type: number
    sql: ${TABLE}.hotel_commission_rate_micros ;;
  }

  dimension: hotel_expected_commission_cost {
    type: number
    sql: ${TABLE}.hotel_expected_commission_cost ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_hotel_expected_commission_cost {
    type: sum
    sql: ${hotel_expected_commission_cost} ;;  }
  measure: average_hotel_expected_commission_cost {
    type: average
    sql: ${hotel_expected_commission_cost} ;;  }

  dimension: hotel_id {
    type: string
    sql: ${TABLE}.hotel_id ;;
  }

  dimension: value_per_conversions_by_conversion_date {
    type: number
    sql: ${TABLE}.value_per_conversions_by_conversion_date ;;
  }
  measure: count {
    type: count
  }
}
