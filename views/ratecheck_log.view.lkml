# The name of this view in Looker is "Ratecheck Log"
view: ratecheck_log {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `analysis-seeker.bi_dataset.RATECHECK_LOG` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Booking ID" in Explore.

  dimension: booking_id {
    type: string
    sql: ${TABLE}.booking_id ;;
  }

  dimension: booking_matcher_popup_clicked {
    type: yesno
    sql: ${TABLE}.booking_matcher_popup_clicked ;;
  }

  dimension: booking_matcher_popup_displayed {
    type: yesno
    sql: ${TABLE}.booking_matcher_popup_displayed ;;
  }

  dimension: booking_matcher_popup_reason_not_displayed {
    type: string
    sql: ${TABLE}.booking_matcher_popup_reason_not_displayed ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_timestamp ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: hotel_lower_price {
    type: string
    sql: ${TABLE}.hotel_lower_price ;;
  }

  dimension: hotel_lower_price_screenshot {
    type: string
    sql: ${TABLE}.hotel_lower_price_screenshot ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: ota_lower {
    type: string
    sql: ${TABLE}.ota_lower ;;
  }

  dimension: ota_lower_price {
    type: string
    sql: ${TABLE}.ota_lower_price ;;
  }

  dimension: parity_maker_displayed {
    type: string
    sql: ${TABLE}.parity_maker_displayed ;;
  }

  dimension: price_seeker_adults {
    type: string
    sql: ${TABLE}.price_seeker_adults ;;
  }

  dimension: price_seeker_date_from {
    type: string
    sql: ${TABLE}.price_seeker_date_from ;;
  }

  dimension: price_seeker_date_to {
    type: string
    sql: ${TABLE}.price_seeker_date_to ;;
  }

  dimension: price_seeker_kids {
    type: string
    sql: ${TABLE}.price_seeker_kids ;;
  }

  dimension: price_seeker_search_has_results {
    type: string
    sql: ${TABLE}.price_seeker_search_has_results ;;
  }

  dimension: price_seeker_search_id {
    type: string
    sql: ${TABLE}.price_seeker_search_id ;;
  }

  dimension: search_id {
    type: string
    sql: ${TABLE}.search_id ;;
  }

  dimension: user {
    type: string
    sql: ${TABLE}.user ;;
  }
  measure: count {
    type: count
  }
}
