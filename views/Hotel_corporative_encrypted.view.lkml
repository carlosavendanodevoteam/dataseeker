view: hotel_corporative_encrypted {

  sql_table_name: `bi_dataset.VIEW_HOTEL_CORPORATIVE_ENCRYPTED` ;;

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
          WHEN ${TABLE}.name IS NULL then ${TABLE}.hotel_code
          else ${TABLE}.name
        END;;
  }

}
