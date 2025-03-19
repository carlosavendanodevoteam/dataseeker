view: view_comparation_hotel_ads_cpa {
  sql_table_name: `` ;;


  dimension: all_conversions_from_interactions_rate {
    type: number
    sql: ${TABLE}.all_conversions_from_interactions_rate ;;
  }
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
  dimension: commission_percent {
    type: number
    sql: ${TABLE}.commission_percent ;;
  }
  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
  }
  dimension: conversions_value {
    type: number
    sql: ${TABLE}.conversionsValue ;;
  }
  dimension: copy {
    type: number
    sql: ${TABLE}.copy ;;
  }
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
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
  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }
  dimension: eligible_impressions {
    type: number
    sql: ${TABLE}.eligible_impressions ;;
  }
  dimension_group: hotel_check_in {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.hotel_check_in_date ;;
  }
  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }
  dimension: hotel_date_selection_type {
    type: number
    sql: ${TABLE}.hotel_date_selection_type ;;
  }
  dimension: hotel_price_bucket {
    type: string
    sql: ${TABLE}.hotel_price_bucket ;;
  }
  dimension: hotel_price_difference_percentage {
    type: number
    sql: ${TABLE}.hotel_price_difference_percentage ;;
  }
  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }
  dimension: length_of_stay {
    type: number
    sql: ${TABLE}.length_of_stay ;;
  }
  dimension_group: partition_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.partition_timestamp ;;
  }
  dimension: search_absolute_top_impression_share {
    type: number
    sql: ${TABLE}.search_absolute_top_impression_share ;;
  }
  dimension: search_impression_share {
    type: number
    sql: ${TABLE}.search_impression_share ;;
  }
  dimension: search_rank_lost_absolute_top_impression_share {
    type: string
    sql: ${TABLE}.search_rank_lost_absolute_top_impression_share ;;
  }
  dimension: search_rank_lost_impression_share {
    type: string
    sql: ${TABLE}.search_rank_lost_impression_share ;;
  }
  dimension: search_rank_lost_top_impression_share {
    type: string
    sql: ${TABLE}.search_rank_lost_top_impression_share ;;
  }
  dimension: search_top_impression_share {
    type: number
    sql: ${TABLE}.search_top_impression_share ;;
  }
  measure: count {
    type: count
    drill_fields: [campaign_name]
  }
  # dimension: max_partition_date {
  #   type: date
  #   sql: ${TABLE}.max_partition_date ;;
  # }

  # dimension: min_partition_date {
  #   type: date
  #   sql: ${TABLE}.min_partition_date ;;
  # }

  # dimension_group: comparison_date {
  #   type: time
  #   timeframes: [raw, time, date, week, month, quarter, year]
  #   sql:
  #   CASE
  #     WHEN ${copy} = 0 THEN ${partition_timestamp_date}
  #     ELSE TIMESTAMP_SUB(
  #       TIMESTAMP(${partition_timestamp_date}),
  #       INTERVAL DATE_DIFF(
  #         (SELECT MIN(DATE(partition_timestamp)) FROM `analysis-seeker.Google_ads_dataset.VIEW_COMPARATION_HOTEL_ADS_CPA` WHERE DATE(partition_timestamp) BETWEEN CURRENT_DATE() - INTERVAL 30 DAY AND CURRENT_DATE()),
  #         ${max_partition_date},
  #         DAY
  #       ) DAY
  #     )
  #   END ;;
  #   }

  # filter: dynamic_date_range {
  #   type: date
  #   sql:
  #   CASE
  #     WHEN ${copy} = 0 THEN ${comparison_date_date}
  #     ELSE TIMESTAMP_SUB(${{comparison_date_date}, INTERVAL DATE_DIFF(${max_partition_date}, ${min_partition_date}, DAY) DAY)
  #   END ;;
  # }
}
