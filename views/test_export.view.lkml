# The name of this view in Looker is "Test Export"
view: test_export {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.TEST_EXPORT` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "A O" in Explore.

  dimension: a__o {
    type: number
    sql: ${TABLE}.A__o ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_a__o {
    type: sum
    sql: ${a__o} ;;  }
  measure: average_a__o {
    type: average
    sql: ${a__o} ;;  }

  dimension: comisi__n {
    type: number
    sql: ${TABLE}.Comisi__n ;;
  }

  dimension: hotel {
    type: string
    sql: ${TABLE}.Hotel ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.Hotel_code ;;
  }

  dimension: mes {
    type: number
    sql: ${TABLE}.Mes ;;
  }
  measure: count {
    type: count
  }
}
