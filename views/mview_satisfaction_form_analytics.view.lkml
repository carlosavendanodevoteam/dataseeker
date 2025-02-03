# The name of this view in Looker is "Mview Satisfaction Form Analytics"
view: mview_satisfaction_form_analytics {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.VIEW_SATISFACTION_FORM_ANALYTICS` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Booking ID" in Explore.

  dimension: booking_id {
    type: string
    sql: ${TABLE}.booking_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: form_timestamp {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.form_timestamp ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: question {
    type: string
    sql: ${TABLE}.question ;;
  }

  dimension: satisfaction_answer_no_response {
    type: number
    sql: ${TABLE}.satisfaction_answer_no_response ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_satisfaction_answer_no_response {
    type: sum
    sql: ${satisfaction_answer_no_response} ;;  }
  measure: average_satisfaction_answer_no_response {
    type: average
    sql: ${satisfaction_answer_no_response} ;;  }

  dimension: satisfaction_answer_response {
    type: number
    sql: ${TABLE}.satisfaction_answer_response ;;
  }

  dimension: zona {
    type: string
    sql: ${TABLE}.Zona ;;
  }
  measure: count {
    type: count
  }

  measure: num_forms {
    type:  count
    drill_fields: [booking_id]
  }

}
