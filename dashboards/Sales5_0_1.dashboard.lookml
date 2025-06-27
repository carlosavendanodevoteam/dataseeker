# VERSIÓN MEJORADA CON FOCO EN UX Y DISEÑO
- dashboard: sales_dashboard_ux_v2
  title: "Sales Dashboard V2 (Mejorado)"
  layout: tile
  tile_size: 100
  preferred_viewer: dashboards-next
  description: "Resumen ejecutivo, tendencias y segmentaciones clave del rendimiento comercial"

  elements:
  # SECCIÓN 1: TÍTULO Y RESUMEN EJECUTIVO (KPIs)
  - name: header_main_title
    type: text
    title_text: "SALES DASHBOARD"
    subtitle_text: "Rendimiento Comercial Clave"
    body_text: "" # Usamos title y subtitle que se ven mejor
    row: 0
    col: 0
    width: 24
    height: 1

  - name: kpi_revenue
    title: "Ingresos Totales"
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: single_value
    fields: [revenue]
    filters:
      mview_comparation_bookings.cancelled: 'No'
    value_format: "€#,##0"
    dynamic_fields:
    - category: measure
      label: Revenue
      based_on: mview_comparation_bookings.revenue
      type: sum
      measure: revenue
    row: 1
    col: 0
    width: 8
    height: 3

  - name: kpi_bookings
    title: "Total Bookings"
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: single_value
    fields: [bookings]
    filters:
      mview_comparation_bookings.cancelled: 'No'
    dynamic_fields:
    - category: measure
      label: Bookings
      based_on: mview_comparation_bookings.identifier
      type: count_distinct
      measure: bookings
    row: 1
    col: 8
    width: 8
    height: 3

  - name: kpi_room_nights
    title: "Total Room Nights (RN)"
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: single_value
    fields: [rn]
    filters:
      mview_comparation_bookings.cancelled: 'No'
    dynamic_fields:
    - category: measure
      label: RN
      based_on: mview_comparation_bookings.rn
      type: sum
      measure: rn
    row: 1
    col: 16
    width: 8
    height: 3

  # SECCIÓN 2: TENDENCIAS Y CONVERSIÓN
  - name: header_trends
    type: text
    body_text: "<div style='padding-top:15px; font-size:18px; color:#00599C;'><b>Análisis de Tendencias y Conversión</b></div>"
    row: 4
    col: 0
    width: 24
    height: 1

  - name: monthly_trends
    title: "Tendencia Mensual (Ingresos, Bookings, RN)"
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
    series_colors:
      revenue: "#00599C" # Azul Paraty
      bookings: "#6CAEE0"
      rn: "#F39C12" # Naranja Paraty
    row: 5
    col: 0
    width: 14
    height: 8
    dynamic_fields:
    - {category: measure, label: Revenue, based_on: mview_comparation_bookings_by_start_date.revenue, type: sum, measure: revenue}
    - {category: measure, label: Bookings, based_on: mview_comparation_bookings_by_start_date.identifier, type: count_distinct, measure: bookings}
    - {category: measure, label: RN, based_on: mview_comparation_bookings_by_start_date.rn, type: sum, measure: rn}

  - name: funnel_conversion
    title: "Embudo de Conversión"
    model: bq_demo_c
    explore: funnel_stats
    type: looker_funnel
    fields: [booking1, booking2, booking3]
    limit: 50
    sorts: [booking1 desc]
    series_colors: ["#00599C", "#007BCC", "#6CAEE0"]
    row: 5
    col: 14
    width: 10
    height: 8
    dynamic_fields:
    - {category: measure, label: 'Paso 1: Búsqueda', based_on: funnel_stats.booking1, type: sum, measure: booking1}
    - {category: measure, label: 'Paso 2: Selección', based_on: funnel_stats.booking2, type: sum, measure: booking2}
    - {category: measure, label: 'Paso 3: Reserva', based_on: funnel_stats.booking3, type: sum, measure: booking3}

  # SECCIÓN 3: SEGMENTACIÓN DE RENDIMIENTO
  - name: header_segmentation
    type: text
    body_text: "<div style='padding-top:15px; font-size:18px; color:#00599C;'><b>Segmentación de Rendimiento</b></div>"
    row: 13
    col: 0
    width: 24
    height: 1

  - name: markets_map
    title: "Ingresos por Mercado (Mapa)"
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_google_map
    fields: [mview_comparation_bookings.full_country, revenue]
    filters:
      mview_comparation_bookings.cancelled: 'No'
    map_value_colors: ['#FFFFFF', '#6CAEE0', '#00599C']
    row: 14
    col: 0
    width: 9
    height: 8
    dynamic_fields:
    - {category: measure, label: Revenue, based_on: mview_comparation_bookings.revenue, type: sum, measure: revenue}

  - name: markets_table
    title: "Rendimiento por Mercado"
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_grid
    fields:
    - mview_comparation_bookings.full_country
    - bookings
    - revenue
    - rn
    sorts: [revenue desc]
    filters:
      mview_comparation_bookings.cancelled: 'No'
    enable_conditional_formatting: true
    row: 14
    col: 9
    width: 15
    height: 8
    dynamic_fields:
    - {category: measure, label: Revenue, based_on: mview_comparation_bookings.revenue, type: sum, measure: revenue}
    - {category: measure, label: Bookings, based_on: mview_comparation_bookings.identifier, type: count_distinct, measure: bookings}
    - {category: measure, label: RN, based_on: mview_comparation_bookings.rn, type: sum, measure: rn}

  - name: device_breakdown
    title: "Reservas por Dispositivo"
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_pie
    fields: [mview_comparation_bookings.device, bookings]
    filters:
      mview_comparation_bookings.cancelled: 'No'
    row: 22
    col: 0
    width: 8
    height: 8
    dynamic_fields:
    - {category: measure, label: Bookings, based_on: mview_comparation_bookings.identifier, type: count_distinct, measure: bookings}

  - name: top_rooms
    title: "Top 5 Habitaciones por Ingresos"
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_bar
    fields: [mview_comparation_bookings.room, revenue]
    filters:
      mview_comparation_bookings.cancelled: 'No'
    sorts: [revenue desc]
    limit: 5
    series_colors: ["#00599C"]
    row: 22
    col: 8
    width: 16
    height: 8
    dynamic_fields:
    - {category: measure, label: Revenue, based_on: mview_comparation_bookings.revenue, type: sum, measure: revenue}
