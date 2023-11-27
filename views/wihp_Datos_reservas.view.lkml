view: wihp_datos_reservas {
# The name of this view in Looker is "Wi Hp Unique"
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.WI_HP_UNIQUE` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Ads Type" in Explore.

  dimension: ads_type {
    type: string
    sql: ${TABLE}.ads_type ;;
  }

  dimension: avgpos {
    type: number
    sql: ${TABLE}.avgpos ;;
  }

  dimension: bookingcount {
    type: number
    sql: ${TABLE}.bookingcount ;;
  }

  dimension: checkinday {
    type: string
    sql: ${TABLE}.checkinday ;;
  }

  dimension: checkinday_name {
    type: string
    sql: ${TABLE}.checkinday_name ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: conversion {
    type: number
    sql: ${TABLE}.conversion ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_conversion {
    type: sum
    sql: ${conversion} ;;  }
  measure: average_conversion {
    type: average
    sql: ${conversion} ;;  }

  dimension: cpc {
    type: number
    sql: ${TABLE}.cpc ;;
  }

  dimension: ctr {
    type: number
    sql: ${TABLE}.ctr ;;
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

  dimension: date_type_id {
    type: string
    sql: ${TABLE}.date_type_id ;;
  }

  dimension: date_type_name {
    type: string
    sql: ${TABLE}.date_type_name ;;
  }

  dimension: day {
    type: string
    sql: ${TABLE}.day ;;
  }

  dimension: day_to_arrival_id {
    type: string
    sql: ${TABLE}.day_to_arrival_id ;;
  }

  dimension: day_to_arrival_name {
    type: string
    sql: ${TABLE}.day_to_arrival_name ;;
  }

  dimension: device_id {
    type: string
    sql: ${TABLE}.device_id ;;
  }

  dimension: device_name {
    type: string
    sql: ${TABLE}.device_name ;;
  }

  dimension: elig_impr_gha {
    type: number
    sql: ${TABLE}.elig_impr_gha ;;
  }

  dimension: generated {
    type: number
    sql: ${TABLE}.generated ;;
  }

  dimension: hotel_average_lead_value_micros_rate {
    type: number
    sql: ${TABLE}.hotel_average_lead_value_micros_rate ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: hotel_id {
    type: number
    sql: ${TABLE}.hotel_id ;;
  }

  dimension: hotel_name {
    type: string
    sql: ${TABLE}.hotel_name ;;
  }

  dimension: hotel_price_difference_percentage_rate {
    type: number
    sql: ${TABLE}.hotel_price_difference_percentage_rate ;;
  }

  dimension: impr {
    type: number
    sql: ${TABLE}.impr ;;
  }

  dimension: impr_share_gha {
    type: number
    sql: ${TABLE}.impr_share_gha ;;
  }

  dimension: los {
    type: string
    sql: ${TABLE}.los ;;
  }

  dimension: los_name {
    type: string
    sql: ${TABLE}.los_name ;;
  }

  dimension: market_id {
    type: string
    sql: ${TABLE}.market_id ;;
  }

  dimension: market_name {
    type: string
    sql: ${TABLE}.market_name ;;
  }

  dimension: meta {
    type: string
    sql: ${TABLE}.meta ;;
  }

  dimension: missed_impr_gha {
    type: number
    sql: ${TABLE}.missed_impr_gha ;;
  }

  dimension: price_competitiveness_id {
    type: string
    sql: ${TABLE}.price_competitiveness_id ;;
  }

  dimension: price_competitiveness_name {
    type: string
    sql: ${TABLE}.price_competitiveness_name ;;
  }

  dimension: report {
    type: string
    sql: ${TABLE}.report ;;
  }

  dimension: revenue_perclick {
    type: number
    sql: ${TABLE}.revenue_perclick ;;
  }

  dimension: roi {
    type: number
    sql: ${TABLE}.roi ;;
  }

  dimension: search_absolute_top_impression_share {
    type: number
    sql: ${TABLE}.search_absolute_top_impression_share ;;
  }

  dimension: search_budget_lost_absolute_top_impression_share_rate {
    type: number
    sql: ${TABLE}.search_budget_lost_absolute_top_impression_share_rate ;;
  }

  dimension: search_budget_lost_impression_share_rate {
    type: number
    sql: ${TABLE}.search_budget_lost_impression_share_rate ;;
  }

  dimension: search_budget_lost_top_impression_share_rate {
    type: number
    sql: ${TABLE}.search_budget_lost_top_impression_share_rate ;;
  }

  dimension: search_rank_lost_absolute_top_impression_share {
    type: number
    sql: ${TABLE}.search_rank_lost_absolute_top_impression_share ;;
  }

  dimension: search_rank_lost_impression_share {
    type: number
    sql: ${TABLE}.search_rank_lost_impression_share ;;
  }

  dimension: search_rank_lost_top_impression_share_rate {
    type: number
    sql: ${TABLE}.search_rank_lost_top_impression_share_rate ;;
  }

  dimension: search_top_impression_share_rate {
    type: number
    sql: ${TABLE}.search_top_impression_share_rate ;;
  }

  dimension: spent {
    type: number
    sql: ${TABLE}.spent ;;
  }

  dimension: ts {
    type: string
    sql: ${TABLE}.ts ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: CPA {
    type: number
    sql: ${TABLE}.generated /${TABLE}.spent ;;
  }

  dimension: hotel_code_group_filter {
    type: string
    sql: CASE
          WHEN ${TABLE}.hotel_code IN ("em-serenade-punta-cana", "parkroyal-grancancun", "parkroyal-cozumel",
            "parkroyal-vallarta", "parkroyal-acapulco", "parkroyal-beachcancun",
            "parkroyal-huatulco", "parkroyal-ixtapa", "parkroyal-mazatlan",
            "parkroyal-buenosaires", "parkroyal-loscabos", "parkroyal-puertorico",
            "parkroyal-miami", "parkroyal-orlando", "parkroyal-villascancun",
            "port-alicante", "port-azafata", "port-benidorm", "port-denia", "port-elche",
            "port-europa", "port-feria", "port-fiesta", "port-huerto", "port-jardin",
            "port-vista", "fuerte-marbella", "fuerte-rompido", "fuerte-grazalema",
            "fuerte-conil-costaluz", "olee-calaceite", "olee-torrox", "amare-marbella",
            "amare-ibiza", "marsol-hotel", "marsol-blau", "marsol-condado", "marsol-encantada", "best-serenade") THEN 'David'
          WHEN ${TABLE}.hotel_code IN ("casa-romana-boutique", "casual-mar-malaga", "casual-rinascimiento-florencia",
            "casual-duende", "casual-olas-sansebastian", "casual-vintage-valencia",
            "casual-socarrat", "casual-teatro-madrid", "casual-artes-valencia",
            "casual-pop-art", "casual-letras-sevilla", "casual-don-juan-tenorio",
            "casual-cine-valencia", "estival-centurion", "estival-eldorado",
            "estival-torrequebrada", "estival-vilamari", "isla-cristina", "ocean-islantilla",
            "estival-club", "estival-pineda", "estival-park-2", "estival-park-3",
            "oasishoteles-grandcancun", "oasishoteles-grandpalm", "oasishoteles-oasispalm",
            "oasishoteles-pyramid", "oasishoteles-senscancun", "el-patio", "ipv-palace",
            "villa-flamenca", "maria-del-mar", "summum-ventas", "zero-drach", "summum-rosellon",
            "oasishoteles-grandcancun","oasishoteles-grandpalm","oasishoteles-tulum","oasishoteles-oasispalm",
            "oasishoteles-ohurban","oasishoteles-smart","oasishoteles-pyramid","oasishoteles-senscancun","oasishoteles-senstulum") THEN 'Dani'
          WHEN ${TABLE}.hotel_code IN ("stein-chateau-eza", "blaumar-blaumar", "impressive-granada",
            "impressive-premium", "impressive-puntacana", "impressive-zocos",
            "landmar-gigantes", "landmar-arena") THEN 'Sandra'
          ELSE ${TABLE}.hotel_code
        END ;;
    }

  measure: cpa {
    type: number
    sql: CASE WHEN sum(wi_hp_unique.generated) = 0 THEN NULL ELSE SUM(wi_hp_unique.spent) / sum(wi_hp_unique.generated) END;;
    value_format: "0.00%"
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      price_competitiveness_name,
      day_to_arrival_name,
      device_name,
      los_name,
      checkinday_name,
      date_type_name,
      market_name,
      hotel_name,
      hotel_code]
  }

}
