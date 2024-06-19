view: summum_datos_reservas{

  sql_table_name:  `analysis-seeker.bi_dataset.DATOS_RESERVAS_SUMMMUM_PMS_FIXED` ;;

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
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
    sql: ${TABLE}.Room ;;
  }

  dimension: bad_Board {
    type: string
    sql: ${TABLE}.Board ;;
  }

  dimension: bad_RateName {
    type: string
    sql: ${TABLE}.RateName ;;
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

  dimension: board {
    type: string
    sql: Case
          when UPPER(${bad_Board}) = 'SOLO ALOJAMIENTO' and ${hotel_code} = 'summum-ventas' then 'SÓLO ALOJAMIENTO'
          when UPPER(${bad_Board}) = 'SOLO ALOJAMIENTO' and ${hotel_code} = 'sant-roc' then 'SOLO ALOJAMIENTO '
          when UPPER(${bad_Board}) = 'SOLO ALOJAMIENTO' then 'SOLO ALOJAMIENTO'
          ELSE UPPER(${bad_Board})
        END;;
  }
  dimension: RateName {
    type: string
    sql: Case
          when ${bad_RateName} like 'NR %' OR ${bad_RateName} like 'No Reembolsable %' then 'No reembolsable Club || Una modificación'
          when ${bad_RateName} like 'FLEX %' then 'Tarifa Flexible Club || Cancelación Gratuita'
          else ${bad_RateName}
        end
          ;;
  }

}
