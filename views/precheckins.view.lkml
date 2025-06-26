# The name of this view in Looker is "Precheckins"
view: precheckins {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.PRECHECKINS` ;;

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
  measure: count {
    type: count
    drill_fields: [room_name]
  }
}

# The name of this view in Looker is "Precheckins Guests"
view: precheckins__guests {
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
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: precheckins__guests {
    type: string
    hidden: yes
    sql: precheckins__guests ;;
  }

  dimension: surname {
    type: string
    sql: surname ;;
  }
}
