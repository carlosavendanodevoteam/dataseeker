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

persist_with: bq_demo_c_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Bq Demo C"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: Busquedas_reservas {
  join: mview_busquedas {
    type: left_outer
    relationship: many_to_one
    sql_on: ${Busquedas_reservas.hotel_code} = ${mview_busquedas.hotel_code} AND ${Busquedas_reservas.timestamp_date} = ${mview_busquedas.timestamp_date}
    ;;
  }
}

explore: wihp_datos_reservas{
  join:  mview_datos_reservas_6{
    type:left_outer
    relationship: many_to_one
    sql_on:  ${wihp_datos_reservas.hotel_code} = ${mview_datos_reservas_6.hotel_code};;
  }
}

explore: ratio_conversion {
  join: mview_busquedas {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${mview_busquedas.hotel_code} = ${ratio_conversion.hotel_code} AND ${mview_busquedas.reference_timestamp_date} = ${ratio_conversion.timestamp_date} ;;
  }
}

explore: call_agent2 {}

explore: additional_services_consolidate {}

explore: boards_spanish {}

explore: call_name_agent {}

explore: call_agent_mapping2 {}

explore: board {}

explore: call_agent {}

explore: additional_services {
  join: view_datos_reservas_4 {
    type: left_outer
    relationship: one_to_one
    sql_on: ${additional_services.hotel_code}=${view_datos_reservas_4.hotel_code} ;;
  }
}

explore: costa_del_sol_data_search_20220531 {}

explore: costal_del_sol_rsv_data_20211005 {}

explore: call_name_agent_extend {}

explore: casuistica_hotel_code {}

explore: costa_del_sol_data_20220111 {}

explore: costa_del_sol_data_rsv_export {}

explore: costa_del_sol_data_search_20220329 {}

explore: comission_reservations {}

explore: costa_del_sol_data_search_20220913 {}

explore: costa_del_sol_rsv_data {}

explore: costa_del_sol_rsv_data_2 {}

explore: costa_del_sol_data_search_20230711 {}

explore: costa_del_sol_rsv_data_20210915 {}

explore: costa_del_sol_data_search_20220614 {}

explore: costa_del_sol_hotels {}

explore: costa_del_sol_rsv_data_20210927 {}

explore: costa_del_sol_rsv_data_20211005 {}

explore: costa_del_sol_rsv_data_20211019 {}

explore: costa_del_sol_rsv_data_20211026 {}

explore: costa_del_sol_rsv_data_20211116 {}

explore: costa_del_sol_rsv_data_20211123 {}

explore: costa_del_sol_rsv_data_20211105 {}

explore: costa_del_sol_rsv_data_20211130 {}

explore: costa_del_sol_rsv_data_20211214 {}

explore: costa_del_sol_rsv_data_20211207 {}

explore: costa_del_sol_rsv_data_20211221 {}

explore: costa_del_sol_rsv_data_20220104 {}

explore: costa_del_sol_rsv_data_20211228 {}

explore: costa_del_sol_rsv_data_20212812 {}

explore: costa_del_sol_rsv_data_20220111 {}

explore: costa_del_sol_rsv_data_20220208 {}

explore: costa_del_sol_rsv_data_20220125 {}

explore: costa_del_sol_rsv_data_20211109 {}

explore: costa_del_sol_rsv_data_20220118 {}

explore: costa_del_sol_rsv_data_20220201 {}

explore: costa_del_sol_rsv_data_20220215 {}

explore: costa_del_sol_rsv_data_20220222 {}

explore: costa_del_sol_rsv_data_20220308 {}

explore: costa_del_sol_rsv_data_20220315 {}

explore: costa_del_sol_rsv_data_20220301 {}

explore: costa_del_sol_rsv_data_20220329 {}

explore: costa_del_sol_rsv_data_20220322 {}

explore: costa_del_sol_rsv_data_20220405 {}

explore: costa_del_sol_rsv_data_20220419 {}

explore: costa_del_sol_rsv_data_20220426 {}

