# The name of this view in Looker is "Mview Campaign Data"
view: mview_campaign_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.MVIEW_CAMPAIGN_DATA` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Account ID" in Explore.

  dimension: account_id {
    type: string
    sql: ${TABLE}.accountId ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.accountName ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaignId ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaignName ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
  }

  dimension: conversions_value {
    type: number
    sql: ${TABLE}.conversionsValue ;;
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

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: partition_timestamp {
    type: time
    timeframes: [raw, time, hour,date, week, month, quarter, year]
    sql: ${TABLE}.partitionTimestamp ;;
  }
  measure: count {
    type: count
    drill_fields: [account_name, campaign_name]
  }

  dimension: CURRENCY_format {
    sql: ${hotel_code} ;;
    html: {% if value == 'cancun-bay' %}
      <p style="color: black; background-color: RED; font-size:100%; text-align:center">{{ "MXN" }}</p>
    {% else %}
      <p style="color: black; background-color: white; font-size:100%; text-align:center">{{ "" }}</p>
    {% endif %};;
  }



}
