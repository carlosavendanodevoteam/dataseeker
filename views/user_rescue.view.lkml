# The name of this view in Looker is "User Rescue"
view: user_rescue {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.USER_RESCUE` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Email to Send Rescue" in Explore.

  dimension: email_to_send_rescue {
    type: string
    sql: ${TABLE}.email_to_send_rescue ;;
  }

  dimension: end_date {
    type: string
    sql: ${TABLE}.end_date ;;
  }

  dimension: hotel_name {
    type: string
    sql: ${TABLE}.hotel_name ;;
  }

  dimension: lang {
    type: string
    sql: ${TABLE}.lang ;;
  }

  dimension: last_booking {
    type: string
    sql: ${TABLE}.last_booking ;;
  }

  dimension: namespace {
    type: string
    sql: ${TABLE}.namespace ;;
  }

  dimension: num_adults {
    type: string
    sql: ${TABLE}.num_adults ;;
  }

  dimension: num_kids {
    type: string
    sql: ${TABLE}.num_kids ;;
  }

  dimension: num_rooms {
    type: string
    sql: ${TABLE}.num_rooms ;;
  }

  dimension: phone_email {
    type: string
    sql: ${TABLE}.phone_email ;;
  }

  dimension: polaris_info {
    type: string
    sql: ${TABLE}.polaris_info ;;
  }

  dimension: rate {
    type: string
    sql: ${TABLE}.rate ;;
  }

  dimension: rate_need_login {
    type: string
    sql: ${TABLE}.rate_need_login ;;
  }

  dimension: referer {
    type: string
    sql: ${TABLE}.referer ;;
  }

  dimension: regimen {
    type: string
    sql: ${TABLE}.regimen ;;
  }

  dimension: room1 {
    type: string
    sql: ${TABLE}.room1 ;;
  }

  dimension: send_after {
    type: string
    sql: ${TABLE}.send_after ;;
  }

  dimension: sent_at {
    type: string
    sql: ${TABLE}.sent_at ;;
  }

  dimension: start_date {
    type: string
    sql: ${TABLE}.start_date ;;
  }

  dimension: subject_to_send_rescue {
    type: string
    sql: ${TABLE}.subject_to_send_rescue ;;
  }

  dimension: timestamp {
    type: string
    sql: ${TABLE}.timestamp ;;
  }

  dimension: total_price {
    type: string
    sql: ${TABLE}.total_price ;;
  }
  measure: count {
    type: count
    drill_fields: [hotel_name]
  }
}