explore: costa_del_sol_rsv_data_20220503 {}

explore: costa_del_sol_rsv_data_20220412 {}

explore: costa_del_sol_rsv_data_20220510 {}

explore: costa_del_sol_rsv_data_20220517 {}

explore: costa_del_sol_rsv_data_20220524 {}

explore: costa_del_sol_rsv_data_20220511 {}

explore: costa_del_sol_rsv_data_20220531 {}

explore: costa_del_sol_rsv_data_20220607 {}

explore: costa_del_sol_rsv_data_20220628 {}

explore: costa_del_sol_rsv_data_20220621 {}

explore: costa_del_sol_rsv_data_20220614 {}

explore: costa_del_sol_rsv_data_20220705 {}

explore: costa_del_sol_rsv_data_20220712 {}

explore: costa_del_sol_rsv_data_20220719 {}

explore: costa_del_sol_rsv_data_20220809 {}

explore: costa_del_sol_rsv_data_20220726 {}

explore: costa_del_sol_rsv_data_20220802 {}

explore: costa_del_sol_rsv_data_20220816 {}

explore: costa_del_sol_rsv_data_20220913 {}

explore: costa_del_sol_rsv_data_20220823 {}

explore: costa_del_sol_rsv_data_20220830 {}

explore: costa_del_sol_rsv_data_20220906 {}

explore: costa_del_sol_rsv_data_20220927 {}

explore: costa_del_sol_rsv_data_20220920 {}

explore: costa_del_sol_rsv_data_20221025 {}

explore: costa_del_sol_rsv_data_20221004 {}

explore: costa_del_sol_rsv_data_20221018 {}

explore: costa_del_sol_rsv_data_20221116 {}

explore: costa_del_sol_rsv_data_20221011 {}

explore: costa_del_sol_rsv_data_20221102 {}

explore: costa_del_sol_rsv_data_20221207 {}

explore: costa_del_sol_rsv_data_20221108 {}

explore: costa_del_sol_rsv_data_20221122 {}

explore: costa_del_sol_rsv_data_20221129 {}

explore: costa_del_sol_rsv_data_20230103 {}

explore: costa_del_sol_rsv_data_20221227 {}

explore: costa_del_sol_rsv_data_20221220 {}

explore: costa_del_sol_rsv_data_20221213 {}

explore: costa_del_sol_rsv_data_20230124 {}

explore: costa_del_sol_rsv_data_20230110 {}

explore: costa_del_sol_rsv_data_20230131 {}

explore: costa_del_sol_rsv_data_20230117 {}

explore: costa_del_sol_rsv_data_20230207 {}

explore: costa_del_sol_rsv_data_20230301 {}

explore: costa_del_sol_rsv_data_20230307 {}

explore: costa_del_sol_rsv_data_20230221 {}

explore: costa_del_sol_rsv_data_20230214 {}

explore: costa_del_sol_rsv_data_20230329 {}

explore: costa_del_sol_rsv_data_20230404 {}

explore: costa_del_sol_rsv_data_20230314 {}

explore: costa_del_sol_rsv_data_20230418 {}

explore: costa_del_sol_rsv_data_20230411 {}

explore: costa_del_sol_rsv_data_20230517 {}

explore: costa_del_sol_rsv_data_20230509 {}

explore: costa_del_sol_rsv_data_20230606 {}

explore: costa_del_sol_rsv_data_20230426 {}

explore: costa_del_sol_rsv_data_20230502 {}

explore: costa_del_sol_rsv_data_20230531 {}

explore: costa_del_sol_rsv_data_20230627 {}

explore: costa_del_sol_rsv_data_20230704 {}

explore: costa_del_sol_rsv_data_20230619 {}

explore: costa_del_sol_rsv_data_20230719 {}

explore: costa_del_sol_rsv_data_20230711 {}

explore: costa_del_sol_rsv_search_20230621 {}

explore: costa_del_sol_rsv_data_20230725 {}

explore: costa_del_sol_search_20211005 {}

