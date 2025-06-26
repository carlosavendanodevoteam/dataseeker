# The name of this view in Looker is "Ring2 Travel Agents Report"
view: ring2_travel_agents_report {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.RING2TRAVEL_AGENTS_REPORT` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: Event_Date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Event_Date ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Event Subtype" in Explore.

  dimension: event_subtype {
    type: string
    sql: ${TABLE}.Event_Subtype ;;
  }

  dimension: event_subtype_id {
    type: string
    sql: ${TABLE}.Event_Subtype_Id ;;
  }

  dimension: event_subtype_name {
    type: string
    sql: ${TABLE}.Event_Subtype_Name ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.Event_Type ;;
  }

  dimension: id_del_grupo_de_agentes {
    type: string
    sql: ${TABLE}.ID_del_Grupo_de_Agentes ;;
  }

  dimension: id_del_perfil {
    type: string
    sql: ${TABLE}.ID_del_Perfil ;;
  }

  dimension: nombre_del_grupo_de_agentes {
    type: string
    sql: ${TABLE}.Nombre_del_Grupo_de_Agentes ;;
  }

  dimension: nombre_del_perfil {
    type: string
    sql: ${TABLE}.Nombre_del_Perfil ;;
  }

  dimension: user_full_name {
    type: string
    sql: ${TABLE}.User_Full_Name ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.User_Id ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.Username ;;
  }
  measure: count {
    type: count
    drill_fields: [event_subtype_name, username, user_full_name]
  }

  dimension: login_timestamp {
    type: date
    sql: CASE WHEN ${event_type} = 'login' and ${event_subtype} = 'voice-channel' THEN ${Event_Date_time} ELSE NULL END ;;
  }

  dimension: logout_timestamp {
    type: date
    sql: CASE WHEN ${event_type} = 'logout' and ${event_subtype} = 'voice-channel' THEN ${Event_Date_time} ELSE NULL END ;;
  }

# Medida para calcular la diferencia en horas entre login y logout
  measure: hours_between_login_logout {
    type: number
    sql: TIMESTAMP_DIFF(
         MAX(CASE WHEN ${event_type} = 'logout' THEN ${Event_Date_time} END),
         MIN(CASE WHEN ${event_type} = 'login' THEN ${Event_Date_time} END),
         HOUR
       ) ;;
  }
}
