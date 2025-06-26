view: ring2travel_calls_report {

  sql_table_name: `bi_dataset.RING2TRAVEL_CALLS_REPORT`  ;;

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
    type: number
    sql: ${TABLE}.Talk_time;;
  }

  dimension: wait_time {
    type: number
    sql: CAST(${TABLE}.Wait_Time AS INT) ;;
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
    sql: CAST(${TABLE}.Call_length AS INT) ;;
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

  dimension: DDI {
    type: string
    primary_key: yes
    sql: ${TABLE}.DDI ;;
  }

  dimension: DDI_Description {
    type: string
    sql: ${TABLE}.DDI_Description ;;
  }


  dimension: Contestadas {
    type: number
    sql: Case
          when ${TABLE}.DDI is not Null and  ${TABLE}.Agent_First_Name != '' then 1
          else 0
        END;;
  }

  dimension: abandonos {
    type: number
    sql: Case
          when ${TABLE}.DDI is not Null and CAST(${TABLE}.Wait_Time AS INT) < 20 then 1
          else 0
        END;;
  }

  dimension: Call_Outcome_name {
    type: string
    sql: ${TABLE}.Call_Outcome_name ;;
  }
  dimension: Queue_Name {
    type: string
    sql: ${TABLE}.Queue_Name ;;
  }

  dimension: Queue_Name_fixed {
    type: string
    sql:  Case
            when ${TABLE}.Queue_Name like '%Taiga Almería%' then 'q10-cuevas'
            when ${TABLE}.Queue_Name like '%Taiga Conil%' then 'q10-conil'
            when ${TABLE}.Queue_Name like '%Taiga Delta%' then 'q10-ampolla'
            when ${TABLE}.Queue_Name like '%Taiga Lake%' then 'q10-caspe'
            when ${TABLE}.Queue_Name like '%Taiga Tarifa%' then 'q10-teacampa'
            when ${TABLE}.Queue_Name like '%Taiga Costa Calida%' then 'q10-portus'
            when ${TABLE}.Queue_Name like '%Taiga Las Dunas%' then 'taiga-dunas'
            when ${TABLE}.Queue_Name like '%Taiga Valdevaqueros%' then 'taiga-valdevaqueros'
            else ${TABLE}.Queue_Name
            End;;
}

}
