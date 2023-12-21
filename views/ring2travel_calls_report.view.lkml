view: ring2travel_calls_report {

  sql_table_name: `analysis-seeker.bi_dataset.RING2TRAVEL_CALLS_REPORT`  ;;

  dimension: totla_calls{
    type: string
    sql: ${TABLE}.total_calls ;;
  }


  }
