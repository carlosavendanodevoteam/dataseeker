view: clickup_task {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `analysis-seeker.clickup_dataset.MVIEW_TASKS_BY_CREATED_DATE` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Corporative Hotel Code" in Explore.

  dimension: start_date_datetype {
    type: string
    sql: TIMESTAMP_TRUNC(${TABLE}.start_date, DAY) ;;
  }
}
