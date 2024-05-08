# The name of this view in Looker is "Rescue Seeker Log"
view: rescue_seeker_log {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `analysis-seeker.bi_dataset.RESCUE_SEEKER_LOG` ;;

  dimension: auto_save_booking_enabled {
    type: yesno
    sql: ${TABLE}.auto_save_booking_enabled ;;
  }

  dimension: booking_id {
    type: string
    sql: ${TABLE}.booking_id ;;
  }

  dimension: booking_price {
    type: string
    sql: ${TABLE}.booking_price ;;
  }

  dimension: booking_price_float {
    type: number
    sql: ${TABLE}.booking_price_float ;;
  }

  dimension: converted_booking_price {
    type: number
    sql: CASE WHEN ${TABLE}.booking_price IS NOT NULL THEN booking_price ELSE 0 END ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_timestamp ;;
  }

  dimension: date_from {
    type: string
    sql: ${TABLE}.date_from ;;
  }

  dimension: date_to {
    type: string
    sql: ${TABLE}.date_to ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: email_booking_sent {
    type: yesno
    sql: ${TABLE}.email_booking_sent ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: js_imported {
    type: yesno
    sql: ${TABLE}.js_imported ;;
  }

  dimension: manual_save_booking_enabled {
    type: yesno
    sql: ${TABLE}.manual_save_booking_enabled ;;
  }

  dimension: num_adults {
    type: string
    sql: ${TABLE}.num_adults ;;
  }

  dimension: num_babies {
    type: string
    sql: ${TABLE}.num_babies ;;
  }

  dimension: num_kids {
    type: string
    sql: ${TABLE}.num_kids ;;
  }

  dimension: num_rooms {
    type: string
    sql: ${TABLE}.num_rooms ;;
  }

  dimension: popup_enabled {
    type: yesno
    sql: ${TABLE}.popup_enabled ;;
  }

  dimension: rescue_booking_popup_reason {
    type: string
    sql: ${TABLE}.rescue_booking_popup_reason ;;
  }

  dimension: rescue_booking_popup_response {
    type: string
    sql: ${TABLE}.rescue_booking_popup_response ;;
  }

  dimension: rescue_booking_popup_set {
    type: yesno
    sql: ${TABLE}.rescue_booking_popup_set ;;
  }

  dimension: rescue_booking_popup_showed {
    type: yesno
    sql: ${TABLE}.rescue_booking_popup_showed ;;
  }

  dimension: search_id {
    type: string
    sql: ${TABLE}.search_id ;;
  }

  dimension: user {
    type: string
    sql: ${TABLE}.user ;;
  }

  dimension: user_stay_seconds {
    type: string
    sql: ${TABLE}.user_stay_seconds ;;
  }
  measure: count {
    type: count
  }

  dimension: entrada_salida {
    type: string
    sql: CONCAT(${date_from}, ' - ', ${date_to}) ;;
  }

  dimension: ocupacion {
    type: string
    sql: concat(${num_adults}, ' - ', ${num_kids}, ' - ', ${num_babies});;
  }

  dimension: mail_sent {
    type: number
    sql: if(${email_booking_sent} = True, "Enviado", "No Enviado") ;;
  }

  dimension: mail_not_null {
    type: number
    sql: if(${email} is not null, 1, 0) ;;
  }

  dimension: sent_total {
    type: string
    sql: CONCAT(${mail_sent}, '/', ${mail_not_null}) ;;
  }
}
