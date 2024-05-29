view: mview_comparation_bookings_by_start_date {

  sql_table_name: `bi_dataset.COMPARATION_BOOKINGS_BY_START_DATE` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Account" in Explore.

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

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

  dimension: country {
    type: string
    map_layer_name: countries
    sql: UPPER(${TABLE}.country) ;;
  }

  dimension: credit_card {
    type: string
    sql: ${TABLE}.creditCard ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension_group: day {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}.day AS timestamp) ;;
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

  dimension: goals {
    type: string
    sql: ${TABLE}.goals ;;
  }

  dimension: hotel_city {
    type: string
    sql: ${TABLE}.HotelCity ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: hotel_country {
    type: string
    sql: ${TABLE}.HotelCountry ;;
  }

  dimension: hotel_name {
    type: string
    sql: ${TABLE}.HotelName ;;
  }

  dimension: hotel_state {
    type: string
    sql: ${TABLE}.HotelState ;;
  }

  dimension: hotel_zone {
    type: string
    sql: ${TABLE}.HotelZone ;;
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

  dimension: package_name {
    type: string
    sql: ${TABLE}.PackageName ;;
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

  dimension: percentage_commission {
    type: string
    sql: ${TABLE}.percentage_commission ;;
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

  dimension: promo {
    type: string
    sql: ${TABLE}.Promo ;;
  }

  dimension: promocode {
    type: string
    sql: UPPER(${TABLE}.promocode);;
  }

  dimension: promotions {
    type: string
    sql: ${TABLE}.promotions ;;
  }

  dimension: rate {
    type: string
    sql: ${TABLE}.rate ;;
  }

  dimension: rate_name {
    type: string
    sql: ${TABLE}.RateName ;;
  }

  dimension_group: reference_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}.reference_timestamp AS DATE);;
  }

  dimension: regimen {
    type: string
    sql: ${TABLE}.regimen ;;
  }

  dimension: room {
    type: string
    sql: ${TABLE}.Room ;;
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

  dimension: source_fixed {
    type: string
    sql: ${TABLE}.source_fixed ;;
  }

  dimension: start_date {
    type: string
    sql: ${TABLE}.startDate ;;
  }

  dimension_group: start_datetime {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.startDatetime ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp ;;
  }

  dimension: timestamp_date_bookings_by_start_date {
    type: string
    sql: ${TABLE}.timestamp_date ;;
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

  dimension: timestamp_date_datos_reservas_6 {
    type: string
    sql: ${TABLE}.timestamp_date ;;
  }

  dimension: timestamp_dayofweek {
    type: number
    sql: ${TABLE}.timestamp_dayofweek ;;
  }

  dimension: antelation {
    type: number
    sql: date_diff(cast(${TABLE}.startDate as timestamp), cast(${TABLE}.timestamp as timestamp), day) ;;
  }

  dimension: used_bono {
    type: yesno
    sql: ${TABLE}.used_bono ;;
  }

  measure: num_reservas {
    type:  count
    drill_fields: [identifier]
  }
  measure: count {
    type:  count
    drill_fields: [identifier]
  }

  dimension: occupation {
    type: string
    sql: concat(${TABLE}.adults1, '-', ${TABLE}.kids1, '-', ${TABLE}.babies1) ;;
  }

  dimension: month_startDate{
    type: number
    sql:  EXTRACT(month FROM cast(${TABLE}.startDate as timestamp)) ;;
  }

  dimension: year_startDate{
    type: number
    sql:  EXTRACT(YEAR FROM cast(${TABLE}.startDate as timestamp)) ;;
  }

  dimension: month_text_startDate {
    type: string
    sql: Case
        when ${month_startDate} = 1 then "Jan"
        when ${month_startDate} = 2 then "Feb"
        when ${month_startDate} = 3 then "Mar"
        when ${month_startDate} = 4 then "Apr"
        when ${month_startDate} = 5 then "May"
        when ${month_startDate} = 6 then "Jun"
        when ${month_startDate} = 7 then "Jul"
        when ${month_startDate} = 8 then "Aug"
        when ${month_startDate} = 9 then "Sep"
        when ${month_startDate} = 10 then "Oct"
        when ${month_startDate} = 11 then "Nov"
        else "Dec"
      End;;
  }

  dimension: month{
    type: number
    sql:  EXTRACT(month FROM ${TABLE}.partitionTimestamp) ;;
  }
  dimension: month_text {
    type: string
    sql: Case
          when ${month} = 1 then "Jan"
          when ${month} = 2 then "Feb"
          when ${month} = 3 then "Mar"
          when ${month} = 4 then "Apr"
          when ${month} = 5 then "May"
          when ${month} = 6 then "Jun"
          when ${month} = 7 then "Jul"
          when ${month} = 8 then "Aug"
          when ${month} = 9 then "Sep"
          when ${month} = 10 then "Oct"
          when ${month} = 11 then "Nov"
          else "Dec"
        End;;
  }

  dimension_group: partition_timestamp{
    type: time
    sql: ${TABLE}.partitionTimestamp;;
    timeframes: [raw, time, date, week, month_name, month, quarter, year]
  }

  dimension_group: comparation_endDate{
    type: time
    sql:  CASE
        WHEN TIMESTAMP_ADD(${TABLE}.endDate, INTERVAL 365 DAY) > CURRENT_TIMESTAMP() THEN NULL
        ELSE TIMESTAMP_ADD(${TABLE}.endDate, INTERVAL 365 DAY)
      END ;;
  }

  dimension_group: comparation_cancellationTimestamp{
    type: time
    sql:  CASE
        WHEN TIMESTAMP_ADD(${TABLE}.cancellationTimestamp, INTERVAL 365 DAY) > CURRENT_TIMESTAMP() THEN NULL
        ELSE TIMESTAMP_ADD(${TABLE}.cancellationTimestamp, INTERVAL 365 DAY)
      END ;;
  }

  dimension: last_year_booking {
    type: number
    sql: ${TABLE}.last_year_booking ;;
  }

  dimension_group: comparation_referenceTimestamp{
    type: time
    sql: IF(${TABLE}.last_year_booking = 0, CAST(${TABLE}.day AS timestamp) ,
      CASE
        WHEN TIMESTAMP_ADD(CAST(${TABLE}.day AS timestamp), INTERVAL 365 DAY) > CURRENT_TIMESTAMP() THEN NULL
        ELSE TIMESTAMP_ADD(CAST(${TABLE}.day AS timestamp), INTERVAL 365 DAY)
      END );;
    timeframes: [raw, time, date, week, month, quarter, year]
  }

  dimension: advance{
    type: number
    sql: date_diff(cast(${TABLE}.startDate as timestamp), cast(${TABLE}.timestamp as timestamp), day) ;;
  }

  dimension_group:comparation_startDatetime{
    type: time
    sql: IF(${TABLE}.last_year_booking = 0, ${TABLE}.partitionTimestamp,
      CASE
        WHEN TIMESTAMP_ADD(${TABLE}.partitionTimestamp, INTERVAL 365 DAY) > CURRENT_TIMESTAMP() THEN NULL
        ELSE TIMESTAMP_ADD(${TABLE}.partitionTimestamp , INTERVAL 365 DAY)
      END );;
    timeframes: [raw, time, date, week, month, quarter, year]
  }

  dimension_group:comparation_startDatetime_with_future{
    type: time
    sql: IF(${TABLE}.last_year_booking = 0, ${TABLE}.partitionTimestamp,
      TIMESTAMP_ADD(${TABLE}.partitionTimestamp , INTERVAL 365 DAY));;
    timeframes: [raw, time, date, week, month, month_name, quarter, year]
  }

  dimension: rateName_fixed {
    type: string
    sql:Case
          when UPPER(${rate_name}) like '% TRADE%' then 'Trade Area'
          when UPPER(${rate_name}) like 'FLEXIBLE%' then 'Flexible'
          when UPPER(${rate_name}) like '%REEMBOLSABLE%' then 'non refundable'
          when UPPER(${rate_name}) like '%PAGO DIRECTO EN%' or UPPER(${rate_name}) like '%aga directamente en %' then 'direct payment at the hotel'
          else 'Other'
        End;;
  }

  dimension: filter_ring2_travel_agent {
    type: string
    sql: Case
          when ${agent} like 'agente%' and ${agent} not like '%-nau%' and ${agent} not like '%landmar%' and ${agent} not like '%oasis%' and ${agent} not like '%qhotels%' and ${agent} not like '%_ona' and ${source_fixed} like '%Callcenter%' THEN 'True'
          else 'False'
        End;;
  }

  dimension: full_country {
    # Nueva dimensión para los nombres completos de los países
    type: string
    sql: CASE
              WHEN ${country} = 'ES' THEN ' Spain'
              WHEN ${country} = 'CN' THEN 'China'
              WHEN ${country} = 'TR' THEN 'Turkey'
              WHEN ${country} = 'SH' THEN 'Saint Helena'
              WHEN ${country} = 'TL' THEN 'East Timor'
              WHEN ${country} = 'VG' THEN 'British Virgin Islands'
              WHEN ${country} = 'TT' THEN 'Trinidad and Tobago'
              WHEN ${country} = 'KH' THEN 'Cambodia'
              WHEN ${country} = 'RE' THEN 'Reunion Island'
              WHEN ${country} = 'SK' THEN 'Slovakia'
              WHEN ${country} = 'BH' THEN 'Bahrain'
              WHEN ${country} = 'GT' THEN 'Guatemala'
              WHEN ${country} = 'FJ' THEN 'Fiji'
              WHEN ${country} = 'NZ' THEN 'New Zealand'
              WHEN ${country} = 'TC' THEN 'Turks and Caicos Islands'
              WHEN ${country} = 'FO' THEN 'Faroe Islands'
              WHEN ${country} = 'JE' THEN 'Jersey'
              WHEN ${country} = 'KZ' THEN 'Kazakhstan'
              WHEN ${country} = 'TO' THEN 'Tonga'
              WHEN ${country} = 'TV' THEN 'Tuvalu'
              WHEN ${country} = 'KE' THEN 'Kenya'
              WHEN ${country} = 'UM' THEN 'United States Minor Outlying Islands'
              WHEN ${country} = 'BR' THEN 'Brasil'
              WHEN ${country} = 'IR' THEN 'Irán'
              WHEN ${country} = 'AF' THEN 'Afghanistan'
              WHEN ${country} = 'EC' THEN 'Ecuador'
              WHEN ${country} = 'CY' THEN 'Cyprus'
              WHEN ${country} = 'SZ' THEN 'Eswatini'
              WHEN ${country} = 'FI' THEN 'Finland'
              WHEN ${country} = 'GN' THEN 'Guinea'
              WHEN ${country} = 'GY' THEN 'Guyana'
              WHEN ${country} = 'MF' THEN 'Saint Martin'
              WHEN ${country} = 'SI' THEN 'Slovenia'
              WHEN ${country} = 'AO' THEN 'Angola'
              WHEN ${country} = 'PW' THEN 'Palau'
              WHEN ${country} = 'DO' THEN 'República Dominicana'
              WHEN ${country} = 'TM' THEN 'Turkmenistán'
              WHEN ${country} = 'TN' THEN 'Tunisia'
              WHEN ${country} = 'UG' THEN 'Uganda'
              WHEN ${country} = 'BD' THEN 'Bangladesh'
              WHEN ${country} = 'FR' THEN 'France'
              WHEN ${country} = 'CZ' THEN 'República Checa'
              WHEN ${country} = 'ST' THEN 'São Tomé and Príncipe'
              WHEN ${country} = 'OM' THEN 'Omán'
              WHEN ${country} = 'ZW' THEN 'Zimbabwe'
              WHEN ${country} = 'PF' THEN 'French Polynesia'
              WHEN ${country} = 'A1' THEN 'Anonymous Proxy'
              WHEN ${country} = 'LY' THEN 'Libia'
              WHEN ${country} = 'BM' THEN 'Bermudas'
              WHEN ${country} = 'TJ' THEN 'Tajikistan'
              WHEN ${country} = 'PT' THEN 'Portugal'
              WHEN ${country} = 'CA' THEN 'Canadá'
              WHEN ${country} = 'MC' THEN 'Mónaco'
              WHEN ${country} = 'UZ' THEN 'Uzbekistán'
              WHEN ${country} = 'SR' THEN 'Surinam'
              WHEN ${country} = 'GB' THEN 'United Kingdom'
              WHEN ${country} = 'EG' THEN 'Egipto'
              WHEN ${country} = 'PM' THEN 'Saint Pierre and Miquelon'
              WHEN ${country} = 'VN' THEN 'Vietnam'
              WHEN ${country} = 'SG' THEN 'Singapore'
              WHEN ${country} = 'SJ' THEN 'Svalbard and Jan Mayen'
              WHEN ${country} = 'AQ' THEN 'Antarctica'
              WHEN ${country} = 'IS' THEN 'Iceland'
              WHEN ${country} = 'GL' THEN 'Greenland'
              WHEN ${country} = 'YT' THEN 'Mayotte'
              WHEN ${country} = 'NL' THEN 'Netherlands'
              WHEN ${country} = 'US' THEN 'United States'
              WHEN ${country} = 'CH' THEN 'Switzerland'
              WHEN ${country} = 'MZ' THEN 'Mozambique'
              WHEN ${country} = 'KR' THEN 'South Korea'
              WHEN ${country} = 'MD' THEN 'Moldova'
              WHEN ${country} = 'TZ' THEN 'Tanzania'
              WHEN ${country} = 'FM' THEN 'Micronesia'
              WHEN ${country} = 'RW' THEN 'Rwanda'
              WHEN ${country} = 'UY' THEN 'Uruguay'
              WHEN ${country} = 'BZ' THEN 'Belize'
              WHEN ${country} = 'LT' THEN 'Lithuania'
              WHEN ${country} = 'DJ' THEN 'Djibouti'
              WHEN ${country} = 'CC' THEN 'Cocos Islands'
              WHEN ${country} = 'ZA' THEN 'South Africa'
              WHEN ${country} = 'DE' THEN 'Germany'
              WHEN ${country} = 'GE' THEN 'Georgia'
              WHEN ${country} = 'AR' THEN 'Argentina'
              WHEN ${country} = 'TD' THEN 'Chad'
              WHEN ${country} = 'PT' THEN 'Portugal'
              WHEN ${country} = 'CU' THEN 'Cuba'
              WHEN ${country} = 'CG' THEN 'Congo'
              WHEN ${country} = 'BA' THEN 'Bosnia and Herzegovina'
              WHEN ${country} = 'US' THEN 'United States'
              WHEN ${country} = 'BJ' THEN 'Benin'
              WHEN ${country} = 'HK' THEN 'Hong Kong'
              WHEN ${country} = 'HM' THEN 'Heard Island and McDonald Islands'
              WHEN ${country} = 'GI' THEN 'Gibraltar'
              WHEN ${country} = 'MG' THEN 'Madagascar'
              WHEN ${country} = 'FR' THEN 'France'
              WHEN ${country} = 'MQ' THEN 'Martinique'
              WHEN ${country} = 'MA' THEN 'Morocco'
              WHEN ${country} = 'AU' THEN 'Australia'
              WHEN ${country} = 'BS' THEN 'Bahamas'
              WHEN ${country} = 'LC' THEN 'Saint Lucia'
              WHEN ${country} = 'SV' THEN 'El Salvador'
              WHEN ${country} = 'CV' THEN 'Cabo Verde'
              WHEN ${country} = 'KG' THEN 'Kyrgyzstan'
              WHEN ${country} = 'ML' THEN 'Mali'
              WHEN ${country} = 'MV' THEN 'Maldives'
              WHEN ${country} = 'BI' THEN 'Burundi'
              WHEN ${country} = 'KP' THEN 'North Korea'
              WHEN ${country} = 'GF' THEN 'French Guiana'
              WHEN ${country} = 'DK' THEN 'Denmark'
              WHEN ${country} = 'GD' THEN 'Grenada'
              WHEN ${country} = 'CF' THEN 'Central African Republic'
              WHEN ${country} = 'JM' THEN 'Jamaica'
              WHEN ${country} = 'PR' THEN 'Puerto Rico'
              WHEN ${country} = 'PY' THEN 'Paraguay'
              WHEN ${country} = 'CK' THEN 'Cook Islands'
              WHEN ${country} = 'CI' THEN 'Ivory Coast'
              WHEN ${country} = 'ME' THEN 'Montenegro'
              WHEN ${country} = 'PT' THEN 'Portugal'
              WHEN ${country} = 'JP' THEN 'Japan'
              WHEN ${country} = 'MU' THEN 'Mauritius'
              WHEN ${country} = 'IQ' THEN 'Iraq'
              WHEN ${country} = 'BE' THEN 'Belgium'
              WHEN ${country} = 'NO' THEN 'Norway'
              WHEN ${country} = 'SC' THEN 'Seychelles'
              WHEN ${country} = 'GQ' THEN 'Equatorial Guinea'
              WHEN ${country} = 'AL' THEN 'Albania'
              WHEN ${country} = 'MK' THEN 'North Macedonia'
              WHEN ${country} = 'YE' THEN 'Yemen'
              WHEN ${country} = 'GA' THEN 'Gabon'
              WHEN ${country} = 'LB' THEN 'Lebanon'
              WHEN ${country} = 'MR' THEN 'Mauritania'
              WHEN ${country} = 'SM' THEN 'San Marino'
              WHEN ${country} = 'VA' THEN 'Vatican City'
              WHEN ${country} = 'SA' THEN 'Saudi Arabia'
              WHEN ${country} = 'AN' THEN 'Netherlands Antilles'
              WHEN ${country} = 'CX' THEN 'Christmas Island'
              WHEN ${country} = 'KY' THEN 'Cayman Islands'
              WHEN ${country} = 'SE' THEN 'Sweden'
              WHEN ${country} = 'TW' THEN 'Taiwan'
              WHEN ${country} = 'NI' THEN 'Nicaragua'
              WHEN ${country} = 'UA' THEN 'Ukraine'
              WHEN ${country} = 'CA' THEN 'Canada'
              WHEN ${country} = 'ER' THEN 'Eritrea'
              WHEN ${country} = 'CW' THEN 'Curaçao'
              WHEN ${country} = 'BW' THEN 'Botswana'
              WHEN ${country} = 'GH' THEN 'Ghana'
              WHEN ${country} = 'AD' THEN 'Andorra'
              WHEN ${country} = 'MO' THEN 'Macao'
              WHEN ${country} = 'IE' THEN 'Ireland'
              WHEN ${country} = 'IT' THEN 'Italy'
              WHEN ${country} = 'PA' THEN 'Panama'
              WHEN ${country} = 'PN' THEN 'Pitcairn'
              WHEN ${country} = 'IM' THEN 'Isle of Man'
              WHEN ${country} = 'MY' THEN 'Malaysia'
              WHEN ${country} = 'MN' THEN 'Mongolia'
              WHEN ${country} = 'GP' THEN 'Guadeloupe'
              WHEN ${country} = 'LR' THEN 'Liberia'
              WHEN ${country} = 'P' THEN 'Pakistan'
              WHEN ${country} = 'MX' THEN 'Mexico'
              WHEN ${country} = 'NP' THEN 'Nepal'
              WHEN ${country} = 'ES' THEN 'Spain'
              WHEN ${country} = 'ET' THEN 'Ethiopia'
              WHEN ${country} = 'CS' THEN 'Serbia and Montenegro'
              WHEN ${country} = 'BF' THEN 'Burkina Faso'
              WHEN ${country} = 'AS' THEN 'American Samoa'
              WHEN ${country} = 'VI' THEN 'U.S. Virgin Islands'
              WHEN ${country} = 'AT' THEN 'Austria'
              WHEN ${country} = 'MT' THEN 'Malta'
              WHEN ${country} = 'SO' THEN 'Somalia'
              WHEN ${country} = 'RO' THEN 'Romania'
              WHEN ${country} = 'KW' THEN 'Kuwait'
              WHEN ${country} = 'VE' THEN 'Venezuela'
              WHEN ${country} = 'CM' THEN 'Cameroon'
              WHEN ${country} = 'MH' THEN 'Marshall Islands'
              WHEN ${country} = 'AP' THEN 'Hong Kong SAR China'
              WHEN ${country} = 'BO' THEN 'Bolivia'
              WHEN ${country} = 'EH' THEN 'Western Sahara'
              WHEN ${country} = 'NR' THEN 'Nauru'
              WHEN ${country} = 'MM' THEN 'Myanmar'
              WHEN ${country} = 'BG' THEN 'Bulgaria'
              WHEN ${country} = 'VU' THEN 'Vanuatu'
              WHEN ${country} = 'EE' THEN 'Estonia'
              WHEN ${country} = 'AI' THEN 'Anguilla'
              WHEN ${country} = 'SX' THEN 'Sint Maarten'
              WHEN ${country} = 'FR' THEN 'France'
              WHEN ${country} = 'AM' THEN 'Armenia'
              WHEN ${country} = 'AZ' THEN 'Azerbaijan'
              WHEN ${country} = 'PH' THEN 'Philippines'
              WHEN ${country} = 'HR' THEN 'Croatia'
              WHEN ${country} = 'LU' THEN 'Luxembourg'
              WHEN ${country} = 'NG' THEN 'Nigeria'
              WHEN ${country} = 'KM' THEN 'Comoros'
              WHEN ${country} = 'LK' THEN 'Sri Lanka'
              WHEN ${country} = 'DK' THEN 'Denmark'
              WHEN ${country} = 'LV' THEN 'Latvia'
              WHEN ${country} = 'CO' THEN 'Colombia'
              WHEN ${country} = 'RU' THEN 'Russia'
              WHEN ${country} = 'RS' THEN 'Serbia'
              WHEN ${country} = 'ZM' THEN 'Zambia'
              WHEN ${country} = 'KI' THEN 'Kiribati'
              WHEN ${country} = 'AG' THEN 'Antigua and Barbuda'
              WHEN ${country} = 'CL' THEN 'Chile'
              WHEN ${country} = 'ID' THEN 'Indonesia'
              WHEN ${country} = 'MS' THEN 'Montserrat'
              WHEN ${country} = 'MW' THEN 'Malawi'
              WHEN ${country} = 'IN' THEN 'India'
              WHEN ${country} = 'PE' THEN 'Peru'
              WHEN ${country} = 'DZ' THEN 'Algeria'
              WHEN ${country} = 'NA' THEN 'Namibia'
              WHEN ${country} = 'BN' THEN 'Brunei'
              WHEN ${country} = 'CD' THEN 'Democratic Republic of the Congo'
              WHEN ${country} = 'MX' THEN 'Mexico'
              WHEN ${country} = 'AE' THEN 'United Arab Emirates'
              WHEN ${country} = 'BY' THEN 'Belarus'
              WHEN ${country} = 'DM' THEN 'Dominica'
              WHEN ${country} = 'SY' THEN 'Syria'
              WHEN ${country} = 'EU' THEN 'European Union'
              WHEN ${country} = 'GU' THEN 'Guam'
              WHEN ${country} = 'QA' THEN 'Qatar'
              WHEN ${country} = 'BB' THEN 'Barbados'
              WHEN ${country} = 'SB' THEN 'Solomon Islands'
              WHEN ${country} = 'GR' THEN 'Greece'
              WHEN ${country} = 'JO' THEN 'Jordan'
              WHEN ${country} = 'FK' THEN 'Falkland Islands'
              WHEN ${country} = 'AW' THEN 'Aruba'
              WHEN ${country} = 'LI' THEN 'Liechtenstein'
              WHEN ${country} = 'NE' THEN 'Niger'
              WHEN ${country} = 'GS' THEN 'South Georgia and the South Sandwich Islands'
              WHEN ${country} = 'VC' THEN 'Saint Vincent and the Grenadines'
              WHEN ${country} = 'GG' THEN 'Guernsey'
              WHEN ${country} = 'DE' THEN 'Germany'
              WHEN ${country} = 'GW' THEN 'Guinea-Bissau'
              WHEN ${country} = 'SN' THEN 'Senegal'
              WHEN ${country} = 'NC' THEN 'New Caledonia'
              WHEN ${country} = 'HT' THEN 'Haiti'
              WHEN ${country} = 'PG' THEN 'Papua New Guinea'
              WHEN ${country} = 'BT' THEN 'Bhutan'
              WHEN ${country} = 'SD' THEN 'Sudan'
              WHEN ${country} = 'CR' THEN 'Costa Rica'
              WHEN ${country} = 'NL' THEN 'Netherlands'
              WHEN ${country} = 'WS' THEN 'Samoa'
              WHEN ${country} = 'AX' THEN 'Åland Islands'
              WHEN ${country} = 'TG' THEN 'Togo'
              WHEN ${country} = 'GM' THEN 'Gambia'
              WHEN ${country} = 'IL' THEN 'Israel'
              WHEN ${country} = 'NF' THEN 'Norfolk Island'
              WHEN ${country} = 'LS' THEN 'Lesotho'
              WHEN ${country} = 'PL' THEN 'Poland'
              WHEN ${country} = 'SL' THEN 'Sierra Leone'
              WHEN ${country} = 'AF' THEN 'Afghanistan'
              WHEN ${country} = 'HU' THEN 'Hungary'
              WHEN ${country} = 'KN' THEN 'Saint Kitts and Nevis'
              WHEN ${country} = 'LA' THEN 'Laos'
              WHEN ${country} = 'WF' THEN 'Wallis and Futuna'
              WHEN ${country} = 'HN' THEN 'Honduras'
              WHEN ${country} = 'TH' THEN 'Thailand'
              WHEN ${country} = 'PS' THEN 'Palestinian Territories'
              WHEN ${country} = 'MP' THEN 'Northern Mariana Islands'
              ELSE ${country}
            END ;;
  }

}
