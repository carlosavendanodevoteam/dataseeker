view: summum_datos_reservas{

  sql_table_name:  `analysis-seeker.bi_dataset.DATOS_RESERVAS_SUMMMUM_PMS_FIXED` ;;

  dimension: hotel_code {
    type: string
    sql: case
          when ${TABLE}.hotel_code = 'summum-zurbaran ' then 'summum-zurbaran'
          when ${TABLE}.hotel_code = 'villa-nazules ' then 'villa-nazules'
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
    sql: ${TABLE}.Room ;;
  }

  dimension: Board {
    type: string
    sql: ${TABLE}.Board ;;
  }

  dimension: RateName {
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

}
