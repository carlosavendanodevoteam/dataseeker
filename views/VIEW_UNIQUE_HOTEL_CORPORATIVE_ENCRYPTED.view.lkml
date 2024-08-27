view: view_unique_hotel_corporative_encrypted {

  sql_table_name: `bi_dataset.VIEW_UNIQUE_HOTEL_CORPORATIVE_ENCRYPTED` ;;

  dimension: corporative_hotel_code {
    type: string
    sql: ${TABLE}.corporative_hotel_code ;;
  }

  dimension: hotel_code {
    type: string
    sql:  ${TABLE}.hotel_code ;;
  }

  dimension: hotel_code_encrypted {
    type: string
    sql:${TABLE}.hotel_code_encrypted ;;
    suggestable: no
  }

  dimension: corporative_hotel_code_encrypted {
    type: string
    sql: ${TABLE}.corporative_hotel_code_encrypted ;;
    suggestable: no
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: name_fixed {
    type: string
    sql: CASE
          WHEN ${name} IS NULL then ${hotel_code}
          else ${name}
        END;;
  }

  measure: count_hotels_in_corpo{
    type: count_distinct
    sql: ${hotel_code} ;;
  }

}
