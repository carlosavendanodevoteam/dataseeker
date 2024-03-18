# The name of this view in Looker is "Spaces"
view: spaces {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `analysis-seeker.clickup_dataset.SPACES` ;;
  drill_fields: [space_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: space_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.space_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Space Name" in Explore.

  dimension: space_name {
    type: string
    sql: ${TABLE}.space_name ;;
  }
  measure: count {
    type: count
    drill_fields: [space_id, space_name, lists.count]
  }
}
