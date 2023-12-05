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

  dimension: promo {
    type: string
    sql: ${TABLE}.Promo ;;
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
    timeframes: [raw, time, date, week, month, quarter, year]
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
          WHEN TIMESTAMP_ADD(${TABLE}.startDate, INTERVAL 365 DAY) > CURRENT_TIMESTAMP() THEN NULL
          ELSE TIMESTAMP_ADD(${TABLE}.startDate, INTERVAL 365 DAY)
        END ;;
    timeframes: [raw, time, date, week, month, quarter, year]
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

}
