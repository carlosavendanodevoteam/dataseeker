# The name of this view in Looker is "Mview Horario R2 T"
view: mview_horario_r2t {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `analysis-seeker.bi_dataset.MVIEW_HORARIO_R2T` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: event {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.event_date ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Login Hours" in Explore.

  dimension: login_hours {
    type: number
    sql: ${TABLE}.login_hours ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_login_hours {
    type: sum
    sql: ${login_hours} ;;  }


  measure: average_login_hours {
    type: average
    sql: ${login_hours} ;;  }

  dimension: logout_hours {
    type: number
    sql: ${TABLE}.logout_hours ;;
  }

  measure: total_logout_hours {
    type: sum
    sql: ${logout_hours} ;;  }

  dimension: user_full_name {
    type: string
    sql: ${TABLE}.User_Full_Name ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.Username ;;
  }
  measure: count {
    type: count
    drill_fields: [username, user_full_name]
  }

}
