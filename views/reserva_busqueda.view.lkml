view: reserva_busqueda {
  derived_table: {
    sql:
      SELECT
        DR.hotel_code,
        DR.HotelName,
        DR.PackageName,
        DR.source,
        DR.Room,
        DR.Board,
        DR.RateName,
        DR.HotelZone,
        DR.Promo,
        DR.country,
        CAST(DR.startDate AS TIMESTAMP) AS startDatetime,
        DR.partitionTimestamp,
        DR.agent,
        DR.cancelled,
        SUM(IF(DR.cancelled, DR.price + DR.priceSupplements, 0)) as cancellations,
        MIN(B.count_busquedas) as count_busquedas,
        MIN(B.Ok) as Ok,
        MIN(B.Restrictions) as Restrictions,
        MIN(DR3.revenue_starts_today) as revenue_starts_today,
        MIN(DR3.count_starts_today) as count_starts_today,
        SUM(IF(DR.cancelled, 0, 1)) as total_reservas,
        SUM(IF(DR.cancelled, 1, 0)) as total_reservas_canceladas,
        SUM(DR.nights) as nights,
        SUM(CAST(DR.numRooms AS NUMERIC)) as num_reservas,
        SUM(
          CASE
            WHEN EXTRACT(DATE FROM DR.timestamp) >= PARSE_DATE('%Y%m%d', @DS_START_DATE) AND EXTRACT(DATE FROM DR.timestamp) <= PARSE_DATE('%Y%m%d', @DS_END_DATE)
            THEN DR.price + DR.priceSupplements
            ELSE 0
          END
        ) AS revenue,
        SUM(CAST(DR.numRooms AS NUMERIC) * DR.nights) as RN,
        AVG(
          CASE
            WHEN DR.cancelled = TRUE THEN 0
            ELSE (DR.price + DR.priceSupplements) / (IF(CAST(DR.numRooms AS NUMERIC) * DR.nights = 0, 1, CAST(DR.numRooms AS NUMERIC) * DR.nights))
          END
        ) AS ADR,
        'RESERVAS + BUSQUEDAS' as query_source
      FROM
        `bi_dataset.VIEW_DATOS_RESERVAS_6` DR
      LEFT JOIN (
        SELECT
          hotel_code,
          SUM(CASE WHEN cancelled = TRUE THEN 0 ELSE price + priceSupplements END) as revenue_starts_today,
          COUNT(*) as count_starts_today
        FROM
          `analysis-seeker.bi_dataset.VIEW_BOOKINGS_BY_START_DATE`
        WHERE
          EXTRACT(DATE FROM startDateTime) >= PARSE_DATE('%Y%m%d', @DS_START_DATE) AND EXTRACT(DATE FROM startDateTime) <= PARSE_DATE('%Y%m%d', @DS_END_DATE)
        GROUP BY
          hotel_code
      ) AS DR3 ON DR3.hotel_code = DR.hotel_code
      LEFT JOIN (
        SELECT
          hotel_code,
          COUNT(*) as count_busquedas,
          SUM(CASE WHEN result = 'OK' THEN 1 ELSE 0 END) as Ok,
          SUM(CASE WHEN result = 'RESTRICTIONS' THEN 1 ELSE 0 END) as Restrictions
        FROM
          `bi_dataset.VIEW_BUSQUEDAS`
        WHERE
          EXTRACT(DATE FROM referenceTimestamp) >= PARSE_DATE('%Y%m%d', @DS_START_DATE) AND EXTRACT(DATE FROM referenceTimestamp) <= PARSE_DATE('%Y%m%d', @DS_END_DATE)
        GROUP BY
          hotel_code
      ) AS B ON B.hotel_code = DR.hotel_code
      WHERE
        EXTRACT(DATE FROM DR.partitionTimestamp) >= PARSE_DATE('%Y%m%d', @DS_START_DATE) AND EXTRACT(DATE FROM DR.partitionTimestamp) <= PARSE_DATE('%Y%m%d', @DS_END_DATE)
      GROUP BY
        DR.hotel_code, DR.HotelName, DR.PackageName, DR.source, DR.Room, DR.Board, DR.RateName, DR.HotelZone, DR.Promo, DR.country, DR.startDate, DR.timestamp, DR.agent, DR.cancelled, DR.partitionTimestamp
  ;;
  }
}
