# The name of this view in Looker is "Call Name Agent"
view: call_name_agent {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.CALL_NAME_AGENT` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Agent" in Explore.

  dimension: agent {
    type: string
    sql: ${TABLE}.agent ;;
  }

  dimension: link_name {
    type: string
    sql: ${TABLE}.link_name ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  measure: count {
    type: count
    drill_fields: [name, link_name]
  }
}
