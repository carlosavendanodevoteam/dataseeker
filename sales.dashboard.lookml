# CORRECCIÓN: 'layout' cambiado a 'tile' que es un valor válido.
- dashboard: Sales5_0_1
  title: "SALES DASHBOARD V2"
  layout: tile
  preferred_viewer: dashboards-next
  description: "Resumen ejecutivo, tendencias y segmentaciones clave del rendimiento comercial"

  elements:
  - name: header_text
    type: text
    title_text: "SALES DASHBOARD 2.0"
    body_text: "[{\"type\":\"h1\",\"children\":[{\"text\":\"SALES DASHBOARD 2.0\",\"bold\":true}]}]"
    row: 0
    col: 0
    width: 24
    height: 1

  - name: monthly_trends
    title: "Monthly Trends"
    model: bq_demo_c
    explore: mview_comparation_bookings_by_start_date
    type: looker_line
    fields:
    - mview_comparation_bookings_by_start_date.partition_timestamp_month
    - revenue
    - bookings
    - rn
    filters:
      mview_comparation_bookings_by_start_date.cancelled: 'No'
    sorts: [mview_comparation_bookings_by_start_date.partition_timestamp_month]
    row: 1
    col: 0
    width: 24
    height: 8
    dynamic_fields:
    - category: measure
      label: Revenue
      based_on: mview_comparation_bookings_by_start_date.revenue
      type: sum
      measure: revenue
    - category: measure
      label: Bookings
      based_on: mview_comparation_bookings_by_start_date.identifier
      type: count_distinct
      measure: bookings
    - category: measure
      label: RN
      based_on: mview_comparation_bookings_by_start_date.rn
      type: sum
      measure: rn

  - name: funnel_conversion
    title: "Funnel Conversion"
    model: bq_demo_c
    explore: funnel_stats
    type: looker_funnel
    fields: [booking1, booking2, booking3]
    limit: 50
    sorts: [booking1 desc]
    row: 9
    col: 0
    width: 24
    height: 8
    dynamic_fields:
    - category: measure
      label: 'Booking1'
      based_on: funnel_stats.booking1
      type: sum
      measure: booking1
    - category: measure
      label: 'Booking2'
      based_on: funnel_stats.booking2
      type: sum
      measure: booking2
    - category: measure
      label: 'Booking3'
      based_on: funnel_stats.booking3
      type: sum
      measure: booking3

  - name: markets
    title: "Performance by Market"
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_grid
    fields:
    - mview_comparation_bookings.full_country
    - bookings
    - revenue
    - rn
    sorts: [bookings desc]
    filters:
      mview_comparation_bookings.cancelled: 'No'
    enable_conditional_formatting: true
    row: 17
    col: 0
    width: 24
    height: 8
    dynamic_fields:
    - category: measure
      label: Revenue
      based_on: mview_comparation_bookings.revenue
      type: sum
      measure: revenue
    - category: measure
      label: Bookings
      based_on: mview_comparation_bookings.identifier
      type: count_distinct
      measure: bookings
    - category: measure
      label: RN
      based_on: mview_comparation_bookings.rn
      type: sum
      measure: rn

  - name: segments
    title: "Device/Room/Board Breakdown"
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_grid
    fields:
    - mview_comparation_bookings.device
    - mview_comparation_bookings.room
    - mview_comparation_bookings.board
    - revenue
    - bookings
    - rn
    filters:
      mview_comparation_bookings.cancelled: 'No'
    row: 25
    col: 0
    width: 24
    height: 8
    dynamic_fields:
    - category: measure
      label: Revenue
      based_on: mview_comparation_bookings.revenue
      type: sum
      measure: revenue
    - category: measure
      label: Bookings
      based_on: mview_comparation_bookings.identifier
      type: count_distinct
      measure: bookings
    - category: measure
      label: RN
      based_on: mview_comparation_bookings.rn
      type: sum
      measure: rn

  - name: otb
    title: "On The Books"
    model: bq_demo_c
    explore: mview_comparation_bookings_by_start_date
    type: looker_grid
    fields:
    - mview_comparation_bookings_by_start_date.partition_timestamp_month
    - bookings
    - revenue
    - rn
    sorts: [mview_comparation_bookings_by_start_date.partition_timestamp_month]
    row: 33
    col: 0
    width: 24
    height: 8
    dynamic_fields:
    - category: measure
      label: Revenue
      based_on: mview_comparation_bookings_by_start_date.revenue
      type: sum
      measure: revenue
    - category: measure
      label: Bookings
      based_on: mview_comparation_bookings_by_start_date.identifier
      type: count_distinct
      measure: bookings
    - category: measure
      label: RN
      based_on: mview_comparation_bookings_by_start_date.rn
      type: sum
      measure: rn
