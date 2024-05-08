# The name of this view in Looker is "Mview Users"
view: mview_users {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `analysis-seeker.club_dataset_EU.MVIEW_USERS` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Address" in Explore.

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: birthday {
    type: string
    sql: ${TABLE}.birthday ;;
  }

  dimension: childs_number {
    type: string
    sql: ${TABLE}.childs_number ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: civil_status {
    type: string
    sql: ${TABLE}.civil_status ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension: dni {
    type: string
    sql: ${TABLE}.dni ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: extra_info {
    type: string
    sql: ${TABLE}.extraInfo ;;
  }

  dimension: fakebirthday {
    type: string
    sql: ${TABLE}.fakebirthday ;;
  }

  dimension: favourite_destiny {
    type: string
    sql: ${TABLE}.favourite_destiny ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: holiday_mate {
    type: string
    sql: ${TABLE}.holiday_mate ;;
  }

  dimension: holiday_time {
    type: string
    sql: ${TABLE}.holiday_time ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: hotels {
    type: string
    sql: ${TABLE}.hotels ;;
  }

  dimension: idmember {
    type: number
    sql: ${TABLE}.idmember ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_idmember {
    type: sum
    sql: ${idmember} ;;  }
  measure: average_idmember {
    type: average
    sql: ${idmember} ;;  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: insertion_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.insertion_timestamp ;;
  }

  dimension: job {
    type: string
    sql: ${TABLE}.job ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: loyalty_level {
    type: string
    sql: ${TABLE}.loyalty_level ;;
  }

  dimension: modification_timestamp {
    type: string
    sql: ${TABLE}.modification_timestamp ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: pais {
    type: string
    sql: ${TABLE}.pais ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: province {
    type: string
    sql: ${TABLE}.province ;;
  }

  dimension: referal {
    type: string
    sql: ${TABLE}.referal ;;
  }

  dimension: reservations_count {
    type: number
    sql: ${TABLE}.reservations_count ;;
  }

  dimension: row_num {
    type: number
    sql: ${TABLE}.row_num ;;
  }

  dimension: social_login {
    type: yesno
    sql: ${TABLE}.social_login ;;
  }

  dimension: surname {
    type: string
    sql: ${TABLE}.surname ;;
  }

  dimension: telephone {
    type: string
    sql: ${TABLE}.telephone ;;
  }

  dimension: timestamp {
    type: string
    sql: ${TABLE}.timestamp ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.timestamp_date ;;
  }

  dimension: timestamp_day {
    type: string
    sql: ${TABLE}.timestamp_day ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }
  measure: count {
    type: count
    drill_fields: [surname, name, username]
  }
}
