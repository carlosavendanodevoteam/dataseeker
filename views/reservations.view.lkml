# The name of this view in Looker is "Reservations"
view: reservations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.RESERVATIONS` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: _partitiondate {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONDATE ;;
  }

  dimension_group: _partitiontime {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONTIME ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Additional Services" in Explore.

  dimension: additional_services {
    type: string
    sql: ${TABLE}.additionalServices ;;
  }

  dimension: adults1 {
    type: number
    sql: ${TABLE}.adults1 ;;
  }

  dimension: adults2 {
    type: number
    sql: ${TABLE}.adults2 ;;
  }

  dimension: adults3 {
    type: number
    sql: ${TABLE}.adults3 ;;
  }

  dimension: agent {
    type: string
    sql: ${TABLE}.agent ;;
  }

  dimension: amended_price {
    type: string
    sql: ${TABLE}.amendedPrice ;;
  }

  dimension: babies1 {
    type: number
    sql: ${TABLE}.babies1 ;;
  }

  dimension: babies2 {
    type: number
    sql: ${TABLE}.babies2 ;;
  }

  dimension: babies3 {
    type: number
    sql: ${TABLE}.babies3 ;;
  }

  dimension: birthday {
    type: string
    sql: ${TABLE}.birthday ;;
  }

  dimension: bono_gift_used {
    type: string
    sql: ${TABLE}.bono_gift_used ;;
  }

  dimension: booking_currency {
    type: string
    sql: ${TABLE}.booking_currency ;;
  }

  dimension: cancellation_reason {
    type: string
    sql: ${TABLE}.cancellation_reason ;;
  }

  dimension: cancellation_timestamp {
    type: string
    sql: ${TABLE}.cancellationTimestamp ;;
  }

  dimension: cancelled {
    type: yesno
    sql: ${TABLE}.cancelled ;;
  }

  dimension: club_member_id {
    type: string
    sql: ${TABLE}.club_member_id ;;
  }

  dimension: comission {
    type: number
    sql: ${TABLE}.comission ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: credit_card {
    type: string
    sql: ${TABLE}.creditCard ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: encrypted {
    type: string
    sql: ${TABLE}.encrypted ;;
  }

  dimension: end_date {
    type: string
    sql: ${TABLE}.endDate ;;
  }

  dimension: final_discounted_price {
    type: number
    sql: ${TABLE}.final_discounted_price ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_final_discounted_price {
    type: sum
    sql: ${final_discounted_price} ;;  }
  measure: average_final_discounted_price {
    type: average
    sql: ${final_discounted_price} ;;  }

  dimension: geolocation {
    type: string
    sql: ${TABLE}.geolocation ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: identifier {
    type: string
    sql: ${TABLE}.identifier ;;
  }

  dimension: incidents {
    type: string
    sql: ${TABLE}.incidents ;;
  }

  dimension: invalid_credit_card {
    type: string
    sql: ${TABLE}.invalidCreditCard ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: ip_geo_city {
    type: string
    sql: ${TABLE}.ip_geo_city ;;
  }

  dimension: ip_geo_latlon {
    type: string
    sql: ${TABLE}.ip_geo_latlon ;;
  }

  dimension: is_club_member {
    type: yesno
    sql: ${TABLE}.is_club_member ;;
  }

  dimension: kids1 {
    type: number
    sql: ${TABLE}.kids1 ;;
  }

  dimension: kids2 {
    type: number
    sql: ${TABLE}.kids2 ;;
  }

  dimension: kids3 {
    type: number
    sql: ${TABLE}.kids3 ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: local_resident {
    type: yesno
    sql: ${TABLE}.local_resident ;;
  }

  dimension: media {
    type: string
    sql: ${TABLE}.media ;;
  }

  dimension: modification_timestamp {
    type: string
    sql: ${TABLE}.modificationTimestamp ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: num_rooms {
    type: string
    sql: ${TABLE}.numRooms ;;
  }

  dimension: original_price_before_discount {
    type: number
    sql: ${TABLE}.original_price_before_discount ;;
  }

  dimension: parity_maker {
    type: yesno
    sql: ${TABLE}.parity_maker ;;
  }

  dimension: partner {
    type: string
    sql: ${TABLE}.partner ;;
  }

  dimension: payment_method {
    type: string
    sql: ${TABLE}.payment_method ;;
  }

  dimension: pm_discount {
    type: number
    sql: ${TABLE}.pm_discount ;;
  }

  dimension: pm_original_price {
    type: number
    sql: ${TABLE}.pm_original_price ;;
  }

  dimension: pm_ota_price {
    type: number
    sql: ${TABLE}.pm_ota_price ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: price_in_booking_currency {
    type: number
    sql: ${TABLE}.price_in_booking_currency ;;
  }

  dimension: price_increase {
    type: string
    sql: ${TABLE}.priceIncrease ;;
  }

  dimension: price_supplements {
    type: number
    sql: ${TABLE}.priceSupplements ;;
  }

  dimension: price_supplements_in_booking_currency {
    type: number
    sql: ${TABLE}.priceSupplements_in_booking_currency ;;
  }

  dimension: promocode {
    type: string
    sql: ${TABLE}.promocode ;;
  }

  dimension: promotions {
    type: string
    sql: ${TABLE}.promotions ;;
  }

  dimension: rate {
    type: string
    sql: ${TABLE}.rate ;;
  }

  dimension: regimen {
    type: string
    sql: ${TABLE}.regimen ;;
  }

  dimension: room_type1 {
    type: string
    sql: ${TABLE}.roomType1 ;;
  }

  dimension: room_type2 {
    type: string
    sql: ${TABLE}.roomType2 ;;
  }

  dimension: room_type3 {
    type: string
    sql: ${TABLE}.roomType3 ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: start_date {
    type: string
    sql: ${TABLE}.startDate ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp ;;
  }

  dimension: used_bono {
    type: yesno
    sql: ${TABLE}.used_bono ;;
  }
  measure: count {
    type: count
    drill_fields: [name]
  }
}
