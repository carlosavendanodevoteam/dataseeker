view: ring2travel_calls_report {

  sql_table_name: `analysis-seeker.bi_dataset.RING2TRAVEL_CALLS_REPORT`  ;;

  dimension: total_calls{
    type: number
    sql: ${TABLE}.total_calls ;;
  }

  dimension_group: Call_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Call_start ;;
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


}
