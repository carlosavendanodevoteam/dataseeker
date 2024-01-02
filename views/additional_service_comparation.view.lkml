# The name of this view in Looker is "Mview Comparation Bookings"
view: additional_service_comparation {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.MVIEW_COMPARATION_BOOKINGS` ;;

  dimension: additional_services {
    type: string
    sql: ${TABLE}.additionalServices ;;
  }

  dimension: board {
    type: string
    sql: ${TABLE}.Board ;;
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


  dimension: cancelled {
    type: yesno
    sql: ${TABLE}.cancelled ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: day {
    type: string
    sql: ${TABLE}.day ;;
  }

  dimension: hotel_code {
    primary_key: yes
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: identifier {
    type: string
    sql: ${TABLE}.identifier ;;
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

  dimension: promo {
    type: string
    sql: ${TABLE}.Promo ;;
  }

  dimension: reference_timestamp {
    type: string
    sql: ${TABLE}.referenceTimestamp ;;
  }

  dimension_group: partition_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.partitionTimestamp;;
  }

  dimension: room {
    type: string
    sql: ${TABLE}.Room ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: source_fixed {
    type: string
    sql: CASE
          WHEN ${TABLE}.source_fixed like '%Callcenter%' then 'Callcenter'
          ELSE ${TABLE}.source_fixed
        END ;;
  }

  dimension: start_date {
    type: date
    sql: ${TABLE}.startDate ;;
  }

  dimension_group: start_date_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: cast(${TABLE}.startDate as timestamp);;
  }

  dimension: revenue {
    type: number
    sql: CASE
          WHEN ${TABLE}.cancelled = True THEN 0
          WHEN ${TABLE}.cancelled = False THEN ${TABLE}.price + COALESCE(${TABLE}.priceSupplements, 0)
        END;;
  }

  dimension: rn {
    type: number
    sql: CASE
          WHEN ${TABLE}.cancelled = True THEN 0
          WHEN ${TABLE}.cancelled = False THEN ${TABLE}.nights * CAST(${TABLE}.numRooms as INTEGER)
        END;;
  }

  dimension: ADR {
    type: number
    sql: ${revenue} / ${rn} ;;
  }

  dimension: rn_cancelled {
    type: number
    sql: CASE
          WHEN ${TABLE}.cancelled = False THEN 0
          WHEN ${TABLE}.cancelled = True THEN ${TABLE}.nights * CAST(${TABLE}.numRooms as INTEGER)
        END;;
  }

  dimension: cancellation {
    type: number
    sql: CASE
        WHEN ${TABLE}.cancelled = False THEN 0
        WHEN ${TABLE}.cancelled = True THEN ${TABLE}.price + COALESCE(${TABLE}.priceSupplements, 0)
      END;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp ;;
  }

  dimension: timestamp_date_datos_reservas_6 {
    type: string
    sql: ${TABLE}.timestamp_date ;;
  }

  dimension: timestamp_dayofweek {
    type: number
    sql: ${TABLE}.timestamp_dayofweek ;;
  }

  measure: num_reservas {
    type:  count
    drill_fields: [identifier]
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: partition_string {
    type: string
    sql: ${TABLE}.partitionTimestamp;;
  }

  dimension_group: comparation_startDate{
    type: time
    sql: CASE WHEN ${TABLE}.last_year_booking = 0 THEN CAST(${TABLE}.startDate AS timestamp) ELSE TIMESTAMP_ADD(CAST(${TABLE}.startDate AS timestamp), INTERVAL 365 DAY) END;;
    timeframes: [raw, time, date, week, month, month_name, quarter, year]
  }

  dimension_group: comparation_endDate{
    type: time
    sql: CASE WHEN ${TABLE}.last_year_booking = 0 THEN CAST(${TABLE}.endDate AS timestamp) ELSE TIMESTAMP_ADD(CAST(${TABLE}.endDate AS timestamp), INTERVAL 365 DAY) END;;
    timeframes: [raw, time, date, week, month, quarter, year]
  }

  dimension_group: comparation_cancellationTimestamp{
    type: time
    sql: CASE WHEN ${TABLE}.last_year_booking = 0 THEN CAST(${TABLE}.cancellationTimestamp AS timestamp) ELSE TIMESTAMP_ADD(CAST(${TABLE}.cancellationTimestamp AS timestamp), INTERVAL 365 DAY) END;;
    timeframes: [raw, time, date, week, month, quarter, year]
  }

  dimension_group: comparation_partitiontimestamp_without_future{
    type: time
    sql: IF(${TABLE}.last_year_booking = 0, ${TABLE}.partitionTimestamp,
      CASE
        WHEN CAST(${TABLE}.partitionTimestamp AS timestamp) > CURRENT_TIMESTAMP() THEN NULL
        ELSE CAST(${TABLE}.partitionTimestamp AS timestamp)
      END);;
    timeframes: [raw, time, date, week, month, quarter, year]
  }

  dimension: last_year_booking {
    type: number
    sql: ${TABLE}.last_year_booking ;;
  }
}
