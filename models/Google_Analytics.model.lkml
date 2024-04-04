connection: "google_analytics_storage"

include: "/views/*.view.lkml"

explore: Ga_hotel_corporative_encrypted {}

explore: events{}

explore: ga_wi_hp_unique {
  join: parkroyal_costs {
    type: left_outer
    relationship: many_to_one
    sql_on: ${parkroyal_costs.hotel_code} = ${ga_wi_hp_unique.hotel_code} and ${parkroyal_costs.date_date} = ${ga_wi_hp_unique.date_date}  ;;
  }
  join: Ga_hotel_corporative_encrypted {
    type: left_outer
    relationship: many_to_one
    sql_on: ${parkroyal_costs.hotel_code} = ${ga_wi_hp_unique.hotel_code};;
  }
  join: bookings_google_analytics {
    type: left_outer
    relationship: many_to_many
    sql_on: ${bookings_google_analytics.hotel_code} = ${ga_wi_hp_unique.hotel_code} and ${bookings_google_analytics.date_date} = ${ga_wi_hp_unique.date_date}  ;;
  }
}

explore: parkroyal_costs {
  join: Ga_hotel_corporative_encrypted {
    type: left_outer
    relationship: many_to_one
    sql_on: ${parkroyal_costs.hotel_code} = ${Ga_hotel_corporative_encrypted.hotel_code};;
  }
}

explore: bookings_google_analytics {
  join: parkroyal_costs{
    type:left_outer
    relationship: many_to_one
    sql_on: ${bookings_google_analytics.hotel_code} = ${parkroyal_costs.hotel_code} and ${bookings_google_analytics.date_date} = ${parkroyal_costs.date_date};;
  }
  join: Ga_hotel_corporative_encrypted {
    type: inner
    relationship: many_to_one
    sql_on: ${bookings_google_analytics.hotel_code} = ${Ga_hotel_corporative_encrypted.hotel_code} and ${Ga_hotel_corporative_encrypted.hotel_code} = ${parkroyal_costs.hotel_code};;
  }
  join: ga_wi_hp_unique {
    type: left_outer
    relationship: many_to_many
    sql_on: ${bookings_google_analytics.hotel_code} = ${ga_wi_hp_unique.hotel_code} and ${bookings_google_analytics.date_date} = ${ga_wi_hp_unique.date_date}  ;;
  }
}
