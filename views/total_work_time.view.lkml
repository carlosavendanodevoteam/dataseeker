view: total_work_time {
  derived_table: {
    explore_source: agent_work_time {
      column: agente {field: agent_work_time.agente}
      column: work_duration_hours {field: agent_work_time.work_duration_hours}
    }
  }

  dimension: agente {
    type: string
    sql: ${TABLE}.agente ;;
  }

  measure: total_work_hours {
    type: sum
    sql: ${TABLE}.work_duration_hours ;;
  }
}
