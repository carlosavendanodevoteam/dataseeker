# SALES DASHBOARD 2.0 - Rediseñado para importación completa en Looker

# Configuración del dashboard

- title: SALES DASHBOARD V2
  layout: single_column
  preferred_viewer: dashboards-next
  description: "Resumen ejecutivo, tendencias y segmentaciones clave del rendimiento comercial"
  elements:

    # -------------------------
    # Encabezado principal
    # -------------------------
  - type: text
    title_text: "SALES DASHBOARD 2.0"
    body_text: '[{"type":"h1","children":[{"text":"SALES DASHBOARD 2.0","bold":true}]}]'
    row: 0
    col: 0
    width: 24
    height: 2

    # -------------------------
    # KPIs Ejecutivos
    # -------------------------
  - type: row
    title: "Executive Summary"
    elements:
      - title: Revenue (€)
        name: Revenue
        model: bq_demo_c
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
        model: bq_demo_c
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
        model: bq_demo_c
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
        model: bq_demo_c
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
        model: bq_demo_c
        explore: mview_comparation_bookings
        type: single_value
        fields: [cancellations, bookings]
        dynamic_fields:
          - label: Cancelaciones
            table_calculation: percent_cancel
            expression: "${cancellations}/${bookings}"
            value_format_name: percent_1

    # -------------------------
    # Tendencia Mensual
    # -------------------------
  - title: Monthly Trends
    name: Monthly Trends
    model: bq_demo_c
    explore: mview_comparation_bookings_by_start_date
    type: line
    fields: [partition_timestamp_month, revenue, bookings, rn]
    sorts: [partition_timestamp_month]
    filters:
      mview_comparation_bookings_by_start_date.cancelled: 'No'

    # -------------------------
    # Funnel de conversión
    # -------------------------
  - title: Funnel Conversion
    name: Funnel Conversion
    model: bq_demo_c
    explore: funnel_stats
    type: looker_funnel
    fields: [booking1, booking2, booking3]
    limit: 50
    sorts: [booking1 desc]

    # -------------------------
    # Análisis por Mercado
    # -------------------------
  - title: Performance by Market
    name: Markets
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_grid
    fields: [full_country, bookings, revenue, rn]
    sorts: [bookings desc]
    filters:
      mview_comparation_bookings.cancelled: 'No'
    enable_conditional_formatting: true

    # -------------------------
    # Segmentación
    # -------------------------
  - title: Device/Room/Board Breakdown
    name: Segments
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_grid
    fields: [device, room, board, revenue, bookings, rn]
    filters:
      mview_comparation_bookings.cancelled: 'No'

    # -------------------------
    # On the Books
    # -------------------------
  - title: On The Books
    name: OTB
    model: bq_demo_c
    explore: mview_comparation_bookings_by_start_date
    type: looker_grid
    fields: [partition_timestamp_month, bookings, revenue, rn]
    sorts: [partition_timestamp_month]
