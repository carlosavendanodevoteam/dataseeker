view: total_work_time {
  derived_table: {
    explore_source: agent_work_time {
      column: agent {field: agent_work_time.agente}
      column: work_duration_hours {field: agent_work_time.work_duration_hours}
    }
  }

  dimension: agent {
    type: string
    sql: ${TABLE}.agent ;;
  }

  measure: total_work_hours {
    type: sum
    sql: ${TABLE}.work_duration_hours ;;
  }
}
