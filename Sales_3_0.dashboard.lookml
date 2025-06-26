- dashboard: sales_2_0_mejorado
  title: Sales 3.0
  layout: tile
  tile_size: 100
  crossfilter_enabled: true

  filters:
  - name: Booking window
    title: Periodo de Reserva (Booking Window)
    type: field_filter
    default_value: 7 days
    model: bq_demo_c
    explore: mview_comparation_bookings
    field: mview_comparation_bookings.partition_timestamp_date
    ui_config:
      type: advanced
      display: popover

  - name: Travel window
    title: Periodo de Viaje (Travel Window)
    type: field_filter
    default_value: ''
    model: bq_demo_c
    explore: mview_datos_reservas_6
    field: mview_datos_reservas_6.start_date_timestamp_date
    ui_config:
      type: advanced
      display: popover

  - name: Market
    title: Mercado
    type: field_filter
    default_value: ''
    model: bq_demo_c
    explore: mview_comparation_bookings
    field: mview_comparation_bookings.full_country
    ui_config:
      type: tag_list
      display: popover

  - name: Source
    title: Origen
    type: field_filter
    default_value: ''
    model: bq_demo_c
    explore: mview_comparation_bookings
    field: mview_comparation_bookings.source_fixed
    ui_config:
      type: advanced
      display: popover

  - name: Device
    title: Dispositivo
    type: field_filter
    default_value: ''
    model: bq_demo_c
    explore: mview_comparation_bookings
    field: mview_comparation_bookings.device
    ui_config:
      type: checkboxes
      display: popover

  - name: Hotel Code
    title: Hotel
    type: field_filter
    default_value: ''
    model: bq_demo_c
    explore: funnel_stats
    field: hotel_corporative_encrypted.hotel_code
    ui_config:
      type: advanced
      display: popover


  elements:
  #############################################################
  # SECCIÓN 1: VISIÓN GENERAL
  #############################################################
  - name: "Header - General Overview"
    type: text
    body_text: "<div style='padding:10px; background-color:#00599C; color:white; text-align:center;'><h1 style='font-size:22px; font-weight:bold; margin:0;'>VISIÓN GENERAL: ¿CÓMO VAMOS?</h1></div>"
    row: 0
    col: 0
    width: 24
    height: 2

  - title: "Ingresos (Revenue)"
    name: sales_kpi
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: single_value
    fields: [revenue, revenue_last_year, diff]
    limit: 500
    dynamic_fields:
    - category: measure
      label: Revenue
      based_on: mview_comparation_bookings.revenue_complete
      type: sum
      measure: revenue
      value_format_name: eur_0
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      label: Revenue Last Year
      based_on: mview_comparation_bookings.revenue_complete
      type: sum
      measure: revenue_last_year
      value_format_name: eur_0
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${revenue} - ${revenue_last_year}"
      label: diff
      table_calculation: diff
      value_format_name: eur_0
    custom_color_enabled: true
    show_comparison: true
    comparison_type: change
    show_comparison_label: true
    note_text: "Ingresos totales de reservas confirmadas para el período seleccionado."
    listen:
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      Source: mview_comparation_bookings.source_fixed
      Device: mview_comparation_bookings.device
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 2
    col: 0
    width: 4
    height: 3

  - title: "Bookings"
    name: bookings_kpi
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: single_value
    fields: [bookings, bookings_last_year, diff]
    limit: 500
    dynamic_fields:
    - category: measure
      label: Bookings
      based_on: mview_comparation_bookings.identifier
      type: count_distinct
      measure: bookings
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      label: Bookings last year
      based_on: mview_comparation_bookings.identifier
      type: count_distinct
      measure: bookings_last_year
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${bookings} - ${bookings_last_year}"
      label: diff
      table_calculation: diff
    custom_color_enabled: true
    show_comparison: true
    comparison_type: change
    note_text: "Número total de reservas confirmadas."
    listen:
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      Source: mview_comparation_bookings.source_fixed
      Device: mview_comparation_bookings.device
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 2
    col: 4
    width: 4
    height: 3

  - title: "Noches"
    name: nights_kpi
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: single_value
    fields: [nights, last_year_nights, diff]
    limit: 500
    dynamic_fields:
    - category: measure
      label: Nights
      based_on: mview_comparation_bookings.nights
      type: sum
      measure: nights
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      label: Last year nights
      based_on: mview_comparation_bookings.nights
      type: sum
      measure: last_year_nights
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${nights} - ${last_year_nights}"
      label: diff
      table_calculation: diff
    custom_color_enabled: true
    show_comparison: true
    comparison_type: change
    note_text: "Total de noches de habitación reservadas."
    listen:
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      Source: mview_comparation_bookings.source_fixed
      Device: mview_comparation_bookings.device
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 2
    col: 8
    width: 4
    height: 3

  - title: "ADR"
    name: adr_kpi
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: single_value
    fields: [adr, adr_last_year, diff]
    limit: 500
    dynamic_fields:
    - category: measure
      label: Revenue
      based_on: mview_comparation_bookings.revenue
      type: sum
      measure: revenue
      filters: {mview_comparation_bookings.last_year_booking: '0', mview_comparation_bookings.cancelled: 'no'}
    - category: measure
      label: RN
      based_on: mview_comparation_bookings.rn
      type: sum
      measure: rn
      filters: {mview_comparation_bookings.last_year_booking: '0'}
    - category: table_calculation
      expression: "${revenue}/${rn}"
      label: ADR
      table_calculation: adr
      value_format_name: eur
    - category: measure
      label: Revenue LY
      based_on: mview_comparation_bookings.revenue
      type: sum
      measure: revenue_ly
      filters: {mview_comparation_bookings.last_year_booking: '1', mview_comparation_bookings.cancelled: 'no'}
    - category: measure
      label: RN LY
      based_on: mview_comparation_bookings.rn
      type: sum
      measure: rn_ly
      filters: {mview_comparation_bookings.last_year_booking: '1'}
    - category: table_calculation
      expression: "${revenue_ly}/${rn_ly}"
      label: "ADR last year"
      table_calculation: adr_last_year
      value_format_name: eur
    - category: table_calculation
      expression: "${adr} - ${adr_last_year}"
      label: diff
      table_calculation: diff
      value_format_name: eur
    hidden_fields: [revenue, rn, revenue_ly, rn_ly, adr_last_year]
    custom_color_enabled: true
    show_comparison: true
    comparison_type: change
    note_text: "Tarifa Media Diaria (Revenue / Noches)."
    listen:
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      Source: mview_comparation_bookings.source_fixed
      Device: mview_comparation_bookings.device
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 2
    col: 12
    width: 4
    height: 3

  - title: "Cancelaciones"
    name: cancellations_kpi
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: single_value
    fields: [cancellations, cancellation_last_year, diff]
    limit: 500
    dynamic_fields:
    - category: measure
      label: Cancellations
      based_on: mview_comparation_bookings.cancellation
      type: sum
      measure: cancellations
      value_format_name: eur_0
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      label: Cancellation last year
      based_on: mview_comparation_bookings.cancellation
      type: sum
      measure: cancellation_last_year
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${cancellations} - ${cancellation_last_year}"
      label: diff
      table_calculation: diff
    custom_color_enabled: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    note_text: "Ingresos de las reservas canceladas."
    listen:
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      Source: mview_comparation_bookings.source_fixed
      Device: mview_comparation_bookings.device
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 2
    col: 16
    width: 4
    height: 3

  - title: "Estancia Media (LoS)"
    name: los_kpi
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: single_value
    fields: [av_los, av_los_last_year, diff]
    limit: 500
    dynamic_fields:
    - category: measure
      label: Av Los
      based_on: mview_comparation_bookings.nights
      type: average
      measure: av_los
      value_format_name: decimal_1
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      label: Av Los last year
      based_on: mview_comparation_bookings.nights
      type: average
      measure: av_los_last_year
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${av_los} - ${av_los_last_year}"
      label: diff
      table_calculation: diff
    custom_color_enabled: true
    show_comparison: true
    comparison_type: change
    note_text: "Media de noches por reserva (Length of Stay)."
    listen:
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      Source: mview_comparation_bookings.source_fixed
      Device: mview_comparation_bookings.device
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 2
    col: 20
    width: 4
    height: 3

  - name: "On the Books Chart"
    title: "On the Books vs. Año Anterior"
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_column
    fields: [revenue, revenue_previous_year, mview_comparation_bookings.comparation_startDate_month, total_revenue_month_ly, cancellation, cancellation_previous_year_copy, total_cancellation_month_ly]
    fill_fields: [mview_comparation_bookings.comparation_startDate_month]
    filters:
      mview_comparation_bookings.comparation_startDate_date: this year
    sorts: [mview_comparation_bookings.comparation_startDate_month]
    limit: 500
    show_view_names: false
    y_axis_gridlines: true
    legend_position: center
    series_colors:
      revenue: "#00599C"
      revenue_previous_year: "#6CAEE0"
      total_revenue_month_ly: "#80868B"
      cancellation: "#D9534F"
    series_labels:
      revenue: "Revenue"
      revenue_previous_year: "Revenue LY"
      total_revenue_month_ly: "Total Revenue Month LY"
    note_text: "El número total de reservas confirmadas que un hotel tiene para fechas futuras, incluyendo noches de habitación e ingresos."
    listen:
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      Source: mview_comparation_bookings.source_fixed
      Device: mview_comparation_bookings.device
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 5
    col: 0
    width: 24
    height: 7


  #############################################################
  # ELEMENTO BASE PARA GRIDS DE RENDIMIENTO (OCULTO)
  #############################################################
  - name: base_performance_grid
    hidden: true
    type: looker_grid
    model: bq_demo_c
    explore: mview_comparation_bookings
    total: true
    show_totals: true
    show_row_totals: true
    table_theme: white
    enable_conditional_formatting: true
    header_background_color: "#00599C"
    header_font_color: "#FFFFFF"
    header_text_alignment: left
    rows_font_size: '12'
    header_font_size: '12'
    dynamic_fields:
    - category: measure
      label: Revenue
      based_on: mview_comparation_bookings.revenue
      type: sum
      measure: revenue
      value_format_name: eur_0
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      label: Revenue LY
      based_on: mview_comparation_bookings.revenue
      type: sum
      measure: revenue_ly
      value_format_name: eur_0
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "(${revenue} / ${revenue_ly}) - 1"
      label: "Var. Rev %"
      table_calculation: var_revenue
      value_format_name: percent_1
    - category: measure
      label: Bookings
      based_on: mview_comparation_bookings.identifier
      type: count_distinct
      measure: bookings
      filters:
        mview_comparation_bookings.last_year_booking: '0'
        mview_comparation_bookings.cancelled: 'No'
    - category: measure
      label: Bookings LY
      based_on: mview_comparation_bookings.identifier
      type: count_distinct
      measure: bookings_ly
      filters:
        mview_comparation_bookings.last_year_booking: '1'
        mview_comparation_bookings.cancelled: 'No'
    - category: table_calculation
      expression: "(${bookings} / ${bookings_ly}) - 1"
      label: "Var. Bookings %"
      table_calculation: var_bookings
      value_format_name: percent_1
    - category: measure
      label: RN
      based_on: mview_comparation_bookings.rn
      type: sum
      measure: rn
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      label: RN LY
      based_on: mview_comparation_bookings.rn
      type: sum
      measure: rn_ly
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "(${rn} / ${rn_ly}) - 1"
      label: "Var. RN %"
      table_calculation: var_rn
      value_format_name: percent_1
    - category: table_calculation
      expression: "${revenue}/${rn}"
      label: "ADR"
      table_calculation: adr
      value_format_name: eur
    - category: table_calculation
      label: "% Peso"
      calculation_type: percent_of_column_sum
      table_calculation: weight
      args: [revenue]
      value_format_name: percent_1
    conditional_formatting:
    - type: "along a scale..."
      color_application: { collection_id: "paraty_diverging", palette_id: "paraty_diverging_palette" }
      bold: true
      fields: [var_revenue, var_bookings, var_rn]


  #############################################################
  # SECCIÓN 2: ¿QUIÉN ES MI CLIENTE?
  #############################################################
  - name: "Header - Client Profile"
    type: text
    body_text: "<div style='padding:10px; background-color:#00599C; color:white; text-align:center;'><h1 style='font-size:22px; font-weight:bold; margin:0;'>¿QUIÉN ES MI CLIENTE?</h1></div>"
    row: 12
    col: 0
    width: 24
    height: 2

  - name: Markets Table
    title: "Rendimiento por Mercado"
    extends: base_performance_grid
    fields:
    - mview_comparation_bookings.full_country
    - base_performance_grid.revenue
    - base_performance_grid.var_revenue
    - base_performance_grid.bookings
    - base_performance_grid.var_bookings
    - base_performance_grid.rn
    - base_performance_grid.var_rn
    - base_performance_grid.adr
    - base_performance_grid.weight
    column_order: [mview_comparation_bookings.full_country, revenue, var_revenue, bookings, var_bookings, rn, var_rn, adr, weight]
    pinned_columns: {mview_comparation_bookings.full_country: left}
    sorts: [revenue desc]
    note_text: "Reservas por país."
    listen:
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Source: mview_comparation_bookings.source_fixed
      Device: mview_comparation_bookings.device
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 14
    col: 6
    width: 18
    height: 8

  - name: Markets Map
    title: "Mapa de Ingresos por Mercado"
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_google_map
    fields: [revenue, mview_comparation_bookings.country]
    sorts: [revenue desc 0]
    limit: 500
    dynamic_fields:
    - category: measure
      label: Revenue
      based_on: mview_comparation_bookings.revenue
      type: sum
      measure: revenue
      value_format_name: eur_0
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    map_value_colors: ["#FFFFFF", "#6CAEE0", "#00599C"]
    map_position: fit_data
    note_text: "Representación geográfica de los ingresos por país."
    listen:
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Source: mview_comparation_bookings.source_fixed
      Device: mview_comparation_bookings.device
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 14
    col: 0
    width: 6
    height: 8

  #############################################################
  # SECCIÓN 3: ¿QUÉ Y CÓMO RESERVAN?
  #############################################################
  - name: "Header - What and How"
    type: text
    body_text: "<div style='padding:10px; background-color:#00599C; color:white; text-align:center;'><h1 style='font-size:22px; font-weight:bold; margin:0;'>¿QUÉ Y CÓMO RESERVAN?</h1></div>"
    row: 22
    col: 0
    width: 24
    height: 2

  - name: Boards Table
    title: "Rendimiento por Régimen"
    extends: base_performance_grid
    fields:
    - mview_comparation_bookings.board
    - base_performance_grid.revenue
    - base_performance_grid.var_revenue
    - base_performance_grid.bookings
    - base_performance_grid.var_bookings
    - base_performance_grid.weight
    column_order: [mview_comparation_bookings.board, revenue, var_revenue, bookings, var_bookings, weight]
    note_text: "Métricas de rendimiento desglosadas por tipo de régimen (ej. Solo Alojamiento)."
    listen:
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      Source: mview_comparation_bookings.source_fixed
      Device: mview_comparation_bookings.device
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 24
    col: 0
    width: 8
    height: 8

  - name: Rooms Table
    title: "Rendimiento por Tipo de Habitación"
    extends: base_performance_grid
    fields:
    - mview_comparation_bookings.room
    - base_performance_grid.revenue
    - base_performance_grid.var_revenue
    - base_performance_grid.bookings
    - base_performance_grid.var_bookings
    - base_performance_grid.weight
    column_order: [mview_comparation_bookings.room, revenue, var_revenue, bookings, var_bookings, weight]
    note_text: "Métricas de rendimiento desglosadas por tipo de habitación."
    listen:
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      Source: mview_comparation_bookings.source_fixed
      Device: mview_comparation_bookings.device
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 24
    col: 8
    width: 8
    height: 8

  - name: Devices Table
    title: "Rendimiento por Dispositivo"
    extends: base_performance_grid
    fields:
    - mview_comparation_bookings.device
    - base_performance_grid.revenue
    - base_performance_grid.var_revenue
    - base_performance_grid.bookings
    - base_performance_grid.var_bookings
    - base_performance_grid.weight
    column_order: [mview_comparation_bookings.device, revenue, var_revenue, bookings, var_bookings, weight]
    note_text: "Métricas de rendimiento desglosadas por el tipo de dispositivo utilizado para realizar la reserva."
    listen:
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      Source: mview_comparation_bookings.source_fixed
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 24
    col: 16
    width: 8
    height: 8

  #############################################################
  # SECCIÓN 4: PUNTOS DE FUGA Y CANCELACIONES
  #############################################################
  - name: "Header - Leaks and Cancellations"
    type: text
    body_text: "<div style='padding:10px; background-color:#00599C; color:white; text-align:center;'><h1 style='font-size:22px; font-weight:bold; margin:0;'>PUNTOS DE FUGA Y CANCELACIONES</h1></div>"
    row: 32
    col: 0
    width: 24
    height: 2

  - name: Gateway Funnel
    title: "Conversión del Funnel de Reservas"
    note_text: "Métricas relacionadas con el rendimiento de la pasarela de pago, siguiendo la progresión del usuario."
    merged_queries:
    - model: bq_demo_c
      explore: funnel_stats
      type: looker_funnel
      fields: [booking4_gateway, dimensiontomerge]
      filters: {booking4_gateway: '>0'}
      sorts: [booking4_gateway desc 0]
      limit: 50
      dynamic_fields:
      - category: measure
        label: Booking4 Gateway
        based_on: funnel_stats.booking4_gateway
        type: sum
        measure: booking4_gateway
      - category: dimension
        expression: '1'
        label: dimensionToMerge
        dimension: dimensiontomerge
      color_application: {collection_id: "paraty_palette"}
      series_labels:
        booking4_gateway: "Entrada a Pasarela"
    - model: bq_demo_c
      explore: mview_datos_reservas_6
      type: table
      fields: [bookings, dimensiontomerge]
      filters:
        mview_datos_reservas_6.payment_method: TPV
      limit: 500
      dynamic_fields:
      - category: measure
        label: Bookings
        based_on: mview_datos_reservas_6.num_reservas
        type: count_distinct
        measure: bookings
      - category: dimension
        expression: '1'
        label: dimensionToMerge
        dimension: dimensiontomerge
      join_fields:
      - field_name: dimensiontomerge
        source_field_name: dimensiontomerge
      series_labels:
        bookings: "Reservas TPV"
    listen:
      Booking window: funnel_stats.date_date
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 34
    col: 0
    width: 12
    height: 8

  - name: "Cancellation Reasons"
    title: "Motivos de Cancelación"
    model: bq_demo_c
    explore: mview_datos_reservas_6
    type: looker_bar
    fields: [mview_datos_reservas_6.cancellation_reason, revenue]
    filters:
      mview_datos_reservas_6.cancelled: 'Yes'
    sorts: [revenue desc 0]
    limit: 10 # Mostrar los 10 principales
    dynamic_fields:
    - category: measure
      label: Revenue
      value_format_name: eur_0
      based_on: mview_datos_reservas_6.cancellation
      type: sum
      measure: revenue
    series_colors: ["#00599C"]
    note_text: "Análisis de las reservas canceladas, categorizadas por el motivo de la cancelación."
    listen:
      Booking window: mview_datos_reservas_6.partition_timestamp_date
      Travel window: mview_datos_reservas_6.start_date_timestamp_date
      Market: mview_datos_reservas_6.full_country
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 34
    col: 12
    width: 12
    height: 8
