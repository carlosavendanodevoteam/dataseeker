# The name of this view in Looker is "Mview Comparation Bookings"
view: mview_comparation_bookings {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.COMPARATION_BOOKINGS` ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.
  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Account" in Explore.
  dimension: account {
    type: string
    sql: ${TABLE}.account;;
  }

  dimension: uniques_accounts{
    type: string
    sql: distinct ${account};;
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
    sql: TRIM(UPPER(${TABLE}.Board)) ;;
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
  dimension: gateway_type {
    type: string
    sql: ${TABLE}.gateway_type ;;
  }
  dimension: comments {
    type: string
    sql: UPPER(${TABLE}.comments) ;;
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

  dimension: hotel_currency {
    type: string
    sql: ${TABLE}.hotel_currency ;;
  }
  dimension: price_in_hotel_currency {
    type: number
    sql: ${TABLE}.price_in_hotel_currency ;;
  }
  dimension: priceSupplements_in_hotel_currency {
    type: number
    sql: ${TABLE}.priceSupplements_in_hotel_currency ;;
  }
  dimension: revenue_in_hotel_currency {
    type: number
    sql: CASE
          WHEN ${TABLE}.cancelled = True THEN 0
          WHEN ${TABLE}.cancelled = False THEN ${TABLE}.price_in_hotel_currency + COALESCE(${TABLE}.priceSupplements_in_hotel_currency, 0)
        END;;
  }
  dimension: cancellation_in_hotel_currency {
    type: number
    sql: CASE
        WHEN ${TABLE}.cancelled = False THEN 0
        WHEN ${TABLE}.cancelled = True THEN ${TABLE}.price_in_hotel_currency + COALESCE(${TABLE}.priceSupplements_in_hotel_currency, 0)
      END;;
  }

  parameter: filter {
    type: unquoted
    allowed_value: {label: "USD"
      value: "USD"}
    allowed_value: {label: "MXN"
      value: "MXN"}
    default_value: "USD"
  }

  dimension: revenue_final{
    type: number
    sql:
    {% if filter._parameter_value == "USD" %}
    cast(${revenue} as FLOAT64)
    {% elsif filter._parameter_value == "MXN" %}
    cast(${revenue_in_hotel_currency} as FLOAT64)
    {% else %}
    cast(${revenue} as FLOAT64)
    {% endif %};;
  }

  dimension: cancellation_final{
    type: number
    sql:
    {% if filter._parameter_value == "USD" %}
    cast(${cancellation} as FLOAT64)
    {% elsif filter._parameter_value == "MXN" %}
    cast(${cancellation_in_hotel_currency} as FLOAT64)
    {% else %}
    cast(${cancellation} as FLOAT64)
    {% endif %};;
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
  dimension: promos_fixed {
    type: string
    sql: REPLACE(REPLACE(REPLACE(${promos}, '-,', ''), ',-', ''), '-', '');;
  }
  dimension: promos_fixed_filter {
    type: string
    sql: if(${promos_fixed} = '', null, ${promos_fixed}) ;;
  }
  dimension: promocode {
    type: string
    sql: upper(${TABLE}.promocode) ;;
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
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.partitionTimestamp;;
  }

  dimension: regimen {
    type: string
    sql: ${TABLE}.regimen ;;
  }
  dimension: room {
    type: string
    sql: TRIM(${TABLE}.Room) ;;
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


  dimension: utm_source {
    type: string
    sql: CASE
          WHEN upper(${TABLE}.utm_source) IN ('%7BEMM%7D', '{EMM}', 'EMAIL') THEN 'EMM'
          When ${TABLE}.utm_source = 'newsletter' THEN Null
          When upper(${TABLE}.utm_source) In ('FACEBOOK', 'FB') then 'facebook'
          ELSE ${TABLE}.utm_source
        End ;;
  }

  dimension: callseeker {
    type: string
    sql: Case
          when ${TABLE}.source_fixed like '%allcenter%' and not (${TABLE}.agent  like '%ort_%' or LOWER(${TABLE}.agent)  like '%_port%') then 'Callseeker'
          else ${TABLE}.source_fixed
        End;;
  }
  dimension: source_fixed {
    type: string
    sql: CASE
          when ${callseeker} = 'Callseeker' and ${TABLE}.agent like 'agent%'  and ${TABLE}.agent not like '%-nau%' and ${TABLE}.agent not like '%landmar%' and ${TABLE}.agent not like '%oasis%'
          and ${TABLE}.agent not like '%qhotels%' and ${TABLE}.agent not like '%_ona' and ${TABLE}.agent not like '%ort_%' THEN 'Ring2travel'
          WHEN ${callseeker} = 'Callseeker' then 'Callseeker'
          WHEN upper(${TABLE}.source_fixed) LIKE 'RESCUE%' then 'Rescue'
          ELSE ${TABLE}.source_fixed
      END ;;
  }
  #   type: string
  #   sql: CASE
  #         WHEN ${TABLE}.agent LIKE '%agente%' AND ${TABLE}.agent not LIKE '%-nau%' AND ${TABLE}.source_fixed LIKE 'Callcenter%' THEN 'Ring2travel'
  #         WHEN ${TABLE}.agent NOT LIKE '%agente%' AND ${TABLE}.source_fixed LIKE 'Callcenter%' THEN 'Callseeker'
  #         ELSE ${TABLE}.source_fixed
  #       END ;;
  # }
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

  dimension: revenue_in_euros {
    type: number
    sql:
      -- Primero, creamos una variable Liquid y buscamos si el join existe
      {% assign crm_is_joined = false %}
      {% for join in _explore.joins %}
        {% if join.name == 'conversion_rates_map' %}
          {% assign crm_is_joined = true %}
        {% endif %}
      {% endfor %}

      -- Ahora, usamos esa variable para nuestra condición
      {% if crm_is_joined %}
      ${revenue} * {{ conversion_rates_map.rate._sql }}
      {% else %}
      ${revenue}
      {% endif %} ;;
    value_format_name: eur
  }

  dimension: revenue_complete {
    type: number
    sql:${TABLE}.price + COALESCE(${TABLE}.priceSupplements, 0);;
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
    sql: concat((${TABLE}.adults1+${TABLE}.adults2+${TABLE}.adults3), "-", (${TABLE}.kids1 + ${TABLE}.kids2 + ${TABLE}.kids3), "-", (${TABLE}.babies1 + ${TABLE}.babies2 + ${TABLE}.babies3)) ;;
  }
  dimension: advance_cancellation{
    type: number
    sql:
    CASE
    WHEN ${TABLE}.cancellationTimestamp IS NULL OR ${TABLE}.cancellationTimestamp = '' THEN NULL
    ELSE DATE_DIFF(CAST(${TABLE}.startDate AS TIMESTAMP), CAST(${TABLE}.cancellationTimestamp AS TIMESTAMP), DAY)
    END ;;
  }

  dimension: rateName_fixed {
    type: string
    sql:CASE
          WHEN UPPER(${TABLE}.RateName) like '% TRADE %' THEN 'Trade area'
          else REPLACE(TRIM(UPPER(${TABLE}.RateName)), '.', '')
        end;;
  }

  dimension: rateName_FH {
    type: string
    sql: {% if rate._is_joined %}
         CASE
           WHEN {{ rate.flightHotel._sql }} = TRUE THEN ${rateName_fixed}
           ELSE NULL
         END
       {% else %}
         NULL
       {% endif %} ;;
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
          ELSE ${TABLE}.hotel_code
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
        END;;
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
        END;;
  }
  dimension: device {
    type: string
    sql: IFNULL(${TABLE}.device, 'Web') ;;
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
  dimension_group: comparation_cancellatioTimestamp_without_future{
    type: time
    sql: IF(${TABLE}.last_year_booking = 0, ${TABLE}.partitionTimestamp,
      CASE
        WHEN CAST(${TABLE}.cancelation_datetime AS timestamp) > CURRENT_TIMESTAMP() THEN NULL
        ELSE CAST(${TABLE}.cancelation_datetime AS timestamp)
      END);;
    timeframes: [raw, time, date, week, month, quarter, year]
  }
  dimension_group: comparation_startDate_without_future{
    type: time
    sql: IF(${TABLE}.last_year_booking = 0, ${TABLE}.startDate,
      CASE
        WHEN CAST(${TABLE}.startDate AS timestamp) > CURRENT_TIMESTAMP() THEN NULL
        ELSE CAST(${TABLE}.startDate AS timestamp)
      END);;
    timeframes: [raw, time, date, week, month, quarter, year]
  }
  dimension: last_year_booking {
    type: number
    sql: ${TABLE}.last_year_booking ;;
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
      WHEN ${country} = 'ES' or ${country} like 'ESPAÑ%' THEN 'Spain'
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
      WHEN ${country} = 'FR' or ${country} = 'FRANCIA' THEN 'France'
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
      WHEN ${country} = 'GB' or ${country} = 'UNITED KINGDOM OF GREAT BRITAIN AND NORTHERN IRELAND' THEN 'United Kingdom'
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
  dimension: week_string_booking {
    type: string
    sql: CAST(EXTRACT(WEEK FROM ${timestamp_date}) AS STRING) ;;
  }
  dimension: week_number_booking {
    type:  number
    sql: ${week_string_booking} ;;
  }
  dimension: week_string_cancellation {
    type: string
    sql: CAST(EXTRACT(WEEK FROM ${comparation_cancellatioTimestamp_without_future_date}) AS STRING) ;;
  }
  dimension: week_number_cancellation {
    type:  number
    sql: ${week_string_booking} ;;
  }
  dimension_group: comparation_timestamp {
    type: time
    sql: timestamp_add(${timestamp_date} Interval 365 days);;
    timeframes: [raw, time, date, week, month, quarter, year]
  }
  dimension: advance{
    type: number
    sql: date_diff(cast(${comparation_startDate_date} as timestamp), cast(${partition_timestamp_date} as timestamp), day) ;;
  }

  dimension: oasishoteles_complejos {
    type: string
    sql: Case
          when ${hotel_code} in ('oasishoteles-grandcancun', 'oasishoteles-pyramid') then 'Complejos GOC'
          when ${hotel_code} in ('oasishoteles-oasispalm', 'oasishoteles-grandpalm', 'oasishoteles-senscancun') then 'Complejos Palm'
          when ${hotel_code} in ('oasishoteles-ohurban', 'oasishoteles-smart') then 'Complejos Centro'
          Else 'Complejos Tulum'
         End ;;
  }
  dimension: room_name {
    type: string
    sql: CASE
          WHEN UPPER(${room}) IN ("STANDARD DOUBLE ROOM", "DOUBLE ROOM", "DOUBLE ROOM", "DOUBLE ROOM") THEN "Standard Double room"
          WHEN UPPER(${room}) IN ("ONE-BEDROOM APARTMENT", "1 BEDROOM APARTMENT") THEN "One-Bedroom Apartment"
          WHEN UPPER(${room}) = "PREMIUM ROOM" THEN "Premium room"
          WHEN UPPER(${room}) IN ("SUPERIOR DOUBLE ROOM", "SUPERIOR ROOM") THEN "Superior Double room"
          WHEN UPPER(${room}) = "DOUBLE ROOM WITHOUT VIEW" THEN "Double room Without View"
          WHEN UPPER(${room}) = "SUPERIOR DOUBLE ROOM WITH SEA VIEW" THEN "Superior Double room with Sea View"
          WHEN UPPER(${room}) = "DOUBLE ROOM WITH SEA VIEWS" THEN "Double room with Sea Views"
          WHEN UPPER(${room}) = "JUNIOR SUITE ROOM" THEN "Junior Suite room"
          WHEN UPPER(${room}) = "DOUBLE SIDE SEA VIEW ROOM" THEN "Double Side Sea View room"
          WHEN UPPER(${room}) = "ONE-BEDROOM APARTMENT WITH SEA OR POOL VIEW" THEN "One-Bedroom Apartment with Sea or Pool View"
          WHEN UPPER(${room}) = "TWO-BEDROOM APARTMENT" THEN "Two-Bedroom Apartment"
          WHEN UPPER(${room}) = "SINGLE ROOM" THEN "Single room"
          WHEN UPPER(${room}) IN ("DOUBLE ROOM WITH POOL VIEWS", "DOUBLE ROOM WITH POOL VIEW") THEN "Double room with Pool View"
          WHEN UPPER(${room}) = "SUPERIOR DOUBLE ROOM SWIM UP" THEN "Superior Double room Swim Up"
          WHEN UPPER(${room}) = "DOUBLE ROOM WITHOUT VIEWS" THEN "Double room Without View"
          WHEN UPPER(${room}) = "DOUBLE ROOM FOR SINGLE USE" THEN "Single room"
          WHEN UPPER(${room}) = "FAMILY ROOM" THEN "Family room"
          WHEN UPPER(${room}) = "DOUBLE ROOM - 1 OR 2 BEDS" THEN "Standard Double room"
          WHEN UPPER(${room}) = "EXTERIOR FAMILY ROOM" THEN "Family room"
          WHEN UPPER(${room}) = "2 BEDROOM APARTMENT WITH SEA OR POOL VIEW" THEN "2 Bedroom Apartment with sea or pool view"
          WHEN UPPER(${room}) = "STANDARD DOUBLE ROOM SIDE SEA VIEW" THEN "Double Side Sea View room"
          WHEN UPPER(${room}) = "PREMIUM DOUBLE ROOM" THEN "Premium room"
          WHEN UPPER(${room}) = "MASTER SUITE ROOM" THEN "Master Suite room"
          WHEN UPPER(${room}) IN ("QUADRUPLE ROOM", "STANDARD QUADRUPLE ROOM") THEN "Quadruple room"
          WHEN UPPER(${room}) = "SEA VIEW FAMILY ROOM" THEN "Sea View Family room"
          WHEN UPPER(${room}) = "STUDIO" THEN "Studio"
          WHEN UPPER(${room}) = "SUITE ROOM" THEN "Suite room"
          WHEN UPPER(${room}) = "FRONTAL SEA VIEW DOUBLE ROOM" THEN "Double room with Sea Views"

          -- Nuevas adiciones
          WHEN UPPER(${room}) = "SUPERIOR DOUBLE ROOM FRONT SEA VIEW" THEN "Superior Double Room with Sea View"
          WHEN UPPER(${room}) = "DOUBLE ROOM SEA VIEW" THEN "Double Room with Sea Views"
          WHEN UPPER(${room}) = "STANDARD DOUBLE ROOM WITH POOL VIEW" THEN "Standard Double Room"
          WHEN UPPER(${room}) = "TWIN ROOM" THEN "Twin Room"
          WHEN UPPER(${room}) = "SINGLE ROOM" THEN "Single Room"
          WHEN UPPER(${room}) = "TWIN ROOM" THEN "Twin Room"
          WHEN UPPER(${room}) = "HABITACIÓN SUITE" THEN "Suite Room"
          WHEN UPPER(${room}) = "SENATOR ROOM" THEN "Superior Double Room"
          WHEN UPPER(${room}) = "2 BEDROOM APARTMENT" THEN "Two-Bedroom Apartment"
          WHEN UPPER(${room}) = "JUNIOR SUITE" THEN "Junior Suite"
          WHEN UPPER(${room}) = "DOUBLE ROOM - 1 BED" THEN "Standard Double Room"
          WHEN UPPER(${room}) = "SUPERIOR DOUBLE ROOM WITH POOL VIEW" THEN "Superior Double Room with Pool View"
          WHEN UPPER(${room}) = "DOUBLE SUPERIOR ROOM" THEN "Superior Double Room"
          WHEN UPPER(${room}) = "SUPERIOR DOUBLE ROOM SEA VIEW" THEN "Superior Double Room with Sea View"
          WHEN UPPER(${room}) = "DOUBLE ROOM POOL VIEW" THEN "Double Room with Pool View"
          WHEN UPPER(${room}) = "INDIVIDUAL DOUBLE USE" THEN "Single Room"
          WHEN UPPER(${room}) = "STUDIO (1 ADULT)" THEN "Studio"
          WHEN UPPER(${room}) = "DOUBLE ROOM (1 ADULT)" THEN "Standard Double Room"
          WHEN UPPER(${room}) = "DOUBLE ROOM WITH FRONTAL SEA VIEW" THEN "Double Room with Sea Views"
          WHEN UPPER(${room}) = "JUNIOR SUITE" THEN "Junior Suite"
          WHEN UPPER(${room}) = "SUPERIOR DOUBLE ROOM - 1 BED" THEN "Superior Double Room"
          WHEN UPPER(${room}) = "SUPERIOR ROOM WITH BALCONY" THEN "Superior Double Room"
          WHEN UPPER(${room}) = "FAMILY SUITE" THEN "Family room"
          WHEN UPPER(${room}) = "DOUBLE ROOM WITH SEA VIEWS FOR SINGLE USE" THEN "Double Room with Sea Views"
          WHEN UPPER(${room}) = "FAMILY ROOM" THEN "Family room"
          WHEN UPPER(${room}) = "SINGLE BED" THEN "Single Room"
          WHEN UPPER(${room}) = "SUPERIOR DOUBLE ROOM - 2 BEDS" THEN "Superior Double Room"
          WHEN UPPER(${room}) = "2 BEDROOM APARTMENT WITH PRIVATE GARDEN" THEN "2 Bedroom Apartment with private garden (max 6 people)"
          WHEN UPPER(${room}) = "2 BEDROOM APARTMENT WITH PRIVATE GARDEN (6 PEOPLE)" THEN "2 Bedroom Apartment with private garden (max 6 people)"
          WHEN UPPER(${room}) = "2 BEDROOM APARTMENT WITH SEA VIEWS" THEN "2 Bedroom Apartment with sea views ( max 6 people)"
          WHEN UPPER(${room}) = "2 BEDROOM APARTMENT WITH SEA VIEWS (6 PEOPLE)" THEN "2 Bedroom Apartment with sea views ( max 6 people)"
          WHEN UPPER(${room}) = "2-BEDROOM APARTMENT (6 PEOPLE)" THEN "2 Bedroom Apartment Standard (max 6 people)"
           WHEN UPPER(${room}) = "STANDARD 2 BEDROOM APARTMENT" THEN "2 Bedroom Apartment Standard (max 6 people)"
          WHEN UPPER(${room}) = "2-BEDROOM APARTMENT WITH SEA VIEW (6 PEOPLE)" THEN "2 Bedroom Apartment with sea views ( max 6 people)"


          WHEN UPPER(${room}) = "1 BEDROOM APARTMENT" THEN "1 Bedroom Apartment (max 4 people)"

          ELSE ${room} -- En caso de que haya valores no mapeados, se mantiene el original
        END;;
  }

  dimension: source_metabuscador {
    type: string
    sql:Case
    when lower(${source}) LIKE '%rivago%' then "Trivago"
    when lower(${source}) LIKE '%ripadvisor%' then "Tripadvisor"
    when lower(${source}) LIKE "%kyscanner%" then "Skyscanner"
    else ''
    END;;
  }

  dimension: standarized_room {
    type: string
    sql: Case
          when ${hotel_code} LIKE 'best%' or ${hotel_code} LIKE 'serenade%' then ${room_name}
          else ${room}
        END;;
  }
}
