view: mview_comparation_searches {
 # The name of this view in Looker is "Mview Busquedas"

  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.VIEW_COMPARATION_SEARCHES` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Account" in Explore.

  dimension_group: reference_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.referenceTimestamp ;;
  }

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: end_date {
    type: string
    sql: ${TABLE}.endDate ;;
  }


  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: promocode {
    type: string
    sql: ${TABLE}.promocode ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: partition_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.partitionTimestamp ;;
  }

  dimension: result {
    type: string
    sql: ${TABLE}.result ;;
  }

  dimension: source_fixed {
    type: string
    sql: Case
          When upper(${TABLE}.source_fixed) = 'CALLCENTER' THEN 'Callseeker';;

  }

  dimension_group: start_date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: cast(${TABLE}.startDate as timestamp) ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp ;;
  }

  measure: count {
    type: count
    drill_fields: [hotel_code]
  }

  measure: OK{
    type: sum
    sql: CASE
          WHEN ${TABLE}.result ='OK' THEN 1
          ELSE 0
  END ;;
  }

  measure: Restrictions{
    type: sum
    sql: CASE
          WHEN ${TABLE}.result ='RESTRICTIONS' THEN 1
          ELSE 0
  END ;;
  }

  measure: NO_RATE{
    type: sum
    sql: CASE
          WHEN ${TABLE}.result ='NO_RATE' THEN 1
          ELSE 0
  END ;;
  }

  measure:  no_availability{
    type: sum
    sql: CASE
          WHEN ${TABLE}.result ='NO_AVAILABILITY' THEN 1
          ELSE 0
  END ;;
  }
  dimension: nights{
    type: number
    sql: date_diff(cast(${TABLE}.endDate as timestamp), cast(${TABLE}.startDate as timestamp), day) ;;
  }

  dimension: last_year_searches{
    type: number
    sql: ${TABLE}.last_year_searches;;
  }

  dimension_group: comparation_partitiontimestamp_without_future{
    type: time
    sql: IF(${last_year_searches} = 0, ${TABLE}.partitionTimestamp,
      CASE
        WHEN CAST(${TABLE}.partitionTimestamp AS timestamp) > CURRENT_TIMESTAMP() THEN NULL
        ELSE CAST(${TABLE}.partitionTimestamp AS timestamp)
      END);;
    timeframes: [raw, time, date, week, month, quarter, year]
  }


  dimension: year{
    type: number
    sql:  EXTRACT(YEAR FROM ${TABLE}.timestamp) ;;
  }

  dimension_group: comparation_startDate{
    type: time
    timeframes: [raw, time, date, week, month, month_name, quarter, year]
    sql: cast(${TABLE}.startDate as timestamp)  ;;
  }

  dimension_group: comparation_endDate{
    type: time
    sql:  CASE
        WHEN TIMESTAMP_ADD(${TABLE}.endDate, INTERVAL 365 DAY) > CURRENT_TIMESTAMP() THEN NULL
        ELSE TIMESTAMP_ADD(${TABLE}.endDate, INTERVAL 365 DAY)
      END ;;
  }


  dimension: source_grouped {
    type: string
    sql: CASE
          WHEN ${TABLE}.source_fixed LIKE '%allcenter%' THEN 'Callseeker'
          WHEN lower(${TABLE}.source_fixed) = 'mobile' or lower(${TABLE}.source_fixed) = 'web' THEN 'Organic'
          When lower(${TABLE}.source_fixed) like 'rescue%' then 'Rescue-seeker'
          ELSE 'MetaSearch'
        END ;;
  }

  dimension: source_fixed_with_Ring2travel{
    type: string
    sql: CASE
          WHEN ${TABLE}.agent LIKE '%agente%' AND ${TABLE}.agent not LIKE '%-nau%' AND ${TABLE}.source_fixed LIKE '%Callcenter%' THEN 'Ring2travel'
          WHEN ${TABLE}.source_fixed like '%Callcenter%' then 'Callcenter'
          ELSE ${TABLE}.source_fixed
        END ;;
  }

  measure: sumatoria {
    type: number
    sql: ${OK}+${Restrictions} ;;
  }

}