explore: costa_del_sol_rsv_data_20230801 {}

explore: costa_del_sol_rsv_data_20230808 {}

explore: costa_del_sol_search_data {}

explore: costa_del_sol_search_data_20210927 {}

explore: costa_del_sol_search_data_20211014 {}

explore: costa_del_sol_search_data_20211005 {}

explore: costa_del_sol_search_data_20211026 {}

explore: costa_del_sol_search_data_20211019 {}

explore: costa_del_sol_search_data_20211116 {}

explore: costa_del_sol_search_data_20211123 {}

explore: costa_del_sol_search_data_20211207 {}

explore: costa_del_sol_search_data_20211109 {}

explore: costa_del_sol_search_data_20211214 {}

explore: costa_del_sol_search_data_20211130 {}

explore: costa_del_sol_search_data_20211221 {}

explore: costa_del_sol_search_data_20211228 {}

explore: costa_del_sol_search_data_20220111 {}

explore: costa_del_sol_search_data_20220118 {}

explore: costa_del_sol_search_data_20211412 {}

explore: costa_del_sol_search_data_20220104 {}

explore: costa_del_sol_search_data_20220125 {}

explore: costa_del_sol_search_data_20220201 {}

explore: costa_del_sol_search_data_20220208 {}

explore: costa_del_sol_search_data_20220215 {}

explore: costa_del_sol_search_data_20220222 {}

explore: costa_del_sol_search_data_20220301 {}

explore: costa_del_sol_search_data_20220322 {}

explore: costa_del_sol_search_data_20220315 {}

explore: costa_del_sol_search_data_20220308 {}

explore: costa_del_sol_search_data_20220329 {}

explore: costa_del_sol_search_data_20220405 {}

explore: costa_del_sol_search_data_20220419 {}

explore: costa_del_sol_search_data_20220426 {}

explore: costa_del_sol_search_data_20220503 {}

explore: costa_del_sol_search_data_20220510 {}

explore: costa_del_sol_search_data_20220412 {}

explore: costa_del_sol_search_data_20220517 {}

explore: costa_del_sol_search_data_20220524 {}

explore: costa_del_sol_search_data_20220531 {}

explore: costa_del_sol_search_data_20220621 {}

explore: costa_del_sol_search_data_20220607 {}

explore: costa_del_sol_search_data_20220628 {}

explore: costa_del_sol_search_data_20220712 {}

explore: costa_del_sol_search_data_20220719 {}

explore: costa_del_sol_search_data_20220705 {}

explore: costa_del_sol_search_data_20220809 {}

explore: costa_del_sol_search_data_20220816 {}

explore: costa_del_sol_search_data_20220802 {}

explore: costa_del_sol_search_data_20220726 {}

explore: costa_del_sol_search_data_20220823 {}

explore: costa_del_sol_search_data_20220906 {}

explore: costa_del_sol_search_data_20220913 {}

explore: costa_del_sol_search_data_20220920 {}

explore: costa_del_sol_search_data_20220927 {}

explore: costa_del_sol_search_data_20220830 {}

explore: costa_del_sol_search_data_20221004 {}

explore: costa_del_sol_rsv_data_20230523 {}

explore: costa_del_sol_search_data_20221025 {}

explore: costa_del_sol_search_data_20221108 {}

explore: costa_del_sol_search_data_20221011 {}

explore: costa_del_sol_search_data_20221102 {}

explore: costa_del_sol_search_data_20221116 {}

explore: costa_del_sol_search_data_20221018 {}

explore: costa_del_sol_search_data_20221122 {}

explore: costa_del_sol_search_data_20221129 {}

explore: costa_del_sol_search_data_20221207 {}

explore: costa_del_sol_search_data_20221213 {}

explore: costa_del_sol_search_data_20230110 {}

explore: costa_del_sol_search_data_20230103 {}

explore: costa_del_sol_search_data_20221220 {}

explore: costa_del_sol_search_data_20230124 {}

explore: costa_del_sol_search_data_20230131 {}

