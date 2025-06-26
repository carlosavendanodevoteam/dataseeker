view: view_comparation_hotel_ads_cpa {
  sql_table_name: `Google_ads_dataset.VIEW_COMPARATION_HOTEL_ADS_CPA` ;;


  dimension: all_conversions_from_interactions_rate {
    type: number
    sql: ${TABLE}.all_conversions_from_interactions_rate ;;
  }
  dimension: copy {
    type: number
    sql: ${TABLE}.copy ;;
  }

  measure: metrica_copy {
    type: number
    sql: ${TABLE}.copy ;;
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

  measure: conversions_value_real {
    type: number
    sql: if(${copy}=0, sum(${conversions_value}), 0) ;;
  }

  measure: conversions_value_copy {
    type: number
    sql: if(${copy}=1, sum(${conversions_value}), 0) ;;
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
  measure: min_partition_date {
    type: min
    sql: ${partition_timestamp_date} ;;
  }

  measure: max_partition_date {
    type: max
    sql: ${partition_timestamp_date} ;;
  }

  dimension: fecha_final {
    type: date
    sql:
    CASE
      WHEN ${copy} = 0 THEN ${partition_timestamp_date}
      ELSE DATE_ADD(${partition_timestamp_date}, INTERVAL -7 DAY)

    END ;;
  }

  # filter: dynamic_date_range {
  #   type: date
  #   sql:
  #   CASE
  #     WHEN ${copy} = 0 THEN ${comparison_date_date}
  #     ELSE TIMESTAMP_SUB(${{comparison_date_date}, INTERVAL DATE_DIFF(${max_partition_date}, ${min_partition_date}, DAY) DAY)
  #   END ;;
  # }
}
