view: summum_datos_reservas{

  sql_table_name:  `analysis-seeker.bi_dataset.DATOS_RESERVAS_SUMMMUM_PMS_FIXED` ;;

  dimension: hotel_code {
    type: string
    sql: case
          when ${TABLE}.hotel_code = 'villa-nazules ' then 'villa-nazules'
          when ${TABLE}.hotel_code = 'summum-zurbaran ' then 'summum-zurbaran'
          else ${TABLE}.hotel_code
        end;;
  }

  dimension: identifier {
    type: string
    sql: ${TABLE}.identifier ;;
  }

  dimension: startDate {
    type: date
    sql: ${TABLE}.startDate ;;
  }

  dimension: endDate {
    type: date
    sql: ${TABLE}.endDate ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: adults1 {
    type: number
    sql: ${TABLE}.adults1 ;;
  }

  dimension: kids1 {
    type: number
    sql: ${TABLE}.kids1 ;;
  }

  dimension: babies1 {
    type: number
    sql: ${TABLE}.babies1 ;;
  }

  dimension: babies2 {
    type: number
    sql: ${TABLE}.babies2 ;;
  }

  dimension: Room {
    type: string
    sql: Case
      when ${TABLE}.Room = 'DBT' THEN 'Doble Estándar con Balcón'
      when ${TABLE}.Room = 'DB' and ${hotel_code} = 'villa-nazules' THEN 'Confort con balcón'
      when ${TABLE}.Room = 'DB' THEN 'Habitación doble estándar'
      when ${TABLE}.Room = 'PVM' THEN 'Premium Vista Mar'
      when ${TABLE}.Room = 'PVP' THEN 'Premium Vista Piscina'
      when ${TABLE}.Room = 'DLT' THEN 'Deluxe Vista Mar con Terraza'
      when ${TABLE}.Room = 'JSB' THEN 'Junior Suite con balcón'
      when ${TABLE}.Room = 'JS' THEN 'Junior Suite'
      when ${TABLE}.Room = 'CLS' THEN 'Habitación Rustic'
      when ${TABLE}.Room = 'TST' THEN 'Habitación Triple'
      when ${TABLE}.Room = 'DS' and ${hotel_code} = 'villa-nazules' THEN 'Superior confort con balcón'
      when ${TABLE}.Room = 'DS' THEN 'Habitación Doble Superior'
      when ${TABLE}.Room = 'SDLX' THEN 'Habitación doble superior deluxe'
      ELSE ${TABLE}.Room
    end;;
  }

  dimension: Board {
    type: string
    sql: Case
      when UPPER(${TABLE}.Board) = 'SA' and ${hotel_code} = 'summum-ventas' then 'SÓLO ALOJAMIENTO'
      when UPPER(${TABLE}.Board) = 'SA' and ${hotel_code} = 'sant-roc' then 'SOLO ALOJAMIENTO '
      when UPPER(${TABLE}.Board) = 'SA' then 'SOLO ALOJAMIENTO'
      when UPPER(${TABLE}.Board) = 'AD' then 'ALOJAMIENTO Y DESAYUNO'
      ELSE UPPER(${TABLE}.Board)
    END;;
  }

  dimension: RateName {
    type: string
    sql: Case
      when ${TABLE}.RateName  like 'NR %' OR  ${TABLE}.RateName  like 'No Reembolsable %' then 'No reembolsable Club || Una modificación'
      when ${TABLE}.RateName  like 'FLEX %' then 'Tarifa Flexible Club || Cancelación Gratuita'
      else ${TABLE}.RateName
    end;;
  }

  dimension: promotions {
    type: string
    sql: ${TABLE}.promotions ;;
  }

  dimension: Promo {
    type: string
    sql: ${TABLE}.Promo ;;
  }

  dimension: Revenue {
    type: number
    sql: ${TABLE}.Revenue ;;
  }

  dimension: payment_method {
    type: string
    sql: ${TABLE}.payment_method ;;
  }

  dimension_group: partitionTimestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.partitionTimestamp ;;
  }

  dimension: cancellation_timestamp_date {
    type: date
    sql: ${TABLE}.cancellation_timestamp_date ;;
  }

  dimension: PMS {
    type: yesno
    sql: ${TABLE}.PMS ;;
  }
   dimension: origen {
     type: string
    sql: ${TABLE}.Origen ;;
   }

  dimension: full_country {
    type: string
    sql:  CASE country
            WHEN 'FRA' THEN 'France'
            WHEN 'ISR' THEN 'Israel'
            WHEN 'ESP' THEN 'Spain'
            WHEN 'DEU' THEN 'Germany'
            WHEN 'NLD' THEN 'Netherlands'
            WHEN 'PRT' THEN 'Portugal'
            WHEN 'BEL' THEN 'Belgium'
            WHEN 'CHE' THEN 'Switzerland'
            WHEN 'ISL' THEN 'Iceland'
            WHEN 'LUX' THEN 'Luxembourg'
            WHEN 'CHN' THEN 'China'
            WHEN 'VEN' THEN 'Venezuela'
            WHEN 'AUS' THEN 'Australia'
            WHEN 'GBR' THEN 'United Kingdom'
            WHEN 'IRL' THEN 'Ireland'
            WHEN 'SWE' THEN 'Sweden'
            WHEN 'TZA' THEN 'Tanzania'
            WHEN 'ARG' THEN 'Argentina'
            WHEN 'ROU' THEN 'Romania'
            WHEN 'KWT' THEN 'Kuwait'
            WHEN 'ARE' THEN 'United Arab Emirates'
            WHEN 'NGA' THEN 'Nigeria'
            WHEN 'ITA' THEN 'Italy'
            WHEN 'GRC' THEN 'Greece'
            WHEN 'MEX' THEN 'Mexico'
            WHEN 'CAN' THEN 'Canada'
            WHEN 'DZA' THEN 'Algeria'
            WHEN 'AGO' THEN 'Angola'
            WHEN 'LVA' THEN 'Latvia'
            WHEN 'ALB' THEN 'Albania'
            WHEN 'USA' THEN 'United States'
            WHEN 'CYP' THEN 'Cyprus'
            WHEN 'ECU' THEN 'Ecuador'
            WHEN 'SVK' THEN 'Slovakia'
            WHEN 'EGY' THEN 'Egypt'
            WHEN 'MYS' THEN 'Malaysia'
            WHEN 'HKG' THEN 'Hong Kong'
            WHEN 'BRA' THEN 'Brazil'
            WHEN 'CHL' THEN 'Chile'
            WHEN 'CRI' THEN 'Costa Rica'
            WHEN 'MAR' THEN 'Morocco'
            WHEN 'TWN' THEN 'Taiwan'
            WHEN 'SAU' THEN 'Saudi Arabia'
            WHEN 'HND' THEN 'Honduras'
            WHEN 'COL' THEN 'Colombia'
            WHEN 'RUS' THEN 'Russia'
            WHEN 'BOL' THEN 'Bolivia'
            WHEN 'NOR' THEN 'Norway'
            WHEN 'POL' THEN 'Poland'
            WHEN 'FIN' THEN 'Finland'
            WHEN 'MCO' THEN 'Monaco'
            WHEN 'UKR' THEN 'Ukraine'
            WHEN 'AUT' THEN 'Austria'
            WHEN 'DNK' THEN 'Denmark'
            WHEN 'LTU' THEN 'Lithuania'
            WHEN 'PER' THEN 'Peru'
            WHEN 'PRI' THEN 'Puerto Rico'
            WHEN 'OMN' THEN 'Oman'
            WHEN 'IND' THEN 'India'
            WHEN 'KAZ' THEN 'Kazakhstan'
            WHEN 'CZE' THEN 'Czech Republic'
            WHEN 'HRV' THEN 'Croatia'
            WHEN 'SGP' THEN 'Singapore'
            WHEN 'IMN' THEN 'Isle of Man'
            WHEN 'GIN' THEN 'Guinea'
            WHEN 'EST' THEN 'Estonia'
            ELSE 'Unknown Country'
          End;;
  }
}
