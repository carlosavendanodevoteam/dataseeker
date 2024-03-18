connection: "google_analytics_storage"

include: "/views/*.view.lkml"


explore: events{}

explore: bookings_google_analytics {
  join:  parkroyal_costs{
    type:left_outer
    relationship: one_to_one
    sql_on: ${bookings_google_analytics.hotel_code} = ${parkroyal_costs.hotel_code} and ${bookings_google_analytics.fecha_date} = ${parkroyal_costs.fecha_date};;
  }
}

explore:  parkroyal_costs {}
