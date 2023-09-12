# The name of this view in Looker is "Google Ads per Country"
view: google_ads_per_country {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.GOOGLE_ADS_PER_COUNTRY` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Average Cost" in Explore.

  dimension: average_cost {
    type: number
    sql: ${TABLE}.average_cost ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_average_cost {
    type: sum
    sql: ${average_cost} ;;  }
  measure: average_average_cost {
    type: average
    sql: ${average_cost} ;;  }

  dimension: average_cpc {
    type: number
    sql: ${TABLE}.average_cpc ;;
  }

  dimension: average_cpm {
    type: number
    sql: ${TABLE}.average_cpm ;;
  }

  dimension: average_cpv {
    type: number
    sql: ${TABLE}.average_cpv ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
  }

  dimension: conversions_value {
    type: number
    sql: ${TABLE}.conversions_value ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: cost_per_conversion {
    type: number
    sql: ${TABLE}.cost_per_conversion ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: location_type {
    type: string
    sql: ${TABLE}.location_type ;;
  }
  measure: count {
    type: count
  }
}
