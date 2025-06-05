view: map_additional_services {
  sql_table_name: `bi_dataset.MAP_ADDITIONAL_SERVICES` ;;

  dimension: hotel_code {
    type: string
    sql:  ${TABLE}.hotel_code ;;
  }


  dimension: key_map {
    type: string
    sql: ${TABLE}.key_map ;;
  }

  dimension: values_map{
    type: string
    sql: ${TABLE}.values_map ;;
  }

  dimension: keys_map_json {
    type: string
    sql: ARRAY_TO_STRING(JSON_KEYS(${TABLE}.map_json), ",") ;;
  }

  dimension: all_json_values_as_string {
    type: string
    sql:
      ARRAY_TO_STRING(
          ARRAY(SELECT TO_JSON_STRING(value) FROM UNNEST(JSON_QUERY_ARRAY(${TABLE}.map_json, '$')) AS value),
          ','
      )
    ;;
    description: "Todos los valores del array JSON en map_json, concatenados en una cadena separada por comas."
  }
}
