connection: "google_analytics_storage"

include: "/views/*.view.lkml"

explore: Ga_hotel_corporative_encrypted {}

explore: events{}

explore:  parkroyal_costs {
  join: Ga_hotel_corporative_encrypted {
    type: left_outer
    relationship: one_to_one
    sql_on: ${parkroyal_costs.hotel_code} = ${Ga_hotel_corporative_encrypted.hotel_code};;
  }
}

explore: bookings_google_analytics {
  join:  parkroyal_costs{
    type:left_outer
    relationship: many_to_one
    sql_on: ${bookings_google_analytics.hotel_code} = ${parkroyal_costs.hotel_code} and ${bookings_google_analytics.date_date} = ${parkroyal_costs.date_date};;
  }
  join: Ga_hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${bookings_google_analytics.hotel_code} = ${Ga_hotel_corporative_encrypted.hotel_code};;
  }
}
