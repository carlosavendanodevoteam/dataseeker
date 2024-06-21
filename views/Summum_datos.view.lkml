view: summum_datos_reservas{

  sql_table_name: `analysis-seeker.bi_dataset.DATOS_RESERVAS_SUMMMUM_PMS_FIXED` ;;

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
      when ${TABLE}.RateName  like 'NR %' OR  UPPER(${TABLE}.RateName)  like 'NO REEMBOLSABLE %' then 'No reembolsable || Una modificación'
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
    sql: CASE
            WHEN ${TABLE}.country = 'FRA' THEN 'France'
            WHEN ${TABLE}.country = 'ISR' THEN 'Israel'
            WHEN ${TABLE}.country = 'ESP' THEN 'Spain'
            WHEN ${TABLE}.country = 'DEU' THEN 'Germany'
            WHEN ${TABLE}.country = 'NLD' THEN 'Netherlands'
            WHEN ${TABLE}.country = 'PRT' THEN 'Portugal'
            WHEN ${TABLE}.country = 'BEL' THEN 'Belgium'
            WHEN ${TABLE}.country = 'CHE' THEN 'Switzerland'
            WHEN ${TABLE}.country = 'ISL' THEN 'Iceland'
            WHEN ${TABLE}.country = 'LUX' THEN 'Luxembourg'
            WHEN ${TABLE}.country = 'CHN' THEN 'China'
            WHEN ${TABLE}.country = 'VEN' THEN 'Venezuela'
            WHEN ${TABLE}.country = 'AUS' THEN 'Australia'
            WHEN ${TABLE}.country = 'GBR' THEN 'United Kingdom'
            WHEN ${TABLE}.country = 'IRL' THEN 'Ireland'
            WHEN ${TABLE}.country = 'SWE' THEN 'Sweden'
            WHEN ${TABLE}.country = 'TZA' THEN 'Tanzania'
            WHEN ${TABLE}.country = 'ARG' THEN 'Argentina'
            WHEN ${TABLE}.country = 'ROU' THEN 'Romania'
            WHEN ${TABLE}.country = 'KWT' THEN 'Kuwait'
            WHEN ${TABLE}.country = 'ARE' THEN 'United Arab Emirates'
            WHEN ${TABLE}.country = 'NGA' THEN 'Nigeria'
            WHEN ${TABLE}.country = 'ITA' THEN 'Italy'
            WHEN ${TABLE}.country = 'GRC' THEN 'Greece'
            WHEN ${TABLE}.country = 'MEX' THEN 'Mexico'
            WHEN ${TABLE}.country = 'CAN' THEN 'Canada'
            WHEN ${TABLE}.country = 'DZA' THEN 'Algeria'
            WHEN ${TABLE}.country = 'AGO' THEN 'Angola'
            WHEN ${TABLE}.country = 'LVA' THEN 'Latvia'
            WHEN ${TABLE}.country = 'ALB' THEN 'Albania'
            WHEN ${TABLE}.country = 'USA' THEN 'United States'
            WHEN ${TABLE}.country = 'CYP' THEN 'Cyprus'
            WHEN ${TABLE}.country = 'ECU' THEN 'Ecuador'
            WHEN ${TABLE}.country = 'SVK' THEN 'Slovakia'
            WHEN ${TABLE}.country = 'EGY' THEN 'Egypt'
            WHEN ${TABLE}.country = 'MYS' THEN 'Malaysia'
            WHEN ${TABLE}.country = 'HKG' THEN 'Hong Kong'
            WHEN ${TABLE}.country = 'BRA' THEN 'Brazil'
            WHEN ${TABLE}.country = 'CHL' THEN 'Chile'
            WHEN ${TABLE}.country = 'CRI' THEN 'Costa Rica'
            WHEN ${TABLE}.country = 'MAR' THEN 'Morocco'
            WHEN ${TABLE}.country = 'TWN' THEN 'Taiwan'
            WHEN ${TABLE}.country = 'SAU' THEN 'Saudi Arabia'
            WHEN ${TABLE}.country = 'HND' THEN 'Honduras'
            WHEN ${TABLE}.country = 'COL' THEN 'Colombia'
            WHEN ${TABLE}.country = 'RUS' THEN 'Russia'
            WHEN ${TABLE}.country = 'BOL' THEN 'Bolivia'
            WHEN ${TABLE}.country = 'NOR' THEN 'Norway'
            WHEN ${TABLE}.country = 'POL' THEN 'Poland'
            WHEN ${TABLE}.country = 'FIN' THEN 'Finland'
            WHEN ${TABLE}.country = 'MCO' THEN 'Monaco'
            WHEN ${TABLE}.country = 'UKR' THEN 'Ukraine'
            WHEN ${TABLE}.country = 'AUT' THEN 'Austria'
            WHEN ${TABLE}.country = 'DNK' THEN 'Denmark'
            WHEN ${TABLE}.country = 'LTU' THEN 'Lithuania'
            WHEN ${TABLE}.country = 'PER' THEN 'Peru'
            WHEN ${TABLE}.country = 'PRI' THEN 'Puerto Rico'
            WHEN ${TABLE}.country = 'OMN' THEN 'Oman'
            WHEN ${TABLE}.country = 'IND' THEN 'India'
            WHEN ${TABLE}.country = 'KAZ' THEN 'Kazakhstan'
            WHEN ${TABLE}.country = 'CZE' THEN 'Czech Republic'
            WHEN ${TABLE}.country = 'HRV' THEN 'Croatia'
            WHEN ${TABLE}.country = 'SGP' THEN 'Singapore'
            WHEN ${TABLE}.country = 'IMN' THEN 'Isle of Man'
            WHEN ${TABLE}.country = 'GIN' THEN 'Guinea'
            WHEN ${TABLE}.country = 'EST' THEN 'Estonia'
            ELSE'Unknown Country'
          End;;
  }
}
