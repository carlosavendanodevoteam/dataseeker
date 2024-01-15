view: hotel_corporative_encrypted {

  sql_table_name: `bi_dataset.HOTEL_CORPORATIVE_ENCRYPTED` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Account" in Explore.

  dimension: hotel_corporative {
    type: string
    sql: ${TABLE}.corporative_hotel_code ;;
  }

  dimension: hotel_code {
    type: string
    sql:  ${TABLE}.hotel_code ;;
  }
}
