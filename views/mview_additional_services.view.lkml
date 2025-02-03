# The name of this view in Looker is "Mview Additional Services"
view: mview_additional_services {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.VIEW_ADDITIONAL_SERVICES` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Additional Service" in Explore.

  dimension: additional_service {
    type: string
    sql: ${TABLE}.additional_service ;;
  }

  dimension: cancellation_timestamp {
    type: string
    sql: ${TABLE}.cancellationTimestamp ;;
  }

  dimension: cancelled {
    type: yesno
    sql: ${TABLE}.cancelled ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.cantidad ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cantidad {
    type: sum
    sql: ${cantidad} ;;  }
  measure: average_cantidad {
    type: average
    sql: ${cantidad} ;;  }

  dimension: dias {
    type: number
    sql: ${TABLE}.dias ;;
  }

  dimension: end_date {
    type: string
    sql: ${TABLE}.endDate ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: identifier {
    type: string
    sql: ${TABLE}.identifier ;;
  }

  dimension: modification_timestamp {
    type: string
    sql: ${TABLE}.modificationTimestamp ;;
  }

  dimension: normalized_additional_service {
    type: string
    sql: ${TABLE}.normalized_additional_service ;;
  }

  dimension: precio {
    type: number
    sql: ${TABLE}.precio ;;
  }

  dimension: raw_additional_service {
    type: string
    sql: ${TABLE}.raw_additional_service ;;
  }

  dimension: start_date {
    type: string
    sql: ${TABLE}.startDate ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp ;;
  }
  measure: count {
    type: count
  }
}