explore: costa_del_sol_search_data_20230207 {}

explore: costa_del_sol_search_data_20230214 {}

explore: costa_del_sol_search_data_202303007 {}

explore: costa_del_sol_search_data_20230221 {}

explore: costa_del_sol_search_data_20230314 {}

explore: costa_del_sol_search_data_20230117 {}

explore: costa_del_sol_search_data_20230301 {}

explore: costa_del_sol_search_data_20230321 {}

explore: costa_del_sol_search_data_20230328 {}

explore: costa_del_sol_search_data_20230411 {}

explore: costa_del_sol_search_data_20230404 {}

explore: costa_del_sol_search_data_20230426 {}

explore: costa_del_sol_search_data_20230531 {}

explore: costa_del_sol_search_data_20230509 {}

explore: costa_del_sol_search_data_20230523 {}

explore: costa_del_sol_search_data_20221227 {}

explore: costa_del_sol_search_data_20230418 {}

explore: costa_del_sol_search_data_20230517 {}

explore: costa_del_sol_search_data_20230502 {}

explore: costa_del_sol_search_data_20230606 {}

explore: costa_del_sol_search_data_20230619 {}

explore: costa_del_sol_search_data_20230621 {}

explore: costa_del_sol_search_data_20230627 {}

explore: costa_del_sol_search_data_20230725 {}

explore: costa_del_sol_search_data_20230719 {}

explore: costa_del_sol_search_data_20230704 {}

explore: costa_del_sol_search_data_20230711 {}

explore: costa_del_sol_search_data_20230808 {}

explore: costa_del_sol_search_data_20230801 {}

explore: costa_de_sol_rsv_data_20210927 {}

explore: costa_del_sol_search_data_2023_02_21 {}

explore: day_time_period {}

explore: google_hotel_group_view {}

explore: google_ads_per_country {}

explore: google_hotel_reconciliation {}

explore: funnel_stats {}

explore: google_ads_campaign_data {}

explore: hotels_data {}

explore: hotels {}

explore: hotel_renaming {}

explore: hotel_revenue_target {}

explore: mview_additional_services {}

explore: mview_busquedas {}

explore: mview_prebookings {}

explore: mview_bookings_by_cancel_date {}

explore: mview_precheckins {
    join: mview_precheckins__guests {
      view_label: "Mview Precheckins: Guests"
      sql: LEFT JOIN UNNEST(${mview_precheckins.guests}) as mview_precheckins__guests ;;
      relationship: one_to_many
    }
}

explore: mview_bookings_by_start_date {}

explore: mview_datos_reservas_6 {}

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

explore: z_to_delete_acumulado_anual {}

explore: wi_hp_api {}

explore: z_to_delete_acumulado_d_m_y {}

explore: z_to_delete_acumulado_otb_d_m_y {}

explore: z_to_delete_acumulado_diario {}

explore: z_to_delete_acumulado_mensual {}

explore: view_datos_reservas_5 {}

explore: z_to_delete_call_agent_mapping3 {}

explore: z_to_delete_best_satisfaction_form_sent {}

explore: z_to_delete_budget {}

