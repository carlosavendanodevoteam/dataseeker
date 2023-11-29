# The name of this view in Looker is "Revenue Forecast2"
view: revenue_forecast2 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.REVENUE_FORECAST2` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.date ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Forecast" in Explore.

  dimension: forecast {
    type: number
    sql: ${TABLE}.forecast ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_forecast {
    type: sum
    sql: ${forecast} ;;  }
  measure: average_forecast {
    type: average
    sql: ${forecast} ;;  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }
  measure: count {
    type: count
  }
}
