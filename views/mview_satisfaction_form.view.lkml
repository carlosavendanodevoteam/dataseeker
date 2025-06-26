# The name of this view in Looker is "Mview Satisfaction Form"
view: mview_satisfaction_form {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.MVIEW_SATISFACTION_FORM` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Booking ID" in Explore.

  dimension: booking_id {
    type: string
    sql: ${TABLE}.booking_id ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: rating {
    type: number
    sql: ${TABLE}.rating ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_rating {
    type: sum
    sql: ${rating} ;;  }
  measure: average_rating {
    type: average
    sql: ${rating} ;;  }

  dimension: row_num {
    type: number
    sql: ${TABLE}.row_num ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp ;;
  }

  dimension: timestamp_str {
    type: string
    sql: ${TABLE}.timestamp_str ;;
  }
  measure: count {
    type: count
  }
}
