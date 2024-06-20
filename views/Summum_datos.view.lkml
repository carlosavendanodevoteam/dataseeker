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


}
