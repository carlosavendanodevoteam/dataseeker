# The name of this view in Looker is "Tasks"
view: ClickUp_task {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `analysis-seeker.clickup_dataset.TASKS` ;;
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
    # This dimension will be called "Custom Fields" in Explore.

  dimension: custom_fields {
    type: string
    sql: ${TABLE}.custom_fields ;;
  }

  dimension: date_created {
    type: string
    sql: ${TABLE}.date_created ;;
  }

  dimension: date_updated {
    type: string
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

  dimension: insertion_date {
    type: string
    sql: ${TABLE}.insertion_date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: start_date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql:  CAST(${TABLE}.start_date as timestamp) ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: tags {
    type: string
    sql: ${TABLE}.tags ;;
  }

  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  task_id,
  name,
  users.user_id,
  users.group_name,
  users.username,
  tracking.count
  ]
  }

}
