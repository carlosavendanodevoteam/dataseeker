# The name of this view in Looker is "Bookings Google Analytics"
view: bookings_google_analytics {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `ga-bigquery-storage.google_analytics_consolidate.BOOKINGS_GOOGLE_ANALYTICS` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Generated" in Explore.

  dimension: generated {
    type: number
    sql: ${TABLE}.Generated ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_generated {
    type: sum
    sql: ${generated} ;;  }
  measure: average_generated {
    type: average
    sql: ${generated} ;;  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotelCode ;;
  }

  dimension: session_campaign {
    type: string
    sql: ${TABLE}.session_campaign ;;
  }

  dimension: session_medium {
    type: string
    sql: ${TABLE}.session_medium ;;
  }

  dimension: session_source {
    type: string
    sql: ${TABLE}.session_source ;;
  }

  dimension: transactions {
    type: number
    sql: ${TABLE}.transactions ;;
  }
  measure: count {
    type: count
  }
}
