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

explore: mview_parkroyal_all_marketing {}

explore: wi_hp_gha_bookings_identifier_fixed{}

explore: mview_gha_bookings {
  join:  wi_hp_gha_bookings_identifier_fixed{
    type: left_outer
    relationship: one_to_one
    sql_on:${mview_gha_bookings.identifier} = ${wi_hp_gha_bookings_identifier_fixed.identifier} and ${mview_gha_bookings.hotel_code} = ${wi_hp_gha_bookings_identifier_fixed.hotel_code}  ;;
  }
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${mview_gha_bookings.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
  }
}

explore: view_comparation_funnel_stats {
  join:  hotel_corporative_encrypted{
    type: inner
    relationship: many_to_one
    sql_on: ${view_comparation_funnel_stats.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
}}


explore: mview_global_lead_time_stats {
  join: hotel_corporative_encrypted{
    type: inner
    relationship: one_to_one
    sql_on: ${mview_global_lead_time_stats.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
  }
}

explore: view_searches_by_start_date {
  join: hotel_corporative_encrypted{
    type: inner
    relationship: many_to_one
    sql_on: ${view_searches_by_start_date.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
    }
  }

explore: agent_work_time {}

explore: summum_datos_reservas {}

explore: total_work_time {}

explore: DATOS_RESERVAS_GHA_2023 {
  join: view_unique_hotel_corporative_encrypted{
    type: inner
    relationship: many_to_one
    sql_on: ${DATOS_RESERVAS_GHA_2023.hotel_code} = ${view_unique_hotel_corporative_encrypted.hotel_code};;
  }
}

explore: rescue_seeker_log {
  join:  view_unique_hotel_corporative_encrypted{
    type: inner
    relationship: many_to_one
    sql_on: ${rescue_seeker_log.hotel_code} = ${view_unique_hotel_corporative_encrypted.hotel_code};;
  }
}

explore: mview_users {
  join:  view_unique_hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${mview_users.hotel_code} = ${view_unique_hotel_corporative_encrypted.corporative_hotel_code};;
  }
}

explore: mview_horario_r2t {}

explore: hotel_ads_data {}

explore: ring2_travel_agents_report {}

explore: view_unique_hotel_corporative_encrypted {}

explore:mview_comparation_unique_bookings {
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${mview_comparation_unique_bookings.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
  }
  join: hotels_data {
    type: inner
    relationship: many_to_one
    sql_on: ${mview_comparation_unique_bookings.hotel_code} = ${hotels_data.hotel_code};;
  }
}

explore: hotel_corporative_encrypted {}

explore: mview_campaign_data {
  join: view_unique_hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${mview_campaign_data.hotel_code} = ${view_unique_hotel_corporative_encrypted.hotel_code};;
  }
  join: hotels_data {
    type: inner
    relationship: many_to_one
    sql_on: ${mview_campaign_data.hotel_code} = ${hotels_data.hotel_code};;
  }
}

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
  join: view_unique_hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${wihp_datos_reservas.hotel_code} = ${view_unique_hotel_corporative_encrypted.hotel_code};;
  }
}

explore: view_datos_reservas_gha_2023_2024 {
  join: view_unique_hotel_corporative_encrypted{
    type: inner
    relationship: many_to_one
    sql_on: ${view_datos_reservas_gha_2023_2024.hotel_code} = ${view_unique_hotel_corporative_encrypted.hotel_code};;
  }
}

