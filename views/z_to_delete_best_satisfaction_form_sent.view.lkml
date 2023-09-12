# The name of this view in Looker is "Z to Delete Best Satisfaction Form Sent"
view: z_to_delete_best_satisfaction_form_sent {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.Z_TO_DELETE_BEST_SATISFACTION_FORM_SENT` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Hotel Code" in Explore.

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: identifier {
    type: string
    sql: ${TABLE}.identifier ;;
  }

  dimension: reference_timestamp {
    type: string
    sql: ${TABLE}.referenceTimestamp ;;
  }

  dimension: zona {
    type: string
    sql: ${TABLE}.Zona ;;
  }
  measure: count {
    type: count
  }
}
