# Define the database connection to be used for this model.
connection: "bq_demo_c"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: bq_demo_c_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Bq Demo C"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: hotel_corporative_encrypted {}

explore: Busquedas_reservas {
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${Busquedas_reservas.hotel_code} = ${hotel_corporative_encrypted.hotel_code} and ${Busquedas_reservas.hotel_code} = ${mview_busquedas.hotel_code};;
    }
  join: mview_busquedas {
    type: left_outer
    relationship: many_to_one
    sql_on: ${Busquedas_reservas.hotel_code} = ${mview_busquedas.hotel_code} AND ${Busquedas_reservas.timestamp_date} = ${mview_busquedas.timestamp_date};;
  }
}

explore: wihp_datos_reservas{
  join:  mview_datos_reservas_6{
    type:left_outer
    relationship: many_to_many
    sql_on: ${wihp_datos_reservas.hotel_code} = ${mview_datos_reservas_6.hotel_code} ;;
  }
}

explore: mview_comparation_bookings_by_start_date {
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${mview_comparation_bookings_by_start_date.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
  }
}

explore: mview_comparation_searches {
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${mview_comparation_searches.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
  }
}
explore: ratio_conversion {}

explore: call_agent2 {}

explore: additional_services_consolidate {}

explore: boards_spanish {}

explore: call_name_agent {}

explore: call_agent_mapping2 {}

explore: board {}

explore: call_agent {}

explore: additional_service_comparation {

}

explore: call_name_agent_extend {}

explore: casuistica_hotel_code {}

explore: comission_reservations {}

explore: day_time_period {}

explore: google_hotel_group_view {}

explore: google_ads_per_country {}

explore: google_hotel_reconciliation {}

explore: funnel_stats {
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${funnel_stats.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
  }
}

explore: google_ads_campaign_data {}

explore: hotels_data {}

explore: hotels {}

explore: hotel_renaming {}

explore: hotel_revenue_target {}

explore: mview_additional_services {}

explore: mview_busquedas {
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${mview_busquedas.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
  }
}

explore: mview_prebookings {}

explore: mview_bookings_by_cancel_date {}

explore: mview_precheckins {
  join: mview_precheckins__guests {
    view_label: "Mview Precheckins: Guests"
    sql: LEFT JOIN UNNEST(${mview_precheckins.guests}) as mview_precheckins__guests ;;
    relationship: one_to_many
  }
}

explore: mview_bookings_by_start_date {
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${mview_bookings_by_start_date.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
  }
}

explore: mview_datos_reservas_6 {
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${mview_datos_reservas_6.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
  }
}

explore: mview_comparation_bookings {
  join: additional_services_consolidate {
    type: left_outer
    relationship: one_to_many
    sql_on: ${mview_comparation_bookings.identifier} = ${additional_services_consolidate.identifier} and ${mview_comparation_bookings.hotel_code} = ${additional_services_consolidate.hotel_code}  ;;
  }
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${mview_comparation_bookings.hotel_code} = ${hotel_corporative_encrypted.hotel_code} ;;
  }
}

explore: encrypted_hotel_code  {}


explore: mview_satisfaction_form_answers {}

explore: mview_satisfaction_form {}

explore: mview_satisfaction_form_text_answers {}

explore: mview_satisfaction_form_analytics {}

explore: packages {}

explore: precheckins {
  join: precheckins__guests {
    view_label: "Precheckins: Guests"
    sql: LEFT JOIN UNNEST(${precheckins.guests}) as precheckins__guests ;;
    relationship: one_to_many
  }
}

explore: rates_spanish {}

explore: promotions {}

explore: prebookings_raw {}

explore: rate {}

explore: promotions_spanish {}

explore: reservations_with_satisfaction_form {}

explore: reservations_consolidate_2 {}

explore: rooms_spanish {}

explore: reservations {}

explore: room {}

explore: satisfaction_form_analytics {}

explore: satisfaction_form {}

explore: satisfaction_form_answers {}

explore: test_export {}

explore: search_log_entry_p {}

explore: user_entry_p {}

explore: view_busquedas {}

explore: user_rescue_reservation {}

explore: view_datos_reservas_4 {}

explore: user_rescue {}

explore: wi_hp_unique {}

explore: revenue_forecast {}

explore: revenue_forecast2 {}

explore: revenue_trends {}

explore: ring2travel_calls_report {}
