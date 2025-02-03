# The name of this view in Looker is "Mview Precheckins"
view: mview_precheckins {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.MVIEW_PRECHECKINS` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "External Identifier" in Explore.

  dimension: external_identifier {
    type: string
    sql: ${TABLE}.external_identifier ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: guests {
    hidden: yes
    sql: ${TABLE}.guests ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: id_precheckin_config {
    type: string
    sql: ${TABLE}.id_precheckin_config ;;
  }

  dimension: identifier {
    type: string
    sql: ${TABLE}.identifier ;;
  }

  dimension: insertion_date {
    type: string
    sql: ${TABLE}.insertion_date ;;
  }

  dimension_group: modified {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.modified_at ;;
  }

  dimension: rate_name {
    type: string
    sql: ${TABLE}.RateName ;;
  }

  dimension_group: reference_timestamp {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.referenceTimestamp ;;
  }

  dimension: room_id {
    type: string
    sql: ${TABLE}.room_id ;;
  }

  dimension: room_name {
    type: string
    sql: ${TABLE}.room_name ;;
  }

  dimension: room_ocupancy {
    type: string
    sql: ${TABLE}.room_ocupancy ;;
  }

  dimension: row_num {
    type: number
    sql: ${TABLE}.row_num ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_row_num {
    type: sum
    sql: ${row_num} ;;  }
  measure: average_row_num {
    type: average
    sql: ${row_num} ;;  }
  measure: count {
    type: count
    drill_fields: [rate_name, room_name]
  }
}

# The name of this view in Looker is "Mview Precheckins Guests"
view: mview_precheckins__guests {
  drill_fields: [guest_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: guest_id {
    primary_key: yes
    type: string
    sql: guest_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Age Qualifying Code" in Explore.

  dimension: age_qualifying_code {
    type: string
    sql: age_qualifying_code ;;
  }

  dimension: birth_date {
    type: string
    sql: birth_date ;;
  }

  dimension: city {
    type: string
    sql: city ;;
  }

  dimension: comunidad {
    type: string
    sql: comunidad ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: country ;;
  }

  dimension: document_expedition {
    type: string
    sql: document_expedition ;;
  }

  dimension: document_id {
    type: string
    sql: document_id ;;
  }

  dimension: document_type {
    type: string
    sql: document_type ;;
  }

  dimension: email {
    type: string
    sql: email ;;
  }

  dimension: gender {
    type: string
    sql: gender ;;
  }

  dimension: guest_type {
    type: string
    sql: guest_type ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: mview_precheckins__guests {
    type: string
    hidden: yes
    sql: mview_precheckins__guests ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order {
    type: string
    sql: `order` ;;
  }

  dimension: person_id {
    type: string
    sql: person_id ;;
  }

  dimension: phone {
    type: string
    sql: phone ;;
  }

  dimension: posible_logotype {
    type: string
    sql: posible_logotype ;;
  }

  dimension: postal_code {
    type: string
    sql: postal_code ;;
  }

  dimension: surname {
    type: string
    sql: surname ;;
  }
}
