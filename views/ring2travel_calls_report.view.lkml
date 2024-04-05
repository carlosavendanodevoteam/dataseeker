view: ring2travel_calls_report {

  sql_table_name: `analysis-seeker.bi_dataset.RING2TRAVEL_CALLS_REPORT`  ;;

  dimension: total_calls{
    type: number
    sql: ${TABLE}.total_calls ;;
  }

  dimension_group: Call_start {
    type: time
    timeframes: [raw, hour, minute, millisecond, time, date, week, month, quarter, year]
    sql: ${TABLE}.Call_start ;;
  }

  dimension_group: Call_end {
    type: time
    timeframes: [raw, hour, minute, millisecond, time, date, week, month, quarter, year]
    sql: ${TABLE}.Call_en ;;
  }

  dimension: talk_time {
    type: string
    sql: ${TABLE}.Talk_time;;
  }

  dimension: wait_time {
    type: string
    sql:${TABLE}.Wait_Time;;
  }

  dimension: ID_Agent {
    type: string
    sql: ${TABLE}.ID_AGENTE ;;
  }

  dimension: Agent_First_Name {
    type: string
    sql: ${TABLE}.Agent_First_Name ;;
  }

  dimension: call_length {
    type: number
    sql: ${TABLE}.Call_length ;;
  }

  dimension: Booking_Start_Date {
    type: string
    sql: ${TABLE}.Booking_Start_Date ;;
  }

  dimension: Booking_Name {
    type: number
    sql: ${TABLE}.Booking_Name ;;
  }

  dimension: booking{
    type: string
    sql: ${TABLE}.Call_Outcome_ID ;;
  }

  measure: count {
    type: count
  }


}
