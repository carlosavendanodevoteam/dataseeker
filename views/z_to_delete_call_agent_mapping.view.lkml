# The name of this view in Looker is "Z to Delete Call Agent Mapping"
view: z_to_delete_call_agent_mapping {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.Z_TO_DELETE_CALL_AGENT_MAPPING` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Client" in Explore.

  dimension: client {
    type: string
    sql: ${TABLE}.client ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }
  measure: count {
    type: count
  }
}
