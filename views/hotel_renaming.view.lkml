# The name of this view in Looker is "Hotel Renaming"
view: hotel_renaming {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.HOTEL_RENAMING` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Hotel Code" in Explore.

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: hotel_name {
    type: string
    sql: ${TABLE}.hotel_name ;;
  }
  measure: count {
    type: count
    drill_fields: [hotel_name]
  }
}