explore: z_to_delete_big_query_bills {
    join: z_to_delete_big_query_bills__labels {
      view_label: "Z To Delete Big Query Bills: Labels"
      sql: LEFT JOIN UNNEST(${z_to_delete_big_query_bills.labels}) as z_to_delete_big_query_bills__labels ;;
      relationship: one_to_many
    }
    join: z_to_delete_big_query_bills__timeline {
      view_label: "Z To Delete Big Query Bills: Timeline"
      sql: LEFT JOIN UNNEST(${z_to_delete_big_query_bills.timeline}) as z_to_delete_big_query_bills__timeline ;;
      relationship: one_to_many
    }
    join: z_to_delete_big_query_bills__job_stages {
      view_label: "Z To Delete Big Query Bills: Job Stages"
      sql: LEFT JOIN UNNEST(${z_to_delete_big_query_bills.job_stages}) as z_to_delete_big_query_bills__job_stages ;;
      relationship: one_to_many
    }
    join: z_to_delete_big_query_bills__referenced_tables {
      view_label: "Z To Delete Big Query Bills: Referenced Tables"
      sql: LEFT JOIN UNNEST(${z_to_delete_big_query_bills.referenced_tables}) as z_to_delete_big_query_bills__referenced_tables ;;
      relationship: one_to_many
    }
    join: z_to_delete_big_query_bills__job_stages__steps {
      view_label: "Z To Delete Big Query Bills: Job Stages Steps"
      sql: LEFT JOIN UNNEST(${z_to_delete_big_query_bills__job_stages.steps}) as z_to_delete_big_query_bills__job_stages__steps ;;
      relationship: one_to_many
    }
    join: z_to_delete_big_query_bills__job_stages__input_stages {
      view_label: "Z To Delete Big Query Bills: Job Stages Input Stages"
      sql: LEFT JOIN UNNEST(${z_to_delete_big_query_bills__job_stages.input_stages}) as z_to_delete_big_query_bills__job_stages__input_stages ;;
      relationship: one_to_many
    }
    join: z_to_delete_big_query_bills__job_stages__steps__substeps {
      view_label: "Z To Delete Big Query Bills: Job Stages Steps Substeps"
      sql: LEFT JOIN UNNEST(${z_to_delete_big_query_bills__job_stages__steps.substeps}) as z_to_delete_big_query_bills__job_stages__steps__substeps ;;
      relationship: one_to_many
    }
    join: z_to_delete_big_query_bills__bi_engine_statistics__bi_engine_reasons {
      view_label: "Z To Delete Big Query Bills: Bi Engine Statistics Bi Engine Reasons"
      sql: LEFT JOIN UNNEST(${z_to_delete_big_query_bills.bi_engine_statistics__bi_engine_reasons}) as z_to_delete_big_query_bills__bi_engine_statistics__bi_engine_reasons ;;
      relationship: one_to_many
    }
    join: z_to_delete_big_query_bills__materialized_view_statistics__materialized_view {
      view_label: "Z To Delete Big Query Bills: Materialized View Statistics Materialized View"
      sql: LEFT JOIN UNNEST(${z_to_delete_big_query_bills.materialized_view_statistics__materialized_view}) as z_to_delete_big_query_bills__materialized_view_statistics__materialized_view ;;
      relationship: one_to_many
    }
    join: z_to_delete_big_query_bills__query_info__performance_insights__stage_performance_change_insights {
      view_label: "Z To Delete Big Query Bills: Query Info Performance Insights Stage Performance Change Insights"
      sql: LEFT JOIN UNNEST(${z_to_delete_big_query_bills.query_info__performance_insights__stage_performance_change_insights}) as z_to_delete_big_query_bills__query_info__performance_insights__stage_performance_change_insights ;;
      relationship: one_to_many
    }
    join: z_to_delete_big_query_bills__query_info__performance_insights__stage_performance_standalone_insights {
      view_label: "Z To Delete Big Query Bills: Query Info Performance Insights Stage Performance Standalone Insights"
      sql: LEFT JOIN UNNEST(${z_to_delete_big_query_bills.query_info__performance_insights__stage_performance_standalone_insights}) as z_to_delete_big_query_bills__query_info__performance_insights__stage_performance_standalone_insights ;;
      relationship: one_to_many
    }
}

explore: z_to_delete_external_call_agent {}

explore: z_to_delete_call_agent_mapping {}

explore: z_to_delete_prebookings_consolidate {}

explore: z_to_delete_reservations_consolidate {}

explore: z_to_delete_roi {}

explore: z_to_delete_satisfaction_form_text_answers {}

explore: z_to_delete_revenue_reservas {}

explore: z_to_delete_reservation_extra_info {}

explore: z_to_delete_reservation_consolidate {}

explore: z_to_delete_status_call {}

explore: z_to_delete_view_datos_reservas_4_old_copy {}

explore: z_to_delete_search_log_entry {}
