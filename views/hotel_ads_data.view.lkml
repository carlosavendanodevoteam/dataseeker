# The name of this view in Looker is "Hotel Ads Data"
view: hotel_ads_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `Google_ads_dataset.HOTEL_ADS_DATA` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Average Cpc" in Explore.

  dimension: average_cpc {
    type: number
    sql: ${TABLE}.average_cpc ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: campaign_type {
    type: string
    sql: ${TABLE}.campaign_type ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
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
    sql: ${cost} ;;  }
  measure: average_cost {
    type: average
    sql: ${cost} ;;  }

  dimension: ctr {
    type: number
    sql: ${TABLE}.ctr ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: conversionsValue {
    type: number
    sql: ${TABLE}.conversionsValue ;;
  }

  dimension: eligible_impressions {
    type: number
    sql: ${TABLE}.eligible_impressions ;;
  }

  dimension: cost_percent{
    type: number
    sql: Case
          when ${campaign_name} like '3%' then 3
          when ${campaign_name} like '4%' then 4
          when ${campaign_name} like '5%' then 5
          when ${campaign_name} like '6%' then 6
          when ${campaign_name} like '7%' then 7
          when ${campaign_name} like '8%' then 8
          when ${campaign_name} like '9%' then 9
          when ${campaign_name} like '10%' then 10
          when ${campaign_name} like '11%' then 11
          when ${campaign_name} like '12%' then 12
          when ${campaign_name} like '13%' then 13
          when ${campaign_name} like '14%' then 14
          when ${campaign_name} like '15%' then 15
          when ${campaign_name} like '16%' then 16
          when ${campaign_name} like '17%' then 17
          when ${campaign_name} like '18%' then 18
          when ${campaign_name} like '19%' then 19
          when ${campaign_name} like '20%' then 20
          when ${campaign_name} like '1%' then 1
          when ${campaign_name} like '2%' then 2
          else 0
        End;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: partition_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.partition_timestamp ;;
  }
  measure: count {
    type: count
    drill_fields: [campaign_name]
  }

}
