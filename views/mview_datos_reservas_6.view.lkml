# The name of this view in Looker is "Mview Datos Reservas 6"
view: mview_datos_reservas_6 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.MVIEW_DATOS_RESERVAS_6` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Account" in Explore.

  dimension: account {
    type: string
    sql: ${TABLE}.account
    ;;
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

  dimension: upper_board{
    type: string
    sql:upper(${board}) ;;
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
    sql: CASE
          WHEN ${TABLE}.cancellation_reason = '' OR ${TABLE}.cancellation_reason is null Then ''
          ELSE ${TABLE}.cancellation_reason
        End;;
  }

  dimension: cancellation_reason_grouped {
    type: string
    sql: CASE
      WHEN ${cancellation_reason} = 'No viajaré' THEN 'I will not be traveling'
      WHEN ${cancellation_reason} = 'He hecho otra reserva con algún cambio' THEN 'I have made another booking with a modification'
      WHEN ${cancellation_reason} = 'I have made another reservation with some changes' THEN 'I have made another booking with a modification'
      WHEN ${cancellation_reason} = 'No podré viajar por motivos personales' THEN 'I will not be able to travel for personal reasons'
      WHEN ${cancellation_reason} = 'Voy a reservar otro hotel' THEN 'I will book another hotel'
      WHEN ${cancellation_reason} = 'motivos personales' THEN 'I will not be able to travel for personal reasons'
      WHEN ${cancellation_reason} = 'Otros' THEN 'Other'
      WHEN ${cancellation_reason} = 'No podré viajar por motivos laborales' THEN 'I will not be able to travel for work reasons'
      WHEN ${cancellation_reason} = 'POR MOTIVOS PERSONALES' THEN 'I will not be able to travel for personal reasons'
      WHEN ${cancellation_reason} = 'Voy a viajar a otro destino' THEN 'I will travel to another destination'
      WHEN ${cancellation_reason} = 'He encontrado un precio más barato para su hotel' THEN 'I have found a cheaper price for your hotel'
      WHEN ${cancellation_reason} = 'Hice otras reservas y quiero anular las que no necesito' THEN 'I´ve made other reservations and I want to cancel the ones I don´t need'
      WHEN ${cancellation_reason} = 'Je ne pourrai pas voyager pour des raisons professionnelles' THEN 'I will not be able to travel for work reasons'
      WHEN ${cancellation_reason} = 'Je vais voyager vers une autre destination' THEN 'I will travel to another destination'
      ELSE ${cancellation_reason}
    END ;;
  }

  dimension: filter_ring2_travel_agent {
    type: string
    sql: Case
          when ${agent} like 'agente%' and ${agent} not like '%-nau%' and ${agent} not like '%landmar%' and ${agent} not like '%oasis%' and ${agent} not like '%qhotels%' and ${agent} not like '%_ona' and ${source_fixed} like '%Callcenter%' THEN 'True'
          else 'False'
        End;;
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

  dimension: day {
    type: string
    sql: ${TABLE}.day ;;
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
    primary_key: yes
    type: string
    sql: LOWER(${TABLE}.hotel_code) ;;
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
    type: number
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
      sql: case
          when ${TABLE}.Promo IS NULL THEN '-'
          When ${TABLE}.Promo = '' then '-'
          when ${TABLE}.Promo LIKE 'WINTER 2024-202%' then 'INVIERNO 2024-2025'
          else ${TABLE}.Promo
        end
        ;;
    }

    dimension: promo2 {
      type: string
      sql: case
          when ${TABLE}.Promo2 IS NULL THEN '-'
          When ${TABLE}.Promo2 = '' then '-'
          when ${TABLE}.Promo2 LIKE 'WINTER 2024-202%' then 'INVIERNO 2024-2025'
          else ${TABLE}.Promo2
        end
        ;;
    }

    dimension: promo3 {
      type: string
      sql: case
          when ${TABLE}.Promo3 IS NULL THEN '-'
          When ${TABLE}.Promo3 = '' then '-'
          when ${TABLE}.Promo3 LIKE 'WINTER 2024-202%' then 'INVIERNO 2024-2025'
          else ${TABLE}.Promo3
        end
        ;;
    }

    dimension: promos {
      type: string
      sql: CONCAT(${promo},  ',', ${promo2}, ',', ${promo3}) ;;
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

  dimension: rate_name {
    type: string
    sql: ${TABLE}.RateName ;;
  }

  dimension: reference_timestamp {
    type: string
    sql: ${TABLE}.referenceTimestamp ;;
  }

  dimension_group: partition_timestamp {
    type: time
    timeframes: [raw, time, hour, date, week, month, quarter, year]
    sql: ${TABLE}.partitionTimestamp;;
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

  dimension: rateName_fixed {
    type: string
    sql:Case
          when ${rate_name} like '%lexible%' then 'Flexible'
          when ${rate_name} like '%eembolsable%' then 'non refundable'
          when ${rate_name} like '%ago directo en%' or ${rate_name} like '%aga directamente en %' then 'direct payment at the hotel'
          else 'Other'
        End;;
  }

  dimension_group: real_timestamp_ {
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

  dimension: used_bono {
    type: yesno
    sql: ${TABLE}.used_bono ;;
  }

  measure: count {
    type: count
    drill_fields: [hotel_name, rate_name, name, package_name]
  }

  measure: num_reservas {
    type:  count
    drill_fields: [identifier]
  }

  dimension: occupation {
    type: string
    sql: concat(${TABLE}.adults1, "-", ${TABLE}.kids1, "-", ${TABLE}.babies1) ;;
  }

  dimension: advance{
    type: number
    sql: date_diff(cast(${TABLE}.startDate as timestamp), cast(${TABLE}.timestamp as timestamp), day) ;;
  }

  dimension: hotel_code_by_account {
    type: string
    sql: CASE
          WHEN ${TABLE}.hotel_code IN ("em-serenade-punta-cana", "parkroyal-grancancun", "parkroyal-cozumel",
            "parkroyal-vallarta", "parkroyal-acapulco", "parkroyal-beachcancun",
            "parkroyal-huatulco", "parkroyal-ixtapa", "parkroyal-mazatlan",
            "parkroyal-buenosaires", "parkroyal-loscabos", "parkroyal-puertorico",
            "parkroyal-miami", "parkroyal-orlando", "parkroyal-villascancun",
            "port-alicante", "port-azafata", "port-benidorm", "port-denia", "port-elche",
            "port-europa", "port-feria", "port-fiesta", "port-huerto", "port-jardin",
            "port-vista", "fuerte-marbella", "fuerte-rompido", "fuerte-grazalema",
            "fuerte-conil-costaluz", "olee-calaceite", "olee-torrox", "amare-marbella",
            "amare-ibiza", "marsol-hotel", "marsol-blau", "marsol-condado", "marsol-encantada")
          THEN 'David'
          WHEN ${TABLE}.hotel_code IN ("casa-romana-boutique", "casual-mar-malaga", "casual-rinascimiento-florencia",
            "casual-duende", "casual-olas-sansebastian", "casual-vintage-valencia",
            "casual-socarrat", "casual-teatro-madrid", "casual-artes-valencia",
            "casual-pop-art", "casual-letras-sevilla", "casual-don-juan-tenorio",
            "casual-cine-valencia", "estival-centurion", "estival-eldorado",
            "estival-torrequebrada", "estival-vilamari", "isla-cristina", "ocean-islantilla",
            "estival-club", "estival-pineda", "estival-park-2", "estival-park-3",
            "oasishoteles-grandcancun", "oasishoteles-grandpalm", "oasishoteles-oasispalm",
            "oasishoteles-pyramid", "oasishoteles-senscancun", "el-patio", "ipv-palace",
            "villa-flamenca", "maria-del-mar", "summum-ventas", "zero-drach", "summum-rosellon")
          THEN 'Dani'
          WHEN ${TABLE}.hotel_code IN ("stein-chateau-eza", "blaumar-blaumar", "impressive-granada",
            "impressive-premium", "imressive-puntacana", "impressive-zocos",
            "landmar-gigantes", "landmar-arena")
          THEN 'Sandra'
          ELSE null
        END ;;
  }

  dimension: month{
    type: number
    sql:  EXTRACT(month FROM ${TABLE}.partitionTimestamp) ;;
  }

  dimension: month_startDate{
    type: number
    sql:  EXTRACT(month FROM cast(${TABLE}.startDate as timestamp)) ;;
  }

  dimension: year{
    type: number
    sql:  EXTRACT(YEAR FROM ${TABLE}.partitionTimestamp) ;;
  }

  dimension: year_startDate{
    type: number
    sql:  EXTRACT(YEAR FROM cast(${TABLE}.startDate as timestamp)) ;;
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

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: partition_string {
    type: string
    sql: ${TABLE}.partitionTimestamp;;
  }

  dimension_group: comparation_partitiontimestamp{
    type: time
    sql: CASE
          WHEN TIMESTAMP_ADD(${TABLE}.partitionTimestamp, INTERVAL 365 DAY) > CURRENT_TIMESTAMP() THEN NULL
          ELSE TIMESTAMP_ADD(${TABLE}.partitionTimestamp, INTERVAL 365 DAY)
        END ;;
    timeframes: [raw, time, date, week, month, quarter, year]
  }

  dimension_group: comparation_startDate{
    type: time
    sql: CASE
          WHEN TIMESTAMP_ADD(CAST(${TABLE}.startDate AS timestamp), INTERVAL 365 DAY) > CURRENT_TIMESTAMP() THEN NULL
          ELSE TIMESTAMP_ADD(CAST(${TABLE}.startDate AS timestamp), INTERVAL 365 DAY)
        END ;;
    timeframes: [raw, time, date, week, month, month_name, quarter, year]
  }

  dimension_group: comparation_endDate{
    type: time
    sql:  CASE
          WHEN TIMESTAMP_ADD(CAST(${TABLE}.endDate AS timestamp), INTERVAL 365 DAY) > CURRENT_TIMESTAMP() THEN NULL
          ELSE TIMESTAMP_ADD(CAST(${TABLE}.endDate AS timestamp), INTERVAL 365 DAY)
        END ;;
  }

  dimension_group: comparation_cancellationTimestamp{
    type: time
    sql:  CASE
          WHEN TIMESTAMP_ADD(${TABLE}.cancellationTimestamp, INTERVAL 365 DAY) > CURRENT_TIMESTAMP() THEN NULL
          ELSE TIMESTAMP_ADD(${TABLE}.cancellationTimestamp, INTERVAL 365 DAY)
        END ;;
  }

  dimension_group: comparation_partitiontimestamp_and_future{
    type: time
    sql: TIMESTAMP_ADD(${TABLE}.partitionTimestamp, INTERVAL 365 DAY);;
    timeframes: [raw, time, date, week, month, quarter, year]
  }

  dimension_group: comparation_startDate_and_future{
    type: time
    sql: TIMESTAMP_ADD(CAST(${TABLE}.startDate AS timestamp), INTERVAL 365 DAY);;
    timeframes: [raw, time, date, week, month, quarter, year]
  }

  dimension_group: comparation_endDate_and_future{
    type: time
    sql: TIMESTAMP_ADD(CAST(${TABLE}.endDate AS timestamp), INTERVAL 365 DAY);;
  }

  dimension_group: comparation_cancellationTimestamp_and_future{
    type: time
    sql:  TIMESTAMP_ADD(${TABLE}.cancellationTimestamp, INTERVAL 365 DAY);;
  }

  dimension: source_grouped {
    type: string
    sql: CASE
          WHEN ${TABLE}.agent LIKE '%agente%' AND ${TABLE}.source_fixed LIKE '%Callcenter%' THEN 'Ring2travel'
          WHEN ${TABLE}.agent NOT LIKE '%agente%' AND ${TABLE}.source_fixed LIKE '%Callcenter%' THEN 'Callseeker'
          ELSE 'WEB'
        END ;;
  }

  dimension: full_country {
    # Nueva dimensión para los nombres completos de los países
    type: string
    sql: CASE
      WHEN ${country} = 'ES' THEN 'Spain'
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
      WHEN ${country} = 'BR' THEN 'Brazil'
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
      WHEN ${country} = 'CA' THEN 'Canada'
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

  dimension: isSUMMUM {
    type: yesno
    sql: if(${hotel_code} in ('summum-zurbaran','summum-ratxo', 'summum-poblado-suites', 'summum-virrey-finca', 'summum-rosellon', 'summum-ventas', 'summum-joan-miro', 'villa-nazules'), TRUE, FALSE)  ;;
  }

  dimension: summum_ratename {
    type: string
    sql: CASE
          WHEN (${rate_name} = 'Tarifa Flexible Club | Cancelación Gratuita' OR ${rate_name} = 'Tarifa Flexible Club | Pago directo en el hotel' or ${rate_name} = 'Tarifa Flexible | Pago directo en el hotel' or ${rate_name} = 'Tarifa Flexible - Cancelación Gratuita') and ${isSUMMUM} = True then 'Tarifa Flexible Club || Cancelación Gratuita'
          WHEN (${rate_name} = 'No reembolsable | Una modificación gratis' OR ${rate_name} = 'No reembolsable Club || Una modificación' OR ${rate_name} = 'No reembolsable || Una modificación' or ${rate_name} = 'Tarifa No Reembolsable Club | Una Modificación' OR ${rate_name} = 'No reembolsable Club | Una modificación gratis' or ${rate_name} = 'No reembolsable Club | Una modificación gratis') and ${isSUMMUM} = True then 'No reembolsable || Una modificación'
          else ${TABLE}.rateName
        end;;
  }

  dimension: trend_last_7_days {
    type: yesno
    sql: ${TABLE}.partitionTimestamp BETWEEN TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 8 DAY) AND CURRENT_TIMESTAMP() ;;
  }

  dimension: trend_last_14_days {
    type: yesno
    sql: ${TABLE}.partitionTimestamp BETWEEN TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 15 DAY) AND CURRENT_TIMESTAMP() ;;
  }
  dimension: timestamp_converted {
    type: date
    sql: PARSE_TIMESTAMP('%Y-%m-%d', ${TABLE}.timestamp_date) ;;
  }

  dimension: week_string_booking {
    type: string
    sql: CAST(EXTRACT(WEEK FROM DATE_TRUNC(${real_timestamp__date}, WEEK(MONDAY))) +1 AS STRING) ;;
  }
  dimension: week_number_booking {
    type:  number
    sql: ${week_string_booking};;
  }

  dimension: week_string_cxl {
    type: string
    sql: CAST(EXTRACT(WEEK FROM DATE_TRUNC(${partition_timestamp_date}, WEEK(MONDAY))) +1 AS STRING) ;;
  }
  dimension: week_number_cxl {
    type:  number
    sql: ${week_string_cxl} ;;
  }

  dimension: continent {
    type: string
    sql: Case
          when UPPER(${hotel_country}) = 'PORTUGAL' and ${hotel_code}  not in('serenade-all-suites','best-serenade','impressive-puntacana',
          'impressive-premium','casual-belle-epoque','casual-incas','casual-raizes','smy-lisboa','smy-eulalia-algarve','vik-cayena','vik-arenablanca',
          'summum-poblado-suites','habitus-mesod-jungle') then '3' --Portugal
          when UPPER(${hotel_country}) IN ('MEXICO', 'MÉXICO', 'ESTADOS UNIDOS', 'COLOMBIA', 'REPUBLICA DOMINICANA', 'ARGENTINA', 'DOMINICAN REPUBLIC',
          'REPÚBLICA DOMINICANA', 'PANAMA', 'PERÚ', 'PERU', 'PUERTO RICO') and ${hotel_code} not in('serenade-all-suites','best-serenade','impressive-puntacana',
          'impressive-premium','casual-belle-epoque','casual-incas','casual-raizes','smy-lisboa','smy-eulalia-algarve','vik-cayena','vik-arenablanca',
          'summum-poblado-suites','habitus-mesod-jungle') then '2' --Latam
          ELSE '1' -- Europa
          END ;;
  }

  dimension: option_selection {
    type: string
    sql: 'Opción 1' ;;
    group_label: "Opciones"
  }

  dimension: option_2 {
    type: string
    sql: 'Opción 2' ;;
    group_label: "Opciones"
  }

  dimension: option_3 {
    type: string
    sql: 'Opción 3' ;;
    group_label: "Opciones"
  }

  dimension: option_4 {
    type: string
    sql: 'Opción 4' ;;
    group_label: "Opciones"
  }

  dimension: option_5 {
    type: string
    sql: 'Opción 5' ;;
    group_label: "Opciones"
  }

  dimension: options {
    type: string
    sql: 'options 1, options 2, options 3, options 4, options 5' ;;
  }

  dimension: dashboard_text {
    type:string
    sql:Case
      when ${options} = 'options 1' then 'General overview. How am I doing?'
      when ${options} ='options 2' then 'SALES (By Booking window)'
      when ${options} = 'options 3' then 'TRAVEL REVENUE per month'
      else 'options 4'
      end;;      }


  dimension: format_text{
    type: string
    sql: ${dashboard_text} ;;
    html: {% if value == 'General overview. How am I doing?' %}
    <p style="color: red; background-color: white; font-size:100%; font-family: 'Roboto', sans-serif; text-align:center">{{ rendered_value }}</p>
    {% elsif value == '2' %}
    <p style="color: black; background-color: GOLD; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif value == 'Silver' %}
    <p style="color: black; background-color: Silver; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif value == 'BRONZE' %}
    <p style="color: black; background-color: orange; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif value == 'LITE' %}
    <p style="color: black; background-color: lightgreen; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
    <p style="color: black; background-color: white; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %};;
  }


}
