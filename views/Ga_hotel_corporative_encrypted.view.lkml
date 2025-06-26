# The name of this view in Looker is "Hotel Corporative Encrypted"
view: Ga_hotel_corporative_encrypted {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `ga-bigquery-storage.google_analytics_consolidate.HOTEL_CORPORATIVE_ENCRYPTED` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Corporative Hotel Code" in Explore.

  dimension: corporative_hotel_code {
    type: string
    sql: ${TABLE}.corporative_hotel_code ;;
  }

  dimension: corporative_hotel_code_encrypted {
    type: string
    sql: ${TABLE}.corporative_hotel_code_encrypted ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: hotel_code_encrypted {
    type: string
    sql: ${TABLE}.hotel_code_encrypted ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  measure: count {
    type: count
    drill_fields: [name]
  }
}
