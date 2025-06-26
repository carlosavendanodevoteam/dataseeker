# SALES DASHBOARD 2.0 - Rediseñado para importación completa en Looker

- title: SALES DASHBOARD V2
  layout: single_column
  preferred_viewer: dashboards-next
  description: "Resumen ejecutivo, tendencias y segmentaciones clave del rendimiento comercial"
  elements:

  - type: text
    title_text: "SALES DASHBOARD 2.0"
    body_text: '[{"type":"h1","children":[{"text":"SALES DASHBOARD 2.0","bold":true}]}]'
    row: 0
    col: 0
    width: 24
    height: 2

  - type: row
    title: "Executive Summary"
    elements:
      - title: Revenue (€)
        name: Revenue
        explore: mview_comparation_bookings
        type: single_value
        fields: [revenue, revenue_last_year]
        dynamic_fields:
          - label: Revenue
            measure: revenue
            type: sum
            filters:
              mview_comparation_bookings.last_year_booking: '0'
          - label: Revenue last year
            measure: revenue_last_year
            type: sum
            filters:
              mview_comparation_bookings.last_year_booking: '1'
          - label: diff
            table_calculation: diff
            expression: "${revenue}-${revenue_last_year}"
            value_format_name: eur_0

      - title: Bookings
        name: Bookings
        explore: mview_comparation_bookings
        type: single_value
        fields: [bookings, bookings_last_year]
        dynamic_fields:
          - label: Bookings
            measure: bookings
            type: count_distinct
            filters:
              mview_comparation_bookings.last_year_booking: '0'
          - label: Bookings last year
            measure: bookings_last_year
            type: count_distinct
            filters:
              mview_comparation_bookings.last_year_booking: '1'
          - label: diff
            table_calculation: diff
            expression: "${bookings}-${bookings_last_year}"

      - title: Average Daily Rate (ADR)
        name: ADR
        explore: mview_comparation_bookings
        type: single_value
        fields: [revenue, rn]
        dynamic_fields:
          - label: ADR
            table_calculation: adr
            expression: "${revenue}/${rn}"
            value_format_name: eur

      - title: Average Length of Stay
        name: LoS
        explore: mview_comparation_bookings
        type: single_value
        fields: [nights]
        dynamic_fields:
          - label: Av. LoS
            measure: av_los
            type: average
            based_on: mview_comparation_bookings.nights

      - title: "% Cancelaciones"
        name: Cancelaciones
        explore: mview_comparation_bookings
        type: single_value
        fields: [cancellations, bookings]
        dynamic_fields:
          - label: Cancelaciones
            table_calculation: percent_cancel
            expression: "${cancellations}/${bookings}"
            value_format_name: percent_1

  - title: Monthly Trends
    name: Monthly Trends
    explore: mview_comparation_bookings_by_start_date
    type: line
    fields: [partition_timestamp_month, revenue, bookings, rn]
    sorts: [partition_timestamp_month]
    filters:
      mview_comparation_bookings_by_start_date.cancelled: 'No'

  - title: Funnel Conversion
    name: Funnel Conversion
    explore: funnel_stats
    type: looker_funnel
    fields: [booking1, booking2, booking3]
    limit: 50
    sorts: [booking1 desc]

  - title: Performance by Market
    name: Markets
    explore: mview_comparation_bookings
    type: looker_grid
    fields: [full_country, bookings, revenue, rn]
    sorts: [bookings desc]
    filters:
      mview_comparation_bookings.cancelled: 'No'
    enable_conditional_formatting: true

  - title: Device/Room/Board Breakdown
    name: Segments
    explore: mview_comparation_bookings
    type: looker_grid
    fields: [device, room, board, revenue, bookings, rn]
    filters:
      mview_comparation_bookings.cancelled: 'No'

  - title: On The Books
    name: OTB
    explore: mview_comparation_bookings_by_start_date
    type: looker_grid
    fields: [partition_timestamp_month, bookings, revenue, rn]
    sorts: [partition_timestamp_month]
