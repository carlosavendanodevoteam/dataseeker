# The name of this view in Looker is "Mview Parkroyal All Marketing"
view: mview_parkroyal_all_marketing {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `analysis-seeker.bi_dataset.MVIEW_PARKROYAL_ALL_MARKETING` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Bookings" in Explore.

  dimension: bookings {
    type: number
    sql: ${TABLE}.Bookings ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cost {
    type: sum
    sql: ${cost} ;;
  }

  measure: average_cost {
    type: average
    sql: ${cost} ;;
  }

  dimension: generated {
    type: number
    sql: ${TABLE}.generated ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: partition_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.partitionTimestamp ;;
  }

  dimension: report {
    type: string
    sql: ${TABLE}.report ;;
  }
  measure: count {
    type: count
  }

  dimension: report_fixed {
    type: string
    sql: Case
          when ${report} = 'google' or ${report} = 'google_fbl' or ${report} = 'google_promoted' or ${report} = 'Google_Ads' then 'Google_Ads'
          else 'Social_ads'
        End;;
  }

}
