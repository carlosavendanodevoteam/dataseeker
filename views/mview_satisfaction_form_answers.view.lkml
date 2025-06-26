# The name of this view in Looker is "Mview Satisfaction Form Answers"
view: mview_satisfaction_form_answers {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.MVIEW_COMPARATION_SATISFACTION_FORM_ANSWERS` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Answer Int" in Explore.

  dimension: answer_int {
    type: number
    sql: ${TABLE}.answer_int ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_answer_int {
    type: sum
    sql: ${answer_int} ;;
  }

  measure: average_answer_int {
    type: average
    sql: ${answer_int} ;;  }

  dimension: answer_raw {
    type: string
    sql: ${TABLE}.answer_raw ;;
  }

  dimension: booking_id {
    type: string
    sql: ${TABLE}.booking_id ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: question {
    type: string
    sql: ${TABLE}.question ;;
  }

  dimension: row_num {
    type: number
    sql: ${TABLE}.row_num ;;
  }

  dimension_group: partitionTimestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.partitionTimestamp ;;
  }

  dimension: timestamp_str {
    type: string
    sql: ${TABLE}.timestamp_str ;;
  }
  measure: count {
    type: count
  }

  dimension: last_year_form {
    type: number
    sql: ${TABLE}.last_year_form ;;
  }

  dimension: result_1{
    type: number
    sql: if(answer_int = 1, 1, 0 );;
  }

  dimension: result_2{
    type: number
    sql: if(answer_int = 2, 1, 0 );;
  }

  dimension: result_3{
    type: number
    sql: if(answer_int = 3, 1, 0 );;
  }

  dimension: result_4{
    type: number
    sql: if(answer_int = 4, 1, 0 );;
  }

  dimension: result_5{
    type: number
    sql: if(answer_int = 5, 1, 0 );;
  }

  dimension: recommend {
    type: number
    sql: CASE
      WHEN ${answer_raw} LIKE '%si%' THEN 1
      WHEN ${answer_raw} LIKE '%no%' THEN 1
      ELSE 0
      END ;;
  }

  dimension: clean_question{
    type: string
    sql: CASE
      when ${question} = '&iquest;C&oacute;mo valora la limpieza del hotel en general?' THEN "Limpieza General"
      when ${question} = '&iquest;C&oacute;mo valora la Tarjeta Cliente Best Hotels?' THEN "Tarjeta Cliente Best Hotels"
      when ${question} = '&iquest;C&oacute;mo valora la facilidad de uso de nuestra p&aacute;gina web?' THEN "Facilidad de uso de la Web"
      when ${question} = '&iquest;C&oacute;mo valora la relaci&oacute;n calidad / precio?' THEN "Relacion Calidad/Precio"
      when ${question} = '&iquest;C&oacute;mo valora la amabilidad y eficacia en la recepci&oacute;n del hotel?' THEN "Amabilidad y eficacion de recepcion"
      when ${question} = '&iquest;C&oacute;mo valora la calidad y la variedad en el bar?' THEN "Calidad y variedad en el bar"
      when ${question} = '&iquest;C&oacute;mo valora la calidad y la variedad en la gastronom&iacute;a?' THEN "Calidad y variedad gastronomica"
      when ${question} = '&iquest;C&oacute;mo valora nuestro servicio de reservas?' THEN "Servicio de reservas"
      when ${question} = '&iquest;C&oacute;mo valora la amabilidad y el servicio del personal en general?' THEN "Amabilidad y Servicio del Personal en General"
      when ${question} = 'Eficacia y rapidez durante el registro de entrada y salida del hotel' THEN "Eficacia y rapidez durante el registro de entrada y salida del hotel"
      when ${question} = 'Animación y entretenimiento' THEN 'Animación y entretenimiento'
      when ${question} = 'Ubicación del hotel' THEN "Ubicacion del hotel"
      when ${question} = 'Limpieza y estado de las instalaciones de las zonas comunes' THEN "Limpieza y estado de las instalaciones de las zonas comunes"
      when ${question} = 'Calidad y atención del personal del servicio de habitaciones' THEN "Calidad y atención del personal del servicio de habitaciones"
      when ${question} = 'Amabilidad del personal en general' THEN "Amabilidad del personal en general"
      when ${question} = 'Variedad, servicio y calidad del servicio de restauración' THEN "Variedad, servicio y calidad del servicio de restauración"
      when ${question} = 'Limpieza de habitación y baño' THEN "Limpieza de habitacion"
      when ${question} = 'Relación calidad/precio' THEN 'Relacion Calidad/Precio'
      when ${question} = 'Satisfacción general del hotel' THEN 'Satisfaccion general'
      ELSE ${question}
    END   ;;
  }

}