explore: mview_comparation_bookings_by_start_date {
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${mview_comparation_bookings_by_start_date.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
  }
  join: hotels_data {
    type: inner
    relationship: many_to_one
    sql_on: ${mview_comparation_bookings_by_start_date.hotel_code} = ${hotels_data.hotel_code};;
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

explore: additional_service_comparation {}

explore: call_name_agent_extend {}

explore: casuistica_hotel_code {}

explore: comission_reservations {}

explore: day_time_period {}

explore: google_hotel_group_view {}

explore: google_ads_per_country {}

explore: google_hotel_reconciliation {}

explore: forms {
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${forms.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
  }
}


explore: funnel_stats {
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${funnel_stats.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
  }
}

explore: google_ads_campaign_data {}

explore: hotels_data {
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${hotels_data.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
  }
}

explore: revenue_evolution_by_week {
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${revenue_evolution_by_week.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
  }
}

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
  join: mview_datos_reservas_6 {
    type: left_outer
    relationship: many_to_many
    sql_on: ${mview_precheckins.hotel_code} = ${mview_datos_reservas_6.hotel_code} and ${mview_precheckins.identifier}=${mview_datos_reservas_6.identifier};;
  }
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${mview_precheckins.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
  }
}

explore: mview_bookings_by_start_date {
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${mview_bookings_by_start_date.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
  }
  join: hotels_data {
    type: inner
    relationship: many_to_one
    sql_on: ${mview_bookings_by_start_date.hotel_code} = ${hotels_data.hotel_code};;
  }
}

explore: mview_datos_reservas_6 {
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${mview_datos_reservas_6.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
  }
  join: hotels_data {
    type: inner
    relationship: many_to_one
    sql_on: ${mview_datos_reservas_6.hotel_code} = ${hotels_data.hotel_code};;
  }
}

explore: mview_comparation_bookings {
  join: additional_services_consolidate {
    type: left_outer
    relationship: one_to_many
    sql_on: ${mview_comparation_bookings.identifier} = ${additional_services_consolidate.identifier} and ${mview_comparation_bookings.hotel_code} = ${additional_services_consolidate.hotel_code} ;;
  }
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${mview_comparation_bookings.hotel_code} = ${hotel_corporative_encrypted.hotel_code} ;;
  }
  join: hotels_data {
    type: left_outer
    relationship: many_to_one
    sql_on: ${mview_comparation_bookings.hotel_code} = ${hotels_data.hotel_code} ;;
  }
}

explore: encrypted_hotel_code  {}


explore: mview_satisfaction_form_answers {
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${mview_satisfaction_form_answers.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
  }
}

explore: mview_satisfaction_form {}

explore: mview_satisfaction_form_text_answers {
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${mview_satisfaction_form_text_answers.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
  }
}

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

explore: reservations_with_satisfaction_form {
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${reservations_with_satisfaction_form.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
  }
}

explore: reservations_consolidate_2 {}

explore: manager_change_history {
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${manager_change_history.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
  }
}

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

explore: wi_hp_unique {
  join: view_unique_hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${wi_hp_unique.hotel_code} = ${view_unique_hotel_corporative_encrypted.hotel_code};;
  }
}

explore: revenue_forecast {}

explore: revenue_forecast2 {}

explore: revenue_trends {
  join: hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${revenue_trends.hotel_code} = ${hotel_corporative_encrypted.hotel_code};;
  }
  join:  hotels_data{
    type: inner
    relationship: many_to_one
    sql_on: ${revenue_trends.hotel_code} = ${hotels_data.hotel_code};;
  }
}

explore: ring2travel_calls_report {}

explore: ratecheck_log {
  join: mview_datos_reservas_6 {
    type: inner
    relationship: one_to_one
    sql_on: ${ratecheck_log.booking_id} = ${mview_datos_reservas_6.identifier} ;;
  }
  join:  view_unique_hotel_corporative_encrypted{
    type: inner
    relationship: many_to_one
    sql_on: ${ratecheck_log.hotel_code} = ${view_unique_hotel_corporative_encrypted.hotel_code};;
  }

}

explore: ClickUp_task {
  join: tracking {
    type: left_outer
    relationship: many_to_many
    sql_on: ${ClickUp_task.task_id} = ${tracking.task_id}  ;;
  }
  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${ClickUp_task.user_id} = ${users.user_id};;
  }
}

explore: parkroyal_2024budget_fixed {}

explore: google_hotel_center{}
