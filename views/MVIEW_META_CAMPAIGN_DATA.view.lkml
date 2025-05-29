# The name of this view in Looker is "Mview Meta Campaign Data"
view: mview_meta_campaign_data {
  sql_table_name: analysis-seeker.Meta_ads_dataset.MVIEW_META_CAMPAIGN_DATA ;;

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

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.Conversions ;;
  }

  dimension: conversions_value {
    type: number
    sql: ${TABLE}.ConversionsValue ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.Cost ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.Clicks ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.Impressions ;;
  }

  measure: total_cost {
    type: sum
    sql: ${cost} ;;
  }

  measure: average_cost {
    type: average
    sql: ${cost} ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension_group: partition_timestamp {
    type: time
    timeframes: [raw, time, hour, date, week, month, quarter, year]
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

  dimension: PRUEBA_IFRAME {
    sql: ${hotel_code} ;;
    html:
      <iframe src="https://www.w3schools.com/html/tryit.asp?filename=tryhtml_default" width="100%" height="500"></iframe>
  ;;
  }
}
