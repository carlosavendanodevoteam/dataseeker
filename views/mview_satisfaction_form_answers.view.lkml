# The name of this view in Looker is "Mview Satisfaction Form Answers"
view: mview_satisfaction_form_answers {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.MVIEW_COMPARATION_SATISFACTION_FORM_ANSWERS` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Answer Int" in Explore.

  dimension: answer_int {
    type: number
    sql: ${TABLE}.answer_int ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_answer_int {
    type: sum
    sql: ${answer_int} ;;
  }

  measure: average_answer_int {
    type: average
    sql: ${answer_int} ;;  }

  dimension: answer_raw {
    type: string
    sql: ${TABLE}.answer_raw ;;
  }

  dimension: booking_id {
    type: string
    sql: ${TABLE}.booking_id ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: question {
    type: string
    sql: ${TABLE}.question ;;
  }

  dimension: row_num {
    type: number
    sql: ${TABLE}.row_num ;;
  }

  dimension_group: partitionTimestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.partitionTimestamp ;;
  }

  dimension: timestamp_str {
    type: string
    sql: ${TABLE}.timestamp_str ;;
  }
  measure: count {
    type: count
  }

  dimension: last_year_form {
    type: number
    sql: ${TABLE}.last_year_form ;;
  }

  dimension:  result_1{
    type: number
    sql: if(answer_int = 1, 1, 0 );;
  }

  dimension:  result_2{
    type: number
    sql: if(answer_int = 2, 1, 0 );;
  }

  dimension:  result_3{
    type: number
    sql: if(answer_int = 3, 1, 0 );;
  }

  dimension:  result_4{
    type: number
    sql: if(answer_int = 4, 1, 0 );;
  }

  dimension:  result_5{
    type: number
    sql: if(answer_int = 5, 1, 0 );;
  }

}
