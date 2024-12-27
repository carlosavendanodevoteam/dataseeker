# The name of this view in Looker is "Tracking"
view: tracking {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `analysis-seeker.clickup_dataset.TRACKING` ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Duration" in Explore.

  dimension: duration {
    type: number
    sql: ${TABLE}.duration;;
  }

  dimension: end_date {
    type: string
    sql: ${TABLE}.end_date ;;
  }

  dimension: end_date_datetype {
    type: string
    sql: cast(${TABLE}.end_date as timestamp);;
  }

  dimension: start_date {
    type: number
    sql: ${TABLE}.start_date ;;
  }

  dimension: start_date_datetype {
    type: number
    sql: cast(${TABLE}.startDate as timestamp);;
  }

  dimension: task_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.task_id ;;
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
  id,
  users.user_id,
  users.group_name,
  users.username,
  tasks.task_id,
  tasks.name
  ]
  }

}
