# The name of this view in Looker is "Casuistica Hotel Code"
view: casuistica_hotel_code {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.CASUISTICA_HOTEL_CODE` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "String Field 0" in Explore.

  dimension: string_field_0 {
    type: string
    sql: ${TABLE}.string_field_0 ;;
  }

  dimension: string_field_1 {
    type: string
    sql: ${TABLE}.string_field_1 ;;
  }

  dimension: string_field_10 {
    type: string
    sql: ${TABLE}.string_field_10 ;;
  }

  dimension: string_field_11 {
    type: string
    sql: ${TABLE}.string_field_11 ;;
  }

  dimension: string_field_12 {
    type: string
    sql: ${TABLE}.string_field_12 ;;
  }

  dimension: string_field_13 {
    type: string
    sql: ${TABLE}.string_field_13 ;;
  }

  dimension: string_field_2 {
    type: string
    sql: ${TABLE}.string_field_2 ;;
  }

  dimension: string_field_3 {
    type: string
    sql: ${TABLE}.string_field_3 ;;
  }

  dimension: string_field_4 {
    type: string
    sql: ${TABLE}.string_field_4 ;;
  }

  dimension: string_field_5 {
    type: string
    sql: ${TABLE}.string_field_5 ;;
  }

  dimension: string_field_6 {
    type: string
    sql: ${TABLE}.string_field_6 ;;
  }

  dimension: string_field_7 {
    type: string
    sql: ${TABLE}.string_field_7 ;;
  }

  dimension: string_field_8 {
    type: string
    sql: ${TABLE}.string_field_8 ;;
  }

  dimension: string_field_9 {
    type: string
    sql: ${TABLE}.string_field_9 ;;
  }
  measure: count {
    type: count
  }
}
