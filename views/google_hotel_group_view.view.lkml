# The name of this view in Looker is "Google Hotel Group View"
view: google_hotel_group_view {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.GOOGLE_HOTEL_GROUP_VIEW` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "All Conversions Value" in Explore.

  dimension: all_conversions_value {
    type: number
    sql: ${TABLE}.all_conversions_value ;;
  }

  dimension: average_cpc {
    type: number
    sql: ${TABLE}.average_cpc ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: cost_per_all_conversions {
    type: number
    sql: ${TABLE}.cost_per_all_conversions ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cost_per_all_conversions {
    type: sum
    sql: ${cost_per_all_conversions} ;;  }
  measure: average_cost_per_all_conversions {
    type: average
    sql: ${cost_per_all_conversions} ;;  }

  dimension: cross_device_conversions {
    type: number
    sql: ${TABLE}.cross_device_conversions ;;
  }

  dimension: ctr {
    type: number
    sql: ${TABLE}.ctr ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: hotel_eligible_impressions {
    type: number
    sql: ${TABLE}.hotel_eligible_impressions ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension_group: month {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.month ;;
  }

  dimension: search_budget_lost_absolute_top_impression_share {
    type: number
    sql: ${TABLE}.search_budget_lost_absolute_top_impression_share ;;
  }

  dimension: search_budget_lost_top_impression_share {
    type: number
    sql: ${TABLE}.search_budget_lost_top_impression_share ;;
  }

  dimension: search_click_share {
    type: number
    sql: ${TABLE}.search_click_share ;;
  }

  dimension: search_rank_lost_absolute_top_impression_share {
    type: number
    sql: ${TABLE}.search_rank_lost_absolute_top_impression_share ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }
  measure: count {
    type: count
  }
}
