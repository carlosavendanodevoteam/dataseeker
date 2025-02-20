view: social_ads_campaign_data {

    # The sql_table_name parameter indicates the underlying database table
    # to be used for all fields in this view.
    sql_table_name: `Meta_ads_dataset.CAMPAIGN_DATA` ;;

    # No primary key is defined for this view. In order to join this view in an Explore,
    # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Account ID" in Explore.

    dimension: campaign_id {
      type: string
      sql: ${TABLE}.campaignId ;;
    }

    dimension: campaign_name {
      type: string
      sql: ${TABLE}.campaignName ;;
    }

    dimension: account_id {
      type: string
      sql: ${TABLE}.accountId ;;
    }

    dimension: account_name {
      type: string
      sql: ${TABLE}.accountName ;;
    }

    dimension: cost {
      type: number
      sql: ${TABLE}.cost ;;
    }


    dimension: conversions {
      type: number
      sql: ${TABLE}.conversions ;;
    }

    dimension: conversions_value {
      type: number
      sql: ${TABLE}.conversionsValue ;;
    }

    dimension: impressions {
      type: number
      sql: ${TABLE}.impressions ;;
    }


    dimension: clicks {
      type: number
      sql: ${TABLE}.clicks ;;
    }

    dimension: ctr {
      type: number
      sql: ${TABLE}.ctr ;;
    }

    dimension: average_cpc {
      type: number
      sql: ${TABLE}.averageCpc ;;
    }


    dimension: status {
      type: string
      sql: ${TABLE}.status ;;
    }

    dimension: country {
      type: string
      sql: ${TABLE}.string ;;
    }



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








}
