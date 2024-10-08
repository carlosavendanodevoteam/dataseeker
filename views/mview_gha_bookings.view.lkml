# The name of this view in Looker is "Mview Gha Bookings"
view: mview_gha_bookings {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `analysis-seeker.Google_ads_dataset.MVIEW_GHA_BOOKINGS` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

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
    type: number
    sql: ${TABLE}.amendedPrice ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_amended_price {
    type: sum
    sql: ${amended_price} ;;  }
  measure: average_amended_price {
    type: average
    sql: ${amended_price} ;;  }

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
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: cancelation_datetime {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.cancelationDatetime ;;
  }

  dimension: cancellation_reason {
    type: string
    sql: ${TABLE}.cancellation_reason ;;
  }

  dimension: cancellation_timestamp {
    type: string
    sql: ${TABLE}.cancellationTimestamp ;;
  }

  dimension: cancellation_timestamp_date {
    type: string
    sql: ${TABLE}.cancellation_timestamp_date ;;
  }

  dimension: cancellation_timestamp_dayofweek {
    type: number
    sql: ${TABLE}.cancellation_timestamp_dayofweek ;;
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
    type: number
    sql: ${TABLE}.comments ;;
  }

  dimension: converted_commission {
    type: number
    sql: ${TABLE}.converted_commission ;;
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

  dimension: day {
    type: string
    sql: ${TABLE}.day ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: encrypted {
    type: string
    sql: ${TABLE}.encrypted ;;
  }

  dimension: end_date {
    type: string
    sql: ${TABLE}.endDate ;;
  }

  dimension: es_paquete {
    type: yesno
    sql: ${TABLE}.EsPaquete ;;
  }

  dimension: final_discounted_price {
    type: number
    sql: ${TABLE}.final_discounted_price ;;
  }

  dimension: geolocation {
    type: string
    sql: ${TABLE}.geolocation ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: how_meet {
    type: string
    sql: ${TABLE}.how_meet ;;
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
    type: number
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

  dimension: is_hotelverse {
    type: yesno
    sql: ${TABLE}.is_hotelverse ;;
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
    sql: ${TABLE}.LANGUAGE ;;
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

  dimension: nights {
    type: number
    sql: ${TABLE}.nights ;;
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

  dimension: promotions2 {
    type: string
    sql: ${TABLE}.promotions2 ;;
  }

  dimension: promotions3 {
    type: string
    sql: ${TABLE}.promotions3 ;;
  }

  dimension: rate {
    type: string
    sql: ${TABLE}.rate ;;
  }

  dimension: reference_timestamp {
    type: string
    sql: ${TABLE}.referenceTimestamp ;;
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
    sql: ${TABLE}.SOURCE ;;
  }

  dimension: start_date {
    type: string
    sql: ${TABLE}.startDate ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp ;;
  }


  dimension: timestamp_dayofweek {
    type: number
    sql: ${TABLE}.timestamp_dayofweek ;;
  }

  dimension: used_bono {
    type: yesno
    sql: ${TABLE}.used_bono ;;
  }
  measure: count {
    type: count
    drill_fields: [name]
  }

  dimension: revenue {
    type: number
    sql: CASE
          WHEN ${TABLE}.cancelled = True THEN 0
          WHEN ${TABLE}.cancelled = False THEN ${TABLE}.price + COALESCE(${TABLE}.priceSupplements, 0)
        END;;
  }

  dimension_group: start_date_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: cast(${TABLE}.startDate as timestamp);;
  }


 dimension: month {
  type: number
  sql: EXTRACT(month FROM ${TABLE}.timestamp) ;;
}

  dimension: month_startDate_number {
    type: number
    sql: CASE
          WHEN EXTRACT(month FROM ${TABLE}.startDate AS timestamp ) < 10 THEN CONCAT('0', EXTRACT(month FROM ${TABLE}.startDate AS timestamp))
          ELSE EXTRACT(month FROM ${TABLE}.startDate AS timestamp)
        END;;
  }

dimension: month_startDate {
  type: number
  sql: CONCAT( ${year_startDate}, ${month_startDate_number});;
}

dimension: year {
  type: number
  sql: EXTRACT(year FROM ${TABLE}.timestamp) ;;
}

dimension: year_startDate {
  type: number
  sql: EXTRACT(year FROM CAST(${TABLE}.startDate AS timestamp)) ;;
}

dimension: month_text {
  type: string
  sql: CASE
         WHEN ${month} = 1 THEN CONCAT("Enero ", ${year})
         WHEN ${month} = 2 THEN CONCAT("Febrero ", ${year})
         WHEN ${month} = 3 THEN CONCAT("Marzo ", ${year})
         WHEN ${month} = 4 THEN CONCAT("Abril ", ${year})
         WHEN ${month} = 5 THEN CONCAT("Mayo ", ${year})
         WHEN ${month} = 6 THEN CONCAT("Junio ", ${year})
         WHEN ${month} = 7 THEN CONCAT("Julio ", ${year})
         WHEN ${month} = 8 THEN CONCAT("Agosto ", ${year})
         WHEN ${month} = 9 THEN CONCAT("Septiembre ", ${year})
         WHEN ${month} = 10 THEN CONCAT("Octubre ", ${year})
         WHEN ${month} = 11 THEN CONCAT("Noviembre ", ${year})
         ELSE CONCAT("Diciembre ", ${year})
       END ;;
}

dimension: month_text_startDate {
  type: string
  sql: CASE
         WHEN EXTRACT(month FROM CAST(${TABLE}.startDate AS timestamp)) = 1 THEN CONCAT("Enero ", ${year_startDate})
         WHEN EXTRACT(month FROM CAST(${TABLE}.startDate AS timestamp)) = 2 THEN CONCAT("Febrero ", ${year_startDate})
         WHEN EXTRACT(month FROM CAST(${TABLE}.startDate AS timestamp)) = 3 THEN CONCAT("Marzo ", ${year_startDate})
         WHEN EXTRACT(month FROM CAST(${TABLE}.startDate AS timestamp)) = 4 THEN CONCAT("Abril ", ${year_startDate})
         WHEN EXTRACT(month FROM CAST(${TABLE}.startDate AS timestamp)) = 5 THEN CONCAT("Mayo ", ${year_startDate})
         WHEN EXTRACT(month FROM CAST(${TABLE}.startDate AS timestamp)) = 6 THEN CONCAT("Junio ", ${year_startDate})
         WHEN EXTRACT(month FROM CAST(${TABLE}.startDate AS timestamp)) = 7 THEN CONCAT("Julio ", ${year_startDate})
         WHEN EXTRACT(month FROM CAST(${TABLE}.startDate AS timestamp))= 8 THEN CONCAT("Agosto ", ${year_startDate})
         WHEN EXTRACT(month FROM CAST(${TABLE}.startDate AS timestamp)) = 9 THEN CONCAT("Septiembre ", ${year_startDate})
         WHEN EXTRACT(month FROM CAST(${TABLE}.startDate AS timestamp)) = 10 THEN CONCAT("Octubre ", ${year_startDate})
         WHEN EXTRACT(month FROM CAST(${TABLE}.startDate AS timestamp)) = 11 THEN CONCAT("Noviembre ", ${year_startDate})
         ELSE CONCAT("Diciembre ", ${year_startDate})
       END ;;
}


}
