view: summum_datos_reservas{
  derived_table: {
    sql:
      SELECT hotel_code, identifier, startDate, endDate, country, adults1, kids1, babies1, babies2, Room, Board, RateName, promotions, Promo, Revenue, payment_method, partitionTimestamp, cancellation_timestamp_date, PMS
      FROM (
          SELECT
              *
          FROM `analysis-seeker.bi_dataset.DATOS_RESERVAS_SUMMMUM_PMS_FIXED`
          UNION ALL
          SELECT
              hotel_code, identifier, startDate, endDate, country, adults1, kids1, babies1, babies2, Room, Board, RateName, promotions, Promo,
              SUM(price + priceSupplements) AS Revenue, payment_method, partitionTimestamp, cancellation_timestamp_date, True AS PMS
          FROM `analysis-seeker.bi_dataset.MVIEW_DATOS_RESERVAS_6`
          WHERE hotel_code IN (
              SELECT hotel_code
              FROM `analysis-seeker.bi_dataset.VIEW_HOTEL_CORPORATIVE_ENCRYPTED`
              WHERE corporative_hotel_code = 'summum-corpo' OR hotel_code = '1881-corpo'
          )
          AND TIMESTAMP_TRUNC(partitionTimestamp, DAY) >= TIMESTAMP('2024-01-01')
          GROUP BY hotel_code, identifier, startDate, endDate, country, adults1, kids1, babies1, babies2, Room, Board, RateName, promotions, Promo, payment_method, partitionTimestamp, cancellation_timestamp_date
      ) ;;
  }

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
}
