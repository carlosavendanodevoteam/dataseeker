view: derbysoft_data {
  sql_table_name: `analysis-seeker.bi_dataset.DERBYSOFT_DATA` ;;

  dimension: avg_hote_price_diff_raw {
    type: number
    sql: ${TABLE}.avg_hote_price_diff_raw ;;
  }
  dimension: bookings_raw {
    type: number
    sql: ${TABLE}.bookings_raw ;;
  }
  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }
  dimension: chanel {
    type: string
    sql: ${TABLE}.chanel ;;
  }
  dimension: clicks_raw {
    type: number
    sql: ${TABLE}.clicks_raw ;;
  }
  dimension: ctr_raw {
    type: number
    sql: ${TABLE}.CTR_raw ;;
  }
  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }
  dimension: eligible_impressions_raw {
    type: number
    sql: ${TABLE}.eligible_impressions_raw ;;
  }
  dimension: first_position_share_raw {
    type: number
    sql: ${TABLE}.first_position_share_raw ;;
  }
  dimension: hotel_name {
    type: string
    sql: ${TABLE}.hotel_name ;;
  }
  dimension: impression_share_raw {
    type: number
    sql: ${TABLE}.impression_share_raw ;;
  }
  dimension: impressions_raw {
    type: number
    sql: ${TABLE}.impressions_raw ;;
  }
  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }
  dimension: missed_impressions_raw {
    type: number
    sql: ${TABLE}.missed_impressions_raw ;;
  }
  dimension: revenue_raw {
    type: number
    sql: ${TABLE}.revenue_raw ;;
  }
  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.timestamp ;;
  }
  measure: count {
    type: count
    drill_fields: [hotel_name]
  }

  dimension: hotel_code {
    type: string
    sql: Case
          when ${hotel_name} = 'Garza Blanca Cancun' then 'tafer-garza-blanca'
          else Null
        End;;
  }

  dimension: logo {
    sql: ${chanel} ;;
    html: {% if value == 'Tripadvisor' %}
      <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/TripAdvisor_older_Logo.svg/640px-TripAdvisor_older_Logo.svg.png" width="210" height="50">
    {% elsif value == 'Google' %}
          <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/GoogleAds.png/640px-GoogleAds.png" width="300" height="50">
    {% elsif value == 'Trivago' %}
          <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Trivago.svg/640px-Trivago.svg.png" width="200" height="50">
    {% else %}
      <p style="color: black; background-color: white; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %};;
  }


}
