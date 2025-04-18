# The name of this view in Looker is "Tasks"
view: MVIEW_TASKS {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `analysis-seeker.clickup_dataset.MVIEW_TASKS` ;;
  drill_fields: [task_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: task_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.task_id ;;
  }
  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Client" in Explore.

  dimension: client {
    type: string
    sql: ${TABLE}.client ;;
  }

  dimension: client_mapping {
    type: string
    sql: case
          when ${client} = 'f53d65a2-a4a4-4d93-9047-9f571ad62107' then 'oasis hoteles'
          else ${client}
        end;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension: date_created {
    type: string
    sql: ${TABLE}.date_created ;;
  }

  dimension: date_updated {
    type: date
    sql: ${TABLE}.date_updated ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: due_date {
    type: string
    sql: ${TABLE}.due_date ;;
  }

  dimension: end_date {
    type: string
    sql: ${TABLE}.end_date ;;
  }

  dimension: end_date_datetype {
    type: date
    sql: cast(${TABLE}.end_date as timestamp);;
  }

  dimension: insertion_date {
    type: string
    sql: ${TABLE}.insertion_date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: office {
    type: string
    sql: ${TABLE}.office ;;
  }

  dimension: scoring {
    type: string
    sql: ${TABLE}.scoring ;;
  }

  dimension: start_date {
    type: string
    sql: ${TABLE}.start_date ;;
  }

  dimension: start_date_datetype {
    type: date
    sql: cast(${TABLE}.start_date as timestamp);;
  }


  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }


  dimension: tags {
    type: string
    sql: ${TABLE}.tags ;;
  }

  dimension: time_estimate {
    type: number
    sql: ${TABLE}.time_estimate ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: duration {
    type: number
    sql: ${TABLE}.duration;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: group_id {
    type: string
    sql: ${TABLE}.group_id ;;
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.group_name ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.user_name ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
  }

  dimension: tarea {
    type: string
    sql: CASE
          WHEN ${TABLE}.tarea = "0" THEN 'INCIDENCIA'
          WHEN ${TABLE}.tarea = "1" THEN 'MEJORA'
          WHEN ${TABLE}.tarea = "2" THEN 'NUEVA FUNCIONALIDAD'
          WHEN ${TABLE}.tarea = "3" THEN 'DESARROLLO INTERNO'
          WHEN ${TABLE}.tarea = "4" THEN 'OTRO'
          WHEN ${TABLE}.tarea = "5" THEN 'AJUSTES'
          WHEN ${TABLE}.tarea = "6" THEN 'TAREAS'
          WHEN ${TABLE}.tarea = "7" THEN 'INTEGRACION'
          ELSE ${TABLE}.tarea
          end;;
  }

  dimension: client_commitment {
    type: string
    sql: ${TABLE}.client_commitment ;;
  }

  measure: count { ##
    type: count
    drill_fields: [task_id, name]
  }
}
