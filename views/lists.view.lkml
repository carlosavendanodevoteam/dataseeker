# The name of this view in Looker is "Lists"
view: lists {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `analysis-seeker.clickup_dataset.LISTS` ;;
  drill_fields: [list_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: list_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.list_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Folder ID" in Explore.

  dimension: folder_id {
    type: string
    sql: ${TABLE}.folder_id ;;
  }

  dimension: list_name {
    type: string
    sql: ${TABLE}.list_name ;;
  }

  dimension: space_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.space_id ;;
  }
  measure: count {
    type: count
    drill_fields: [list_id, list_name, spaces.space_name, spaces.space_id]
  }
}
