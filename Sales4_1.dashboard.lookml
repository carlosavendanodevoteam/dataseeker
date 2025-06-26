---
- dashboard: sales_3_0
  title: SALES 3.0
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: bCtYg87iRFLLf2QGq2PVqT
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h2","children":[{"color":"hsl(0, 0%, 0%)","text":"SALES","bold":true},{"color":"hsl(0,
      0%, 0%)","text":" (By Booking window)"}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 3
    col: 0
    width: 10
    height: 2
  - name: " (Copy)"
    type: text
    title_text: " (Copy)"
    subtitle_text: ''
    body_text: '[{"children":[{"text":"TRAVEL REVENUE","color":"hsl(0, 0%, 0%)","bold":true},{"color":"hsl(0,
      0%, 0%)","text":" per month"}],"type":"h2"}]'
    rich_content_json: '{"format":"slate"}'
    row: 3
    col: 10
    width: 14
    height: 2
  - name: funnel stats
    title: funnel stats
    note_state: collapsed
    note_display: hover
    note_text: Ejemplo
    title_hidden: true
    merged_queries:
    - model: bq_demo_c
      explore: funnel_stats
      type: looker_funnel
      fields: [funnel_stats.hotel_code, bookings1, booking2, booking3]
      sorts: [bookings1 desc 0]
      limit: 50
      column_limit: 50
      total: true
      dynamic_fields:
      - category: measure
        expression: ''
        label: 'Booking1 '
        based_on: funnel_stats.booking1
        _kind_hint: measure
        measure: booking1
        type: sum
        _type_hint: number
      - category: measure
        expression: ''
        label: Booking2
        based_on: funnel_stats.booking2
        _kind_hint: measure
        measure: booking2
        type: sum
        _type_hint: number
      - category: measure
        expression: ''
        label: Booking3
        based_on: funnel_stats.booking3
        _kind_hint: measure
        measure: booking3
        type: sum
        _type_hint: number
      - category: measure
        expression: ''
        label: Bookings1
        based_on: funnel_stats.booking1_unique_ips
        _kind_hint: measure
        measure: bookings1
        type: sum
        _type_hint: number
      leftAxisLabelVisible: false
      leftAxisLabel: ''
      rightAxisLabelVisible: false
      rightAxisLabel: ''
      smoothedBars: false
      orientation: automatic
      labelPosition: left
      percentType: total
      percentPosition: inline
      valuePosition: right
      labelColorEnabled: false
      labelColor: "#FFF"
      color_application:
        collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
        palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
      isStepped: false
      labelOverlap: false
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      bar_arm_length: 25
      bar_arm_weight: 50
      bar_spinner_length: 100
      bar_spinner_weight: 50
      defaults_version: 1
      up_color: false
      down_color: false
      total_color: false
      show_value_labels: false
      show_x_axis_ticks: true
      show_x_axis_label: true
      x_axis_scale: auto
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_gridlines: true
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: light
      map_position: fit_data
      map_scale_indicator: 'off'
      map_pannable: true
      map_zoomable: true
      map_marker_type: circle
      map_marker_icon_name: default
      map_marker_radius_mode: proportional_value
      map_marker_units: meters
      map_marker_proportional_scale_type: linear
      map_marker_color_mode: fixed
      show_view_names: false
      show_legend: true
      quantize_map_value_colors: false
      reverse_map_value_colors: false
      map: auto
      map_projection: ''
      quantize_colors: false
      hidden_fields: [funnel_stats.hotel_code]
      hidden_points_if_no: []
      series_labels: {}
      y_axes: []
      hidden_pivots: {}
    - model: bq_demo_c
      explore: mview_comparation_bookings
      type: table
      fields: [mview_comparation_bookings.hotel_code, reservation]
      filters:
        mview_comparation_bookings.cancelled: 'No'
        mview_comparation_bookings.last_year_booking: '0'
      sorts: [reservation desc 0]
      limit: 500
      column_limit: 50
      total: true
      dynamic_fields:
      - category: measure
        expression:
        label: Reservation
        value_format:
        value_format_name:
        based_on: mview_comparation_bookings.num_reservas
        _kind_hint: measure
        measure: reservation
        type: count
        _type_hint: number
      hidden_pivots: {}
      join_fields:
      - field_name: mview_comparation_bookings.hotel_code
        source_field_name: funnel_stats.hotel_code
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      custom:
        id: a3ad8e7d-5735-eeab-b385-cc8e33b487ae
        label: Custom
        type: continuous
        stops:
        - color: "#536BA5"
          offset: 0
        - color: "#c7d8f0"
          offset: 100
      options:
        steps: 5
    smoothedBars: false
    isStepped: false
    orientation: automatic
    labelPosition: left
    labelOverlap: true
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    series_types: {}
    type: looker_funnel
    hidden_pivots: {}
    hidden_fields: [funnel_stats.hotel_code]
    y_axes: []
    total: true
    listen:
    - Market: funnel_stats.full_country
      Booking window: funnel_stats.date_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    - Market: mview_comparation_bookings.full_country
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 104
    col: 3
    width: 9
    height: 12
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"____________________________________________________________________________________________________________________________________________","color":"hsl(218,
      67%, 43%)"}],"align":"center","id":1701286585582}]'
    rich_content_json: '{"format":"slate"}'
    row: 17
    col: 0
    width: 24
    height: 1
  - title: Sales
    name: Sales
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: single_value
    fields: [revenue, revenue_last_year]
    filters:
      mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: NOT
        NULL
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Revenue
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.revenue_complete
      _kind_hint: measure
      measure: revenue
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Revenue last year
      based_on: mview_comparation_bookings.revenue_complete
      _kind_hint: measure
      measure: revenue_last_year
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${revenue}-${revenue_last_year}"
      label: diff
      value_format:
      value_format_name: eur_0
      _kind_hint: measure
      table_calculation: diff
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [revenue_last_year]
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Total Revenue of Reservations
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 5
    col: 5
    width: 5
    height: 2
  - title: Nights
    name: Nights
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: single_value
    fields: [nights, last_year_nights]
    filters:
      mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: NOT
        NULL
      mview_comparation_bookings.promo: ''
      mview_comparation_bookings.promocode: ''
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${nights}-${last_year_nights}"
      label: diff
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: diff
      _type_hint: number
    - category: measure
      expression: ''
      label: Nights
      based_on: mview_comparation_bookings.nights
      _kind_hint: measure
      measure: nights
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Last year nights
      based_on: mview_comparation_bookings.nights
      _kind_hint: measure
      measure: last_year_nights
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [last_year_nights]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: above
    note_text: Total Reservation nights
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 9
    col: 5
    width: 5
    height: 2
  - title: Bookings
    name: Bookings
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: single_value
    fields: [bookings, bookings_last_year]
    filters:
      mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: NOT
        NULL
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: Bookings
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.identifier
      _kind_hint: measure
      measure: bookings
      type: count_distinct
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression:
      label: Bookings last year
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.identifier
      _kind_hint: measure
      measure: bookings_last_year
      type: count_distinct
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${bookings}-${bookings_last_year}"
      label: diff
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: diff
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [bookings_last_year]
    note_state: collapsed
    note_display: above
    note_text: Total number of Bookings
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 7
    col: 0
    width: 5
    height: 2
  - title: Cancellations
    name: Cancellations
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: single_value
    fields: [cancellations, cancellation_last_year]
    filters:
      mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: NOT
        NULL
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Cancellations
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.cancellation
      _kind_hint: measure
      measure: cancellations
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Cancellation last year
      based_on: mview_comparation_bookings.cancellation
      _kind_hint: measure
      measure: cancellation_last_year
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${cancellations}-${cancellation_last_year}"
      label: diff
      value_format:
      value_format_name: eur_0
      _kind_hint: measure
      table_calculation: diff
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [cancellation_last_year]
    note_state: collapsed
    note_display: above
    note_text: Revenue of Reservations Cancelled
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 7
    col: 5
    width: 5
    height: 2
  - title: ADR
    name: ADR
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: single_value
    fields: [revenue, revenue_last_year, rn, rn_last_year]
    filters:
      mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: NOT
        NULL
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Revenue
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
        mview_comparation_bookings.cancelled: 'no'
    - category: measure
      expression: ''
      label: Revenue last year
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue_last_year
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: measure
      expression: ''
      label: RN
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: RN last year
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn_last_year
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${revenue}/${rn}"
      label: ADR
      value_format:
      value_format_name: eur
      _kind_hint: measure
      table_calculation: adr
      _type_hint: number
    - category: table_calculation
      expression: "${revenue_last_year}/${rn_last_year}"
      label: ADR last year
      value_format:
      value_format_name: eur
      _kind_hint: measure
      table_calculation: adr_last_year
      _type_hint: number
    - category: table_calculation
      expression: "${adr}-${adr_last_year}"
      label: diff
      value_format:
      value_format_name: eur
      _kind_hint: measure
      table_calculation: diff
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [revenue, revenue_last_year, rn, rn_last_year, adr_last_year]
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Revenue / Room Nights
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 9
    col: 0
    width: 5
    height: 2
  - title: Av LoS
    name: Av LoS
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: single_value
    fields: [av_los, av_los_last_year]
    filters:
      mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: NOT
        NULL
    sorts: [av_los_last_year desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: 'Av Los '
      value_format:
      value_format_name: decimal_1
      based_on: mview_comparation_bookings.nights
      _kind_hint: measure
      measure: av_los
      type: average
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Av Los last year
      based_on: mview_comparation_bookings.nights
      _kind_hint: measure
      measure: av_los_last_year
      type: average
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${av_los}-${av_los_last_year}"
      label: diff
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      table_calculation: diff
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [av_los_last_year]
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: AVG of Nights
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 13
    col: 0
    width: 5
    height: 2
  - title: Markets
    name: Markets
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_grid
    fields: [bookings, bookings_last_year, rn, rn_last_year, revenue, revenue_last_year,
      cancellations, cancellations_last_year, lead_time, lead_time_last_year, av_los,
      av_los_last_year, mview_comparation_bookings.full_country]
    filters:
      mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: NOT
        NULL
    sorts: [bookings desc]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: table_calculation
      expression: "(${bookings}/${bookings_last_year})-1"
      label: "%Bookings"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: bookings_1
      _type_hint: number
    - category: table_calculation
      expression: "${revenue}/${rn}"
      label: ADR
      value_format:
      value_format_name: eur
      _kind_hint: measure
      table_calculation: adr
      _type_hint: number
    - category: table_calculation
      expression: "${revenue_last_year}/${rn_last_year}"
      label: ADR last year
      value_format:
      value_format_name: eur
      _kind_hint: measure
      table_calculation: adr_last_year
      _type_hint: number
    - category: table_calculation
      expression: "(${rn}/${rn_last_year})-1"
      label: "%RN"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rn_1
      _type_hint: number
    - category: table_calculation
      expression: "(${revenue}/${revenue_last_year})-1"
      label: "%Revenue"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: revenue_1
      _type_hint: number
    - category: table_calculation
      expression: "(${cancellations}/${cancellations_last_year})-1"
      label: "%Cancellations"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: cancellations_1
      _type_hint: number
    - category: table_calculation
      expression: "(${lead_time}/${lead_time_last_year})-1"
      label: "%LeadTime"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: leadtime
      _type_hint: number
    - category: table_calculation
      expression: "(${av_los}/${av_los_last_year})-1"
      label: "%AvLos"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: avlos
      _type_hint: number
    - category: table_calculation
      expression: "(${adr}/${adr_last_year})-1"
      label: "%ADR"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: adr_1
      _type_hint: number
    - category: measure
      expression:
      label: Bookings
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.identifier
      _kind_hint: measure
      measure: bookings
      type: count_distinct
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
        mview_comparation_bookings.cancelled: 'No'
    - category: measure
      expression:
      label: Bookings last year
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.identifier
      _kind_hint: measure
      measure: bookings_last_year
      type: count_distinct
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
        mview_comparation_bookings.cancelled: 'No'
    - category: measure
      expression:
      label: RN
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression:
      label: RN last year
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn_last_year
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: measure
      expression:
      label: Revenue
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression:
      label: Revenue last year
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue_last_year
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: measure
      expression:
      label: Cancellations
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.cancellation
      _kind_hint: measure
      measure: cancellations
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression:
      label: Cancellations last year
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.cancellation
      _kind_hint: measure
      measure: cancellations_last_year
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: measure
      expression:
      label: Lead time
      value_format:
      value_format_name: decimal_0
      based_on: mview_comparation_bookings.advance
      _kind_hint: measure
      measure: lead_time
      type: average
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
        mview_comparation_bookings.cancelled: 'No'
    - category: measure
      expression:
      label: Lead time last year
      value_format:
      value_format_name: decimal_0
      based_on: mview_comparation_bookings.advance
      _kind_hint: measure
      measure: lead_time_last_year
      type: average
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
        mview_comparation_bookings.cancelled: 'No'
    - category: measure
      expression:
      label: Av. LoS.
      value_format:
      value_format_name: decimal_1
      based_on: mview_comparation_bookings.nights
      _kind_hint: measure
      measure: av_los
      type: average
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
        mview_comparation_bookings.cancelled: 'No'
    - category: measure
      expression:
      label: Av. LoS. last year
      value_format:
      value_format_name: decimal_1
      based_on: mview_comparation_bookings.nights
      _kind_hint: measure
      measure: av_los_last_year
      type: average
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
        mview_comparation_bookings.cancelled: 'No'
    - category: table_calculation
      expression: "${revenue}/${bookings}"
      label: Ticket Medio
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: ticket_medio
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      mview_comparation_bookings.full_country: left
    column_order: [mview_comparation_bookings.full_country, bookings, bookings_1,
      rn, rn_1, revenue, revenue_1, cancellations, cancellations_1, lead_time, leadtime,
      av_los, avlos, adr, adr_1]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      bookings_1: "%"
      rn_1: "%"
      revenue_1: "%"
      leadtime: "%"
      avlos: "%"
      adr_1: "%"
      cancellations_1: "%"
      mview_comparation_bookings.full_country: Country
    series_cell_visualizations:
      bookings:
        is_active: false
    header_font_color: "#FFF"
    header_background_color: "#416ba9"
    conditional_formatting: [{type: along a scale..., value: 0, background_color: '',
        font_color: "#EA4335", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: f7c7d9fe-b9b7-e5ef-fd11-6366fa981d7c, label: Custom, type: continuous,
            stops: [{color: "#416BA9", offset: 0}, {color: "#FFFF", offset: 50}, {
                color: "#A81D15", offset: 100}]}, options: {steps: 25, constraints: {
              min: {type: number, value: -50}, mid: {type: number, value: 0}, max: {
                type: number, value: 100}}, mirror: true, reverse: false, stepped: true}},
        bold: true, italic: false, strikethrough: false, fields: [cancellations]},
      {type: along a scale..., value: !!null '', background_color: "#1A73E8", font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, custom: {
            id: 696cf4ef-e9fd-a821-5083-71a0465a2dfe, label: Custom, type: continuous,
            stops: [{color: "#A81D15", offset: 0}, {color: "#FFFFFF", offset: 50},
              {color: "#416BA9", offset: 100}]}, options: {steps: 20, constraints: {
              min: {type: number, value: -1}, mid: {type: number, value: 0}, max: {
                type: number, value: 1}}, mirror: false, reverse: false, stepped: true}},
        bold: false, italic: false, strikethrough: false, fields: [adr_1, bookings_1,
          rn_1, leadtime, avlos, revenue_1]}, {type: along a scale..., value: !!null '',
        background_color: "#1A73E8", font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: 5253a98b-aa47-a1de-9c2d-7ac8cc8539f5, label: Custom, type: continuous,
            stops: [{color: "#A81D15", offset: 0}, {color: "#FFFFFF", offset: 50},
              {color: "#416BA9", offset: 100}]}, options: {steps: 20, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: true}}, bold: false, italic: false,
        strikethrough: false, fields: [bookings]}, {type: along a scale..., value: !!null '',
        background_color: "#1A73E8", font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: bbee9e10-6010-559b-fb0c-98419cc3700f, label: Custom, type: continuous,
            stops: [{color: "#A81D15", offset: 0}, {color: "#FFFFFF", offset: 50},
              {color: "#416BA9", offset: 100}]}, options: {steps: 20, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: true}}, bold: false, italic: false,
        strikethrough: false, fields: [rn]}, {type: along a scale..., value: !!null '',
        background_color: "#1A73E8", font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: b83461a6-fa4e-f6cb-9ce9-45bd43696a4b, label: Custom, type: continuous,
            stops: [{color: "#A81D15", offset: 0}, {color: "#FFFFFF", offset: 50},
              {color: "#416BA9", offset: 100}]}, options: {steps: 20, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: true}}, bold: false, italic: false,
        strikethrough: false, fields: [revenue]}, {type: along a scale..., value: !!null '',
        background_color: "#1A73E8", font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: bcdf2921-2c73-6fec-9d3c-5c1b5a3cadd6, label: Custom, type: continuous,
            stops: [{color: "#A81D15", offset: 0}, {color: "#FFFFFF", offset: 50},
              {color: "#416BA9", offset: 100}]}, options: {steps: 20, constraints: {
              min: {type: number, value: -1}, mid: {type: number, value: 0}, max: {
                type: number, value: 1}}, mirror: true, reverse: false, stepped: true}},
        bold: false, italic: false, strikethrough: false, fields: [lead_time]}, {
        type: along a scale..., value: !!null '', background_color: "#1A73E8", font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, custom: {
            id: c821808b-028f-1e8a-075f-0d9b7447e4e3, label: Custom, type: continuous,
            stops: [{color: "#A81D15", offset: 0}, {color: "#FFFFFF", offset: 50},
              {color: "#416BA9", offset: 100}]}, options: {steps: 20, constraints: {
              min: {type: number, value: -1}, mid: {type: number, value: 0}, max: {
                type: number, value: 5}}, mirror: false, reverse: false, stepped: true}},
        bold: false, italic: false, strikethrough: false, fields: [av_los]}, {type: along
          a scale..., value: !!null '', background_color: "#1A73E8", font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, custom: {
            id: a7823f7e-c79e-8b59-ec85-a11954e84cff, label: Custom, type: continuous,
            stops: [{color: "#416BA9", offset: 0}, {color: "#FFFFFF", offset: 50},
              {color: "#A81D15", offset: 100}]}, options: {steps: 20, constraints: {
              min: {type: number, value: -1}, mid: {type: number, value: 0}, max: {
                type: number, value: 1}}, mirror: false, reverse: false, stepped: true}},
        bold: false, italic: false, strikethrough: false, fields: [cancellations_1]},
      {type: along a scale..., value: !!null '', background_color: "#1A73E8", font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, custom: {
            id: 44088835-e1c6-ecc5-9f2f-0475ea33eb29, label: Custom, type: continuous,
            stops: [{color: "#A81D15", offset: 0}, {color: "#FFFFFF", offset: 50},
              {color: "#416BA9", offset: 100}]}, options: {steps: 20, constraints: {
              min: {type: minimum}, mid: {type: percentile, value: !!null ''}, max: {
                type: number, value: 300}}, mirror: false, reverse: false, stepped: true}},
        bold: false, italic: false, strikethrough: false, fields: [adr]}, {type: along
          a scale..., value: !!null '', background_color: "#1A73E8", font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, custom: {
            id: 910e72e6-f3f6-038e-83b4-c7c2a93985b2, label: Custom, type: continuous,
            stops: [{color: "#A81D15", offset: 0}, {color: "#FFFFFF", offset: 50},
              {color: "#1a73e8", offset: 100}]}, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [ticket_medio]}]
    defaults_version: 1
    hidden_fields: [bookings_last_year, rn_last_year, revenue_last_year, cancellations_last_year,
      lead_time_last_year, av_los_last_year, adr_last_year]
    note_state: collapsed
    note_display: hover
    note_text: Reservations by country
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 51
    col: 0
    width: 24
    height: 8
  - title: On the books
    name: On the books
    model: bq_demo_c
    explore: mview_comparation_bookings_by_start_date
    type: looker_grid
    fields: [mview_comparation_bookings_by_start_date.partition_timestamp_month, bookings,
      bookings_previous_year, rn, rn_previous_year, revenue, revenue_ly, cancellations,
      cancellations_previous_year, av_los, bookings_cancelled, bookings_cancelled_previous_year,
      av_los_previous_year, lead_time, lead_time_previous_year, mview_comparation_bookings_by_start_date.partition_timestamp_month_name,
      total_rooms, mview_comparation_bookings_by_start_date.month_days]
    filters:
      mview_comparation_bookings_by_start_date.promo: ''
      mview_comparation_bookings_by_start_date.promocode: ''
    sorts: [mview_comparation_bookings_by_start_date.partition_timestamp_month]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression: ''
      label: Bookings
      based_on: mview_comparation_bookings_by_start_date.identifier
      _kind_hint: measure
      measure: bookings
      type: count_distinct
      _type_hint: number
      filters:
        mview_comparation_bookings_by_start_date.last_year_booking: '0'
        mview_comparation_bookings_by_start_date.cancelled: 'No'
    - category: measure
      expression: ''
      label: Bookings previous year
      based_on: mview_comparation_bookings_by_start_date.identifier
      _kind_hint: measure
      measure: bookings_previous_year
      type: count_distinct
      _type_hint: number
      filters:
        mview_comparation_bookings_by_start_date.last_year_booking: '1'
        mview_comparation_bookings_by_start_date.cancelled: 'No'
    - category: measure
      expression: ''
      label: RN
      based_on: mview_comparation_bookings_by_start_date.rn
      _kind_hint: measure
      measure: rn
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings_by_start_date.last_year_booking: '0'
    - category: measure
      expression: ''
      label: RN previous year
      based_on: mview_comparation_bookings_by_start_date.rn
      _kind_hint: measure
      measure: rn_previous_year
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings_by_start_date.last_year_booking: '1'
    - category: measure
      expression: ''
      label: Revenue
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings_by_start_date.revenue
      _kind_hint: measure
      measure: revenue
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings_by_start_date.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Revenue LY
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings_by_start_date.revenue
      _kind_hint: measure
      measure: revenue_ly
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings_by_start_date.last_year_booking: '1'
    - category: measure
      expression: ''
      label: Cancellations
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings_by_start_date.cancellation
      _kind_hint: measure
      measure: cancellations
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings_by_start_date.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Cancellations previous year
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings_by_start_date.cancellation
      _kind_hint: measure
      measure: cancellations_previous_year
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings_by_start_date.last_year_booking: '1'
    - category: measure
      expression: ''
      label: Av. LoS.
      value_format:
      value_format_name: decimal_1
      based_on: mview_comparation_bookings_by_start_date.nights
      _kind_hint: measure
      measure: av_los
      type: average
      _type_hint: number
      filters:
        mview_comparation_bookings_by_start_date.last_year_booking: '0'
        mview_comparation_bookings_by_start_date.cancelled: 'No'
    - category: measure
      expression: ''
      label: Av. LoS. previous year
      value_format:
      value_format_name: decimal_1
      based_on: mview_comparation_bookings_by_start_date.nights
      _kind_hint: measure
      measure: av_los_previous_year
      type: average
      _type_hint: number
      filters:
        mview_comparation_bookings_by_start_date.last_year_booking: '1'
        mview_comparation_bookings_by_start_date.cancelled: 'No'
    - category: measure
      expression: ''
      label: Bookings cancelled
      based_on: mview_comparation_bookings_by_start_date.identifier
      _kind_hint: measure
      measure: bookings_cancelled
      type: count_distinct
      _type_hint: number
      filters:
        mview_comparation_bookings_by_start_date.last_year_booking: '0'
        mview_comparation_bookings_by_start_date.cancelled: 'Yes'
    - category: measure
      expression: ''
      label: Bookings cancelled previous year
      based_on: mview_comparation_bookings_by_start_date.identifier
      _kind_hint: measure
      measure: bookings_cancelled_previous_year
      type: count_distinct
      _type_hint: number
      filters:
        mview_comparation_bookings_by_start_date.last_year_booking: '1'
        mview_comparation_bookings_by_start_date.cancelled: 'Yes'
    - category: table_calculation
      expression: "${revenue}/${rn}"
      label: ADR
      value_format:
      value_format_name: eur
      _kind_hint: measure
      table_calculation: adr
      _type_hint: number
    - category: table_calculation
      expression: "${revenue_ly}/${rn_previous_year}"
      label: ADR previous year
      value_format:
      value_format_name: eur
      _kind_hint: measure
      table_calculation: adr_previous_year
      _type_hint: number
    - category: table_calculation
      expression: "(${bookings}/${bookings_previous_year})-1"
      label: "%Bookings"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: bookings_1
      _type_hint: number
    - category: table_calculation
      expression: "(${av_los}/${av_los_previous_year})-1"
      label: "%AvLos"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: avlos
      _type_hint: number
    - category: table_calculation
      expression: "(${bookings_cancelled}/${bookings_cancelled_previous_year})-1"
      label: "%BookingsCancelled"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: bookingscancelled
      _type_hint: number
    - category: table_calculation
      expression: "(${cancellations}/${cancellations_previous_year})-1"
      label: "%Cancellations"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: cancellations_1
      _type_hint: number
    - category: table_calculation
      expression: "(${revenue}/${revenue_ly})-1"
      label: "%Revenue"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: revenue_1
      _type_hint: number
    - category: table_calculation
      expression: "(${rn}/${rn_previous_year})-1"
      label: "%RN"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rn_1
      _type_hint: number
    - category: table_calculation
      expression: "(${adr}/${adr_previous_year})-1"
      label: "%ADR"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: adr_1
      _type_hint: number
    - category: measure
      expression: ''
      label: Lead Time
      based_on: mview_comparation_bookings_by_start_date.advance
      _kind_hint: measure
      measure: lead_time
      type: average
      _type_hint: number
      filters:
        mview_comparation_bookings_by_start_date.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Lead Time previous year
      based_on: mview_comparation_bookings_by_start_date.advance
      _kind_hint: measure
      measure: lead_time_previous_year
      type: average
      _type_hint: number
      filters:
        mview_comparation_bookings_by_start_date.last_year_booking: '1'
    - category: table_calculation
      expression: "(${lead_time}/${lead_time_previous_year})-1"
      label: "%lead"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: lead
      _type_hint: number
    - category: measure
      expression:
      label: count_day
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings_by_start_date.partition_timestamp_date
      _kind_hint: measure
      measure: count_day
      type: count_distinct
      _type_hint: number
    - category: measure
      expression:
      label: Total Rooms
      value_format:
      value_format_name:
      based_on: hotels_data.total_rooms
      _kind_hint: measure
      measure: total_rooms
      type: sum
      _type_hint: number
    - category: table_calculation
      expression: "${total_rooms}*${mview_comparation_bookings_by_start_date.month_days}"
      label: noches dispo
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: noches_dispo
      _type_hint: number
    - category: table_calculation
      expression: "${rn}/${noches_dispo}"
      label: Percentage Occupation
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: percentage_occupation
      _type_hint: number
    - category: table_calculation
      expression: "${rn_1}/${noches_dispo}"
      label: " Percentage Occupation LY"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: percentage_occupation_ly
      _type_hint: number
    - category: table_calculation
      expression: "(${percentage_occupation}/${percentage_occupation_ly})-1"
      label: diff
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: diff
      _type_hint: number
    - category: table_calculation
      expression: "${revenue}/${bookings}"
      label: Ticket Medio
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: ticket_medio
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      mview_comparation_bookings_by_start_date.partition_timestamp_month_name: left
    column_order: [mview_comparation_bookings_by_start_date.partition_timestamp_month_name,
      bookings, bookings_1, rn, rn_1, revenue, revenue_ly, revenue_1, cancellations,
      cancellations_1, lead_time, lead, av_los, avlos, bookings_cancelled, bookingscancelled,
      adr, adr_1]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      mview_comparation_bookings_by_start_date.partition_timestamp_month: Month
      bookings_1: "%"
      avlos: "%"
      revenue_1: "%"
      rn_1: "%"
      adr_1: "%"
      bookingscancelled: "%"
      cancellations_1: "%"
      lead: "%"
      mview_comparation_bookings_by_start_date.month_text_startDate: Month
      cancellations: Cxl
      lead_time: Lead time
      bookings_cancelled: Bookings Cxl
      mview_comparation_bookings_by_start_date.partition_timestamp_month_name: Month
    series_column_widths:
      cancellations: 99
    series_cell_visualizations:
      bookings:
        is_active: false
    header_font_color: "#FFF"
    header_background_color: "#416BA9"
    conditional_formatting: [{type: along a scale..., value: 0, background_color: '',
        font_color: "#7CB342", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: a1727ab2-58ca-d212-dbba-e844723ddde2, label: Custom, type: continuous,
            stops: [{color: "#EA4335", offset: 0}, {color: "#FFFFFF", offset: 50},
              {color: "#416BA9", offset: 100}]}, options: {steps: 20, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: true}}, bold: true, italic: false,
        strikethrough: false, fields: [bookings_1, avlos, revenue_1, rn_1, lead]},
      {type: along a scale..., value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, custom: {
            id: d8919720-414f-4443-2318-fce894b2e1ed, label: Custom, type: continuous,
            stops: [{color: "#416BA9", offset: 0}, {color: "#FFFFFF", offset: 50},
              {color: "#b21d18", offset: 100}]}, options: {steps: 20, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: true}}, bold: true, italic: false,
        strikethrough: false, fields: [bookingscancelled, cancellations_1]}, {type: along
          a scale..., value: !!null '', background_color: "#1A73E8", font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, custom: {
            id: 1537bd33-ffa0-e823-0621-f9d9ac6574ab, label: Custom, type: continuous,
            stops: [{color: "#b21d18", offset: 0}, {color: "#ffffff", offset: 50},
              {color: "#416BA9", offset: 100}]}, options: {steps: 20, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: true}}, bold: false, italic: false,
        strikethrough: false, fields: [revenue, revenue_ly]}, {type: along a scale...,
        value: !!null '', background_color: "#1A73E8", font_color: !!null '', color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, custom: {id: f3cd8025-8691-8b63-7958-fc18cd959e64,
            label: Custom, type: continuous, stops: [{color: "#b21d18", offset: 0},
              {color: "#ffffff", offset: 50}, {color: "#416BA9", offset: 100}]}, options: {
            steps: 20, constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: true}},
        bold: false, italic: false, strikethrough: false, fields: [bookings]}, {type: along
          a scale..., value: !!null '', background_color: "#1A73E8", font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, custom: {
            id: 95820946-7b11-c29f-e07d-241db52c7a5c, label: Custom, type: continuous,
            stops: [{color: "#416BA9", offset: 0}, {color: "#ffffff", offset: 50},
              {color: "#b21d18", offset: 100}]}, options: {steps: 20, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: true}}, bold: false, italic: false,
        strikethrough: false, fields: [cancellations]}, {type: along a scale..., value: !!null '',
        background_color: "#1A73E8", font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: 7bba4f64-5119-93ff-62e0-9490a497fb2e, label: Custom, type: continuous,
            stops: [{color: "#416BA9", offset: 0}, {color: "#FFFFFF", offset: 50},
              {color: "#b21d18", offset: 100}]}, options: {steps: 20, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: true}}, bold: false, italic: false,
        strikethrough: false, fields: [bookings_cancelled]}, {type: along a scale...,
        value: !!null '', background_color: "#1A73E8", font_color: !!null '', color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, custom: {id: 7adae8fe-b37a-72ad-6d2e-5149c331e83a,
            label: Custom, type: continuous, stops: [{color: "#416BA9", offset: 0},
              {color: "#FFFFFF", offset: 50}, {color: "#416BA9", offset: 100}]}, options: {
            steps: 20, constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: true}},
        bold: false, italic: false, strikethrough: false, fields: [lead_time]}, {
        type: along a scale..., value: !!null '', background_color: "#1A73E8", font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, custom: {
            id: fb34fcf7-3e57-b7bc-acca-c8d333e9eb42, label: Custom, type: continuous,
            stops: [{color: "#b21d18", offset: 0}, {color: "#FFFFFF", offset: 50},
              {color: "#416BA9", offset: 100}]}, options: {steps: 20, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: true}}, bold: false, italic: false,
        strikethrough: false, fields: [rn]}, {type: along a scale..., value: !!null '',
        background_color: "#1A73E8", font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: 4ce65086-7c41-9c65-b5f7-0f0a81a0fe90, label: Custom, type: continuous,
            stops: [{color: "#b21d18", offset: 0}, {color: "#FFFFFF", offset: 50},
              {color: "#416BA9", offset: 100}]}, options: {steps: 15, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: true}}, bold: false, italic: false,
        strikethrough: false, fields: [av_los]}, {type: along a scale..., value: !!null '',
        background_color: "#1A73E8", font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: 61c166d6-55a5-c960-1646-e8440ed22a9a, label: Custom, type: continuous,
            stops: [{color: "#b21d18", offset: 0}, {color: "#FFFFFF", offset: 50},
              {color: "#416BA9", offset: 100}]}, options: {steps: 20, constraints: {
              min: {type: minimum}, mid: {type: number, value: 150}, max: {type: number,
                value: 0}}, mirror: true, reverse: false, stepped: true}}, bold: false,
        italic: false, strikethrough: false, fields: [adr]}, {type: along a scale...,
        value: !!null '', background_color: "#1A73E8", font_color: !!null '', color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, custom: {id: 993bdae4-2da9-e039-ccc7-d2f092fa7ae7,
            label: Custom, type: continuous, stops: [{color: "#b21d18", offset: 0},
              {color: "#FFFFFF", offset: 50}, {color: "#416BA9", offset: 100}]}, options: {
            steps: 20, constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: true}},
        bold: false, italic: false, strikethrough: false, fields: [adr_1]}, {type: along
          a scale..., value: !!null '', background_color: "#1A73E8", font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, custom: {
            id: eca09663-89e8-8b22-8f66-13d481beeb0e, label: Custom, type: continuous,
            stops: [{color: "#b21d18", offset: 0}, {color: "#FFFFFF", offset: 50},
              {color: "#1a73e8", offset: 100}]}, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [ticket_medio]}]
    series_value_format:
      lead_time:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    hidden_fields: [bookings_previous_year, rn_previous_year, revenue_previous_year,
      cancellations_previous_year, bookings_cancelled_previous_year, adr_previous_year,
      av_los_previous_year, lead_time_previous_year, mview_comparation_bookings_by_start_date.partition_timestamp_month,
      diff, total_rooms, percentage_occupation_ly, mview_comparation_bookings_by_start_date.month_days,
      noches_dispo, percentage_occupation]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: The total number of confirmed reservations a hotel has for future dates,
      including room nights and revenue.
    listen:
      Room: mview_comparation_bookings_by_start_date.room
      Device: mview_comparation_bookings_by_start_date.device
      Source: mview_comparation_bookings_by_start_date.source_fixed
      OTB*: mview_comparation_bookings_by_start_date.partition_timestamp_date
      Market: mview_comparation_bookings_by_start_date.full_country
      RateName: mview_comparation_bookings_by_start_date.rateName_fixed
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 31
    col: 0
    width: 24
    height: 7
  - title: Sources
    name: Sources
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_grid
    fields: [revenue, revenue_previo, bookings, bookings_previ, mview_comparation_bookings.source_fixed,
      rn, rn_ly]
    filters:
      mview_comparation_bookings.cancelled: 'No'
      mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: NOT
        NULL
    sorts: [revenue desc 0]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression: ''
      label: Revenue
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Revenue previo
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue_previo
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "\n(${revenue}/${revenue_previo})-1 \n"
      label: "%rev"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rev
      _type_hint: number
    - category: measure
      expression:
      label: Bookings
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression:
      label: Bookings previ
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings_previ
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "(${bookings}/${bookings_previ})-1"
      label: "%bookings"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: bookings_1
      _type_hint: number
    - category: table_calculation
      label: "%weight"
      value_format:
      value_format_name: percent_0
      calculation_type: percent_of_column_sum
      table_calculation: weight
      args:
      - revenue
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: RN
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: RN LY
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn_ly
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${revenue}/${rn}"
      label: ADR
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: adr
      _type_hint: number
    - category: table_calculation
      expression: "${revenue_previo}/${rn_ly}"
      label: ADR LY
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: adr_ly
      _type_hint: number
    - category: table_calculation
      expression: "(${adr}/${adr_ly})-1 \n"
      label: "%ADR"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: adr_1
      _type_hint: number
    - category: table_calculation
      expression: "(${rn}/${rn_ly})-1 \n"
      label: RN%
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rn_1
      _type_hint: number
    - category: table_calculation
      expression: "${revenue}/${bookings}"
      label: Ticket Medio
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: ticket_medio
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      mview_comparation_bookings.source_fixed: left
    column_order: [mview_comparation_bookings.source_fixed, revenue, rev, bookings,
      bookings_1, rn, rn_1, adr, adr_1, weight]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 60
    series_labels:
      rev: "%"
      bookings_1: "%"
      adr_1: "%"
      weight: weight
      rn_1: "%"
    series_column_widths:
      bookings_1: 60
      rev: 60
      weight: 60
      adr_1: 60
      mview_comparation_bookings.source_fixed: 100
    series_cell_visualizations:
      revenue:
        is_active: false
    header_font_color: "#ffffff"
    header_background_color: "#416BA9"
    conditional_formatting: [{type: equal to, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [rev, bookings_1,
          adr_1]}, {type: greater than, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [rev, bookings_1,
          adr_1]}, {type: less than, value: 0, background_color: '', font_color: "#EA4335",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [bookings_1, rev,
          adr_1]}]
    hidden_fields: [bookings_previ, revenue_previo, rn_ly, adr_ly]
    hidden_points_if_no: []
    color_by_type: gradient
    toColor: ["#416BA9", "#416edc", "#EE7772"]
    value_labels: true
    value_titles: true
    font_size_value: '15'
    font_size_label: '15'
    size_by: revenue
    color_by: bookings
    truncate_column_names: false
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: |2-

      Last-Click Attribution
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 84
    col: 12
    width: 12
    height: 9
  - title: Boards
    name: Boards
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_grid
    fields: [revenue, revenue_previo, bookings, bookings_previ, rn, rn_ly, mview_comparation_bookings.board]
    filters:
      mview_comparation_bookings.cancelled: 'No'
      mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: NOT
        NULL
    sorts: [revenue desc 0]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression: ''
      label: Revenue
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Revenue previo
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue_previo
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "\n(${revenue}/${revenue_previo})-1 \n"
      label: "%rev"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rev
      _type_hint: number
    - category: measure
      expression:
      label: Bookings
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression:
      label: Bookings previ
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings_previ
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "(${bookings}/${bookings_previ})-1"
      label: "%bookings"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: bookings_1
      _type_hint: number
    - category: table_calculation
      label: "%weight"
      value_format:
      value_format_name: percent_0
      calculation_type: percent_of_column_sum
      table_calculation: weight
      args:
      - revenue
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: RN
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: RN LY
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn_ly
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${revenue}/${rn}"
      label: ADR
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: adr
      _type_hint: number
    - category: table_calculation
      expression: "${revenue_previo}/${rn_ly}"
      label: ADR LY
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: adr_ly
      _type_hint: number
    - category: table_calculation
      expression: "(${adr}/${adr_ly})-1 \n"
      label: "%ADR"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: adr_1
      _type_hint: number
    - category: table_calculation
      expression: "(${rn}/${rn_ly})-1 \n"
      label: RN%
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rn_1
      _type_hint: number
    - category: table_calculation
      expression: "${revenue}/${bookings}"
      label: Ticket Medio
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: ticket_medio
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      mview_comparation_bookings.board: left
    column_order: [mview_comparation_bookings.board, revenue, rev, bookings, bookings_1,
      rn, rn_1, adr, adr_1, weight]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 60
    series_labels:
      rev: "%"
      bookings_1: "%"
      adr_1: "%"
      weight: weight
      rn_1: "%"
    series_column_widths:
      rev: 60
      adr_1: 50
      weight: 60
      adr: 60
      revenue: 75
      bookings: 75
      bookings_1: 50
      rn: 94
      rn_1: 68
    series_cell_visualizations:
      revenue:
        is_active: false
    header_font_color: "#ffffff"
    header_background_color: "#416BA9"
    conditional_formatting: [{type: equal to, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [rev, bookings_1,
          adr_1, rn_1]}, {type: greater than, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [rev, bookings_1,
          adr_1, rn_1]}, {type: less than, value: 0, background_color: '', font_color: "#EA4335",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [bookings_1, rev,
          weight, adr_1, rn_1]}]
    truncate_column_names: false
    defaults_version: 1
    hidden_fields: [bookings_previ, revenue_previo, rn_ly, adr_ly]
    note_state: collapsed
    note_display: hover
    note_text: Performance metrics broken down by board type (e.g., All Inclusive,
      Room Only)
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 75
    col: 6
    width: 12
    height: 7
  - title: Occupation
    name: Occupation
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_grid
    fields: [revenue, revenue_previo, bookings, bookings_previ, rn, rn_ly, mview_comparation_bookings.occupation]
    filters:
      mview_comparation_bookings.cancelled: 'No'
      mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: NOT
        NULL
    sorts: [revenue desc 0]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression: ''
      label: Revenue
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Revenue previo
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue_previo
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "\n(${revenue}/${revenue_previo})-1 \n"
      label: "%rev"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rev
      _type_hint: number
    - category: measure
      expression:
      label: Bookings
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression:
      label: Bookings previ
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings_previ
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "(${bookings}/${bookings_previ})-1"
      label: "%bookings"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: bookings_1
      _type_hint: number
    - category: table_calculation
      label: "%weight"
      value_format:
      value_format_name: percent_0
      calculation_type: percent_of_column_sum
      table_calculation: weight
      args:
      - revenue
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: RN
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: RN LY
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn_ly
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${revenue}/${rn}"
      label: ADR
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: adr
      _type_hint: number
    - category: table_calculation
      expression: "${revenue_previo}/${rn_ly}"
      label: ADR LY
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: adr_ly
      _type_hint: number
    - category: table_calculation
      expression: "(${adr}/${adr_ly})-1 \n"
      label: "%ADR"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: adr_1
      _type_hint: number
    - category: table_calculation
      expression: "(${rn}/${rn_ly})-1\n\n"
      label: RN%
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rn_1
      _type_hint: number
    - category: table_calculation
      expression: "${revenue}/${bookings}"
      label: Ticket Medio
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: ticket_medio
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      mview_comparation_bookings.occupation: left
    column_order: [mview_comparation_bookings.occupation, revenue, rev, bookings,
      bookings_1, rn, rn_1, adr, adr_1, weight]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 60
    series_labels:
      rev: "%"
      bookings_1: "%"
      adr_1: "%"
      weight: weight
      rn_1: "%"
    series_column_widths:
      rev: 60
      bookings_1: 60
      weight: 60
      adr_1: 60
      rn_1: 60
    series_cell_visualizations:
      revenue:
        is_active: false
      rn_1:
        is_active: false
    header_font_color: "#ffffff"
    header_background_color: "#416BA9"
    conditional_formatting: [{type: equal to, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [rev, bookings_1,
          adr_1, rn_1]}, {type: greater than, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [rev, bookings_1,
          adr_1, rn_1]}, {type: less than, value: 0, background_color: '', font_color: "#EA4335",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [bookings_1, rev,
          adr_1, rn_1]}]
    truncate_column_names: false
    defaults_version: 1
    hidden_fields: [bookings_previ, revenue_previo, rn_ly, adr_ly]
    note_state: collapsed
    note_display: hover
    note_text: Distribution of bookings by room occupancy (adults-children-babies).
      Includes revenue, bookings, room nights (RN), ADR, and their relative weight.
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 61
    col: 12
    width: 12
    height: 7
  - title: Devices
    name: Devices
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_grid
    fields: [revenue, revenue_previo, bookings, bookings_previ, rn, rn_ly, mview_comparation_bookings.device]
    filters:
      mview_comparation_bookings.cancelled: 'No'
      mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: NOT
        NULL
    sorts: [revenue desc 0]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression: ''
      label: Revenue
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Revenue previo
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue_previo
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "\n(${revenue}/${revenue_previo})-1 \n"
      label: "%rev"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rev
      _type_hint: number
    - category: measure
      expression:
      label: Bookings
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression:
      label: Bookings previ
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings_previ
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "(${bookings}/${bookings_previ})-1"
      label: "%bookings"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: bookings_1
      _type_hint: number
    - category: table_calculation
      label: "%weight"
      value_format:
      value_format_name: percent_0
      calculation_type: percent_of_column_sum
      table_calculation: weight
      args:
      - revenue
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: RN
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: RN LY
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn_ly
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${revenue}/${rn}"
      label: ADR
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: adr
      _type_hint: number
    - category: table_calculation
      expression: "${revenue_previo}/${rn_ly}"
      label: ADR LY
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: adr_ly
      _type_hint: number
    - category: table_calculation
      expression: "(${adr}/${adr_ly})-1 \n"
      label: "%ADR"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: adr_1
      _type_hint: number
    - category: table_calculation
      expression: "(${rn}/${rn_ly})-1 \n"
      label: RN%
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rn_1
      _type_hint: number
    - category: table_calculation
      expression: "${revenue}/${bookings}"
      label: Ticket Medio
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: ticket_medio
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      mview_comparation_bookings.device: left
    column_order: [mview_comparation_bookings.device, revenue, rev, bookings, bookings_1,
      rn, rn_1, adr, adr_1, weight]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 60
    series_labels:
      rev: "%"
      bookings_1: "%"
      adr_1: "%"
      weight: weight
      rn_1: "%"
    series_column_widths:
      rev: 60
      weight: 60
      bookings_1: 60
      adr_1: 60
    series_cell_visualizations:
      revenue:
        is_active: false
    header_font_color: "#ffffff"
    header_background_color: "#416BA9"
    conditional_formatting: [{type: equal to, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [rev, bookings_1,
          adr_1]}, {type: greater than, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [rev, bookings_1,
          adr_1]}, {type: less than, value: 0, background_color: '', font_color: "#EA4335",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [bookings_1, rev,
          adr_1]}]
    hidden_fields: [bookings_previ, revenue_previo, rn_ly, adr_ly]
    hidden_points_if_no: []
    color_by_type: gradient
    toColor: ["#416BA9", "#12B5CB", "#E52592", "#E8710A", "#F9AB00", "#7CB342", "#9334E6",
      "#80868B", "#079c98", "#A8A116", "#EA4335", "#FF8168"]
    value_labels: true
    value_titles: true
    font_size_value: '15'
    font_size_label: '15'
    size_by: revenue
    color_by: bookings
    truncate_column_names: false
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Performance metrics broken down by the type of device used to make
      bookings (e.g., Web, Mobile).
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 84
    col: 0
    width: 12
    height: 9
  - title: Rooms
    name: Rooms
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_grid
    fields: [revenue, revenue_previo, bookings, bookings_previ, rn, rn_ly, mview_comparation_bookings.room]
    filters:
      mview_comparation_bookings.cancelled: 'No'
      mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: NOT
        NULL
    sorts: [revenue desc 0]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression: ''
      label: Revenue
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Revenue previo
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue_previo
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "\n(${revenue}/${revenue_previo})-1 \n"
      label: "%rev"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rev
      _type_hint: number
    - category: measure
      expression:
      label: Bookings
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression:
      label: Bookings previ
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings_previ
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "(${bookings}/${bookings_previ})-1"
      label: "%bookings"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: bookings_1
      _type_hint: number
    - category: table_calculation
      label: "%weight"
      value_format:
      value_format_name: percent_0
      calculation_type: percent_of_column_sum
      table_calculation: weight
      args:
      - revenue
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: RN
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: RN LY
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn_ly
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${revenue}/${rn}"
      label: ADR
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: adr
      _type_hint: number
    - category: table_calculation
      expression: "${revenue_previo}/${rn_ly}"
      label: ADR LY
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: adr_ly
      _type_hint: number
    - category: table_calculation
      expression: "(${adr}/${adr_ly})-1 \n"
      label: "%ADR"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: adr_1
      _type_hint: number
    - category: table_calculation
      expression: "(${rn}/${rn_ly})-1 \n"
      label: RN%
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rn_1
      _type_hint: number
    - category: table_calculation
      expression: "${revenue}/${bookings}"
      label: Ticket Medio
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: ticket_medio
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      mview_comparation_bookings.room: left
    column_order: [mview_comparation_bookings.room, revenue, rev, bookings, bookings_1,
      rn, rn_1, adr, adr_1, weight]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 60
    series_labels:
      rev: "%"
      bookings_1: "%"
      adr_1: "%"
      weight: weight
      rn_1: "%"
    series_column_widths:
      rev: 60
      bookings_1: 60
      weight: 60
      adr_1: 60
      bookings: 75
      adr: 75
      revenue: 80
      rn: 73
      rn_1: 61
    series_cell_visualizations:
      revenue:
        is_active: false
    header_font_color: "#ffffff"
    header_background_color: "#416BA9"
    conditional_formatting: [{type: equal to, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [rev, bookings_1,
          adr_1, rn_1]}, {type: greater than, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [rev, bookings_1,
          adr_1, rn_1]}, {type: less than, value: 0, background_color: '', font_color: "#EA4335",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [bookings_1, rev,
          adr_1, rn_1]}]
    truncate_column_names: false
    defaults_version: 1
    hidden_fields: [bookings_previ, revenue_previo, rn_ly, adr_ly]
    note_state: collapsed
    note_display: hover
    note_text: Performance metrics broken down by individual room types.
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 68
    col: 0
    width: 12
    height: 7
  - title: Packages
    name: Packages
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_grid
    fields: [revenue, revenue_previo, bookings, bookings_previ, rn, rn_ly, mview_comparation_bookings.package_name]
    filters:
      mview_comparation_bookings.cancelled: 'No'
      mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: NOT
        NULL
      mview_comparation_bookings.package_name: "-EMPTY"
    sorts: [revenue desc 0]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression: ''
      label: Revenue
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Revenue previo
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue_previo
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "\n(${revenue}/${revenue_previo})-1 \n"
      label: "%rev"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: rev
      _type_hint: number
    - category: measure
      expression:
      label: Bookings
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression:
      label: Bookings previ
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings_previ
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "(${bookings}/${bookings_previ})-1"
      label: "%bookings"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: bookings_1
      _type_hint: number
    - category: table_calculation
      label: "%weight"
      value_format:
      value_format_name: percent_0
      calculation_type: percent_of_column_sum
      table_calculation: weight
      args:
      - revenue
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: RN
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: RN LY
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn_ly
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${revenue}/${rn}"
      label: ADR
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: adr
      _type_hint: number
    - category: table_calculation
      expression: "${revenue_previo}/${rn_ly}"
      label: ADR LY
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: adr_ly
      _type_hint: number
    - category: table_calculation
      expression: "(${adr}/${adr_ly})-1 \n"
      label: "%ADR"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: adr_1
      _type_hint: number
    - category: table_calculation
      expression: "(${rn}/${rn_ly})-1 \n"
      label: RN%
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rn_1
      _type_hint: number
    - category: table_calculation
      expression: "${revenue}/${bookings}"
      label: Ticket Medio
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: ticket_medio
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      mview_comparation_bookings.package_name: left
    column_order: [mview_comparation_bookings.package_name, revenue, rev, bookings,
      bookings_1, rn, rn_1, adr, adr_1, weight]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 10
    series_labels:
      rev: "%"
      bookings_1: "%"
      adr_1: "%"
      rn_1: "%"
    series_column_widths:
      revenue: 75
      bookings: 75
      rev: 60
      bookings_1: 60
      weight: 60
      adr: 60
      adr_1: 60
      rn: 90
      rn_1: 89
    series_cell_visualizations:
      revenue:
        is_active: false
    header_font_color: "#ffffff"
    header_background_color: "#416BA9"
    conditional_formatting: [{type: equal to, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [rev, bookings_1,
          adr_1]}, {type: greater than, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [rev, bookings_1,
          adr_1]}, {type: less than, value: 0, background_color: '', font_color: "#EA4335",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [bookings_1, rev,
          adr_1]}]
    truncate_column_names: false
    defaults_version: 1
    hidden_fields: [bookings_previ, revenue_previo, rn_ly, adr_ly]
    note_state: collapsed
    note_display: hover
    note_text: Performance metrics broken down by individual promotional packages
      or special offers.
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 95
    col: 0
    width: 12
    height: 7
  - title: Nights
    name: Nights (2)
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_grid
    fields: [revenue, revenue_previo, bookings, bookings_previ, rn, rn_ly, mview_comparation_bookings.nights]
    filters:
      mview_comparation_bookings.cancelled: 'No'
      mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: NOT
        NULL
    sorts: [revenue desc 0]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression: ''
      label: Revenue
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Revenue previo
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue_previo
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "\n(${revenue}/${revenue_previo})-1 \n"
      label: "%rev"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rev
      _type_hint: number
    - category: measure
      expression:
      label: Bookings
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression:
      label: Bookings previ
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings_previ
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "(${bookings}/${bookings_previ})-1"
      label: "%bookings"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: bookings_1
      _type_hint: number
    - category: table_calculation
      label: "%weight"
      value_format:
      value_format_name: percent_0
      calculation_type: percent_of_column_sum
      table_calculation: weight
      args:
      - revenue
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: RN
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: RN LY
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn_ly
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${revenue}/${rn}"
      label: ADR
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: adr
      _type_hint: number
    - category: table_calculation
      expression: "${revenue_previo}/${rn_ly}"
      label: ADR LY
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: adr_ly
      _type_hint: number
    - category: table_calculation
      expression: "(${adr}/${adr_ly})-1 \n"
      label: "%ADR"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: adr_1
      _type_hint: number
    - category: table_calculation
      expression: "(${rn}/${rn_ly})-1 \n"
      label: RN%
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rn_1
      _type_hint: number
    - category: table_calculation
      expression: "${revenue}/${bookings}"
      label: Ticket Medio
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: ticket_medio
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      mview_comparation_bookings.nights: left
    column_order: [mview_comparation_bookings.nights, revenue, rev, bookings, bookings_1,
      rn, rn_1, adr, adr_1, weight]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 60
    series_labels:
      rev: "%"
      bookings_1: "%"
      adr_1: "%"
      weight: weight
      rn_1: "%"
    series_column_widths:
      rev: 60
      bookings_1: 60
      weight: 60
      adr_1: 60
      rn_1: 77
    series_cell_visualizations:
      revenue:
        is_active: false
    series_text_format:
      rn_1: {}
    header_font_color: "#ffffff"
    header_background_color: "#416BA9"
    conditional_formatting: [{type: equal to, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [rev, bookings_1,
          adr_1, rn_1]}, {type: greater than, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [rev, bookings_1,
          adr_1, rn_1]}, {type: less than, value: 0, background_color: '', font_color: "#EA4335",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [bookings_1, rev,
          adr_1, rn_1]}]
    truncate_column_names: false
    defaults_version: 1
    hidden_fields: [bookings_previ, revenue_previo, rn_ly, adr_ly]
    note_state: collapsed
    note_display: hover
    note_text: Breakdown of bookings by length of stay. Shows revenue, number of bookings,
      room nights (RN), average daily rate (ADR), and their relative weight.
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 61
    col: 0
    width: 12
    height: 7
  - title: 'Mix Promotions '
    name: 'Mix Promotions '
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_grid
    fields: [revenue, revenue_previo, bookings, bookings_previ, rn, rn_ly, mview_comparation_bookings.promo,
      mview_comparation_bookings.promo2, mview_comparation_bookings.promocode, mview_comparation_bookings.promo3]
    filters:
      mview_comparation_bookings.cancelled: 'No'
      mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: NOT
        NULL
      mview_comparation_bookings.promo: "-EMPTY"
    sorts: [revenue desc 0]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression: ''
      label: Revenue
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Revenue previo
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue_previo
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "\n(${revenue}/${revenue_previo})-1 \n"
      label: "%rev"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: rev
      _type_hint: number
    - category: measure
      expression:
      label: Bookings
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression:
      label: Bookings previ
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings_previ
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "(${bookings}/${bookings_previ})-1"
      label: "%bookings"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: bookings_1
      _type_hint: number
    - category: table_calculation
      label: "%weight"
      value_format:
      value_format_name: percent_0
      calculation_type: percent_of_column_sum
      table_calculation: weight
      args:
      - revenue
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: RN
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: RN LY
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn_ly
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${revenue}/${rn}"
      label: ADR
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: adr
      _type_hint: number
    - category: table_calculation
      expression: "${revenue_previo}/${rn_ly}"
      label: ADR LY
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: adr_ly
      _type_hint: number
    - category: table_calculation
      expression: "(${adr}/${adr_ly})-1 \n"
      label: "%ADR"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: adr_1
      _type_hint: number
    - category: table_calculation
      expression: "(${rn}/${rn_ly})-1 \n"
      label: RN%
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rn_1
      _type_hint: number
    - category: table_calculation
      expression: "${revenue}/${bookings}"
      label: Ticket Medio
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: ticket_medio
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      mview_comparation_bookings.promo: left
      mview_comparation_bookings.promo2: left
      mview_comparation_bookings.promo3: left
      mview_comparation_bookings.promocode: left
    column_order: [mview_comparation_bookings.promo, mview_comparation_bookings.promo2,
      mview_comparation_bookings.promo3, mview_comparation_bookings.promocode, revenue,
      rev, bookings, bookings_1, adr, adr_1, weight]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 10
    series_labels:
      rev: "%"
      bookings_1: "%"
      adr_1: "%"
      rn_1: "%"
    series_column_widths:
      revenue: 75
      bookings: 75
      rev: 60
      bookings_1: 60
      weight: 60
      adr: 60
      adr_1: 60
      mview_comparation_bookings.promo: 90
      mview_comparation_bookings.promo2: 75
      mview_comparation_bookings.promocode: 75
      mview_comparation_bookings.promo3: 73
      rn: 83
      rn_1: 78
    series_cell_visualizations:
      revenue:
        is_active: false
    header_font_color: "#ffffff"
    header_background_color: "#416BA9"
    conditional_formatting: [{type: equal to, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [rev, bookings_1,
          adr_1, rn_1]}, {type: greater than, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [rev, bookings_1,
          adr_1, rn_1]}, {type: less than, value: 0, background_color: '', font_color: "#EA4335",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [bookings_1, rev,
          adr_1, rn_1]}]
    truncate_column_names: false
    defaults_version: 1
    hidden_fields: [bookings_previ, revenue_previo, rn_ly, adr_ly]
    note_state: collapsed
    note_display: hover
    note_text: Performance metrics for combinations of up to three promotional offers
      (Promo, Promo2, Promo3) and an associated Promocode.
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 139
    col: 12
    width: 12
    height: 7
  - title: Additional Service
    name: Additional Service
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_grid
    fields: [price, bookings, bookings_ly, price_ly, additional_services_consolidate.additional_service,
      amount, amount_ly, rn, rn_ly]
    filters:
      mview_comparation_bookings.promo: ''
      mview_comparation_bookings.promocode: ''
    sorts: [bookings desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: 'Price '
      value_format:
      value_format_name: eur_0
      based_on: additional_services_consolidate.converted_price
      _kind_hint: measure
      measure: price
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Bookings
      based_on: additional_services_consolidate.identifier
      _kind_hint: measure
      measure: bookings
      type: count_distinct
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: bookings ly
      based_on: additional_services_consolidate.identifier
      _kind_hint: measure
      measure: bookings_ly
      type: count_distinct
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: measure
      expression: ''
      label: Price  ly
      value_format:
      value_format_name: eur_0
      based_on: additional_services_consolidate.converted_price
      _kind_hint: measure
      measure: price_ly
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "(${bookings}/${bookings_ly})-1"
      label: "%Bookings"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: bookings_1
      _type_hint: number
    - category: table_calculation
      expression: "(${price}/${price_ly})-1"
      label: "%price"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: price_1
      _type_hint: number
    - category: measure
      expression: ''
      label: amount
      based_on: additional_services_consolidate.cantidad
      _kind_hint: measure
      measure: amount
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: amount ly
      based_on: additional_services_consolidate.cantidad
      _kind_hint: measure
      measure: amount_ly
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "(${amount}/${amount_ly})-1"
      label: "% amount"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: amount_1
      _type_hint: number
    - category: measure
      expression:
      label: RN
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression:
      label: RN_LY
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn_ly
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "(${rn}/${rn_ly})-1 \n"
      label: RN%
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rn_1
      _type_hint: number
    - category: table_calculation
      expression: "${price}/${bookings}"
      label: Ticket Medio
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: ticket_medio
      _type_hint: number
    filter_expression: matches_filter(${mview_comparation_bookings.comparation_partitiontimestamp_without_future_date},
      `NOT NULL`) AND matches_filter(${additional_services_consolidate.additional_service},
      `-EMPTY`) AND matches_filter(${additional_services_consolidate.additional_service},
      `-NULL`) AND matches_filter(${mview_comparation_bookings.identifier}, `-48271240`)
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      additional_services_consolidate.additional_service: left
    column_order: [additional_services_consolidate.additional_service, bookings, bookings_1,
      rn, rn_1, price, price_1, amount, amount_1]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      bookings_1: "%"
      price_1: "%"
      price: Revenue
      amount_1: "%"
      amount: Amount
      rn_1: "%"
    series_column_widths:
      bookings: 120
      price: 120
      bookings_1: 120
      price_1: 120
      additional_services_consolidate.additional_service: 250
    series_cell_visualizations:
      price:
        is_active: false
    header_font_color: "#FFFFFF"
    header_background_color: "#416BA9"
    conditional_formatting: [{type: equal to, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [bookings_1, price_1,
          amount_1]}, {type: greater than, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [bookings_1, price_1,
          amount_1]}, {type: less than, value: 0, background_color: '', font_color: "#EA4335",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [bookings_1, price_1,
          amount_1]}]
    truncate_column_names: false
    defaults_version: 1
    hidden_fields: [bookings_ly, price_ly, amount_ly, rn_ly]
    note_state: collapsed
    note_display: hover
    note_text: Performance metrics for various additional services offered to guests
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 95
    col: 12
    width: 12
    height: 7
  - title: On the Books
    name: On the Books
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_column
    fields: [revenue, revenue_previous_year, mview_comparation_bookings.comparation_startDate_month,
      total_revenue_month_ly, cancellation, cancellation_previous_year_copy, total_cancellation_month_ly]
    fill_fields: [mview_comparation_bookings.comparation_startDate_month]
    filters:
      mview_comparation_bookings.comparation_startDate_date: this year
    sorts: [mview_comparation_bookings.comparation_startDate_month]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Revenue
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
        mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: not
          null
    - category: measure
      expression: ''
      label: Revenue previous year
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue_previous_year
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
        mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: not
          null
    - category: measure
      expression: ''
      label: Total Revenue month LY
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: total_revenue_month_ly
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: measure
      expression: ''
      label: Cancellation
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.cancellation
      _kind_hint: measure
      measure: cancellation
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
        mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: not
          null
    - category: measure
      expression: ''
      label: Cancellation previous year Copy
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.cancellation
      _kind_hint: measure
      measure: cancellation_previous_year_copy
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
        mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: not
          null
    - category: measure
      expression: ''
      label: Total Cancellation month LY
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.cancellation
      _kind_hint: measure
      measure: total_cancellation_month_ly
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_label: Month
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: [cancellation, cancellation_previous_year_copy, como_acabe_cancellation,
      total_cancellation_month_ly]
    series_colors:
      revenue: "#536BA5"
      cancellations: "#a81d15"
      cancellation_previous_year: "#dec95c"
      revenue_previous_year: "#95acd9"
      como_acabe: "#80868B"
      cancellation: "#A81D15"
      cancellation_previous_year_copy: "#FB8B24"
      como_acabe_cancellation: "#5C573E"
      total_revenue_month_ly: "#80868B"
      total_cancellation_month_ly: "#5C573E"
    series_labels:
      como_acabe: Total Revenue month LY
      revenue_previous_year: Revenue LY
      cancellation_previous_year_copy: Cancellation  LY
      como_acabe_cancellation: Total Cancellation month LY
    x_axis_datetime_label: "%b"
    defaults_version: 1
    hidden_fields: []
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Ejemplo
    title_hidden: true
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 5
    col: 10
    width: 14
    height: 12
  - name: Gateway Control
    title: Gateway Control
    note_state: collapsed
    note_display: hover
    note_text: Metrics related to the performance of a specific booking gateway or
      funnel step, likely tracking user progression and conversion to actual bookings.
    merged_queries:
    - model: bq_demo_c
      explore: funnel_stats
      type: looker_funnel
      fields: [booking4_gateway, dimensiontomerge]
      filters:
        booking4_gateway: ">0"
      sorts: [booking4_gateway desc 0]
      limit: 50
      column_limit: 50
      dynamic_fields:
      - category: measure
        expression: ''
        label: Booking4 Gateway
        based_on: funnel_stats.booking4_gateway
        _kind_hint: measure
        measure: booking4_gateway
        type: sum
        _type_hint: number
      - category: dimension
        expression: '1'
        label: dimensionToMerge
        value_format:
        value_format_name:
        dimension: dimensiontomerge
        _kind_hint: dimension
        _type_hint: number
      leftAxisLabelVisible: false
      leftAxisLabel: ''
      rightAxisLabelVisible: false
      rightAxisLabel: ''
      smoothedBars: false
      orientation: automatic
      labelPosition: left
      percentType: total
      percentPosition: inline
      valuePosition: right
      labelColorEnabled: false
      labelColor: "#FFF"
      color_application:
        collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
        palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
      isStepped: false
      labelOverlap: false
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      bar_arm_length: 25
      bar_arm_weight: 50
      bar_spinner_length: 100
      bar_spinner_weight: 50
      defaults_version: 1
      up_color: false
      down_color: false
      total_color: false
      show_value_labels: false
      show_x_axis_ticks: true
      show_x_axis_label: true
      x_axis_scale: auto
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_gridlines: true
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: light
      map_position: fit_data
      map_scale_indicator: 'off'
      map_pannable: true
      map_zoomable: true
      map_marker_type: circle
      map_marker_icon_name: default
      map_marker_radius_mode: proportional_value
      map_marker_units: meters
      map_marker_proportional_scale_type: linear
      map_marker_color_mode: fixed
      show_view_names: false
      show_legend: true
      quantize_map_value_colors: false
      reverse_map_value_colors: false
      map: auto
      map_projection: ''
      quantize_colors: false
      hidden_fields: []
      hidden_points_if_no: []
      series_labels: {}
      y_axes: []
      hidden_pivots: {}
    - model: bq_demo_c
      explore: mview_datos_reservas_6
      type: table
      fields: [bookings, dimensiontomerge]
      filters:
        mview_datos_reservas_6.payment_method: TPV
      sorts: [bookings desc 0]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: measure
        label: Bookings
        based_on: mview_datos_reservas_6.num_reservas
        _kind_hint: measure
        measure: bookings
        type: count_distinct
        _type_hint: number
        filters:
          mview_datos_reservas_6.payment_method: TPV
      - category: dimension
        expression: '1'
        label: dimensionToMerge
        value_format:
        value_format_name:
        dimension: dimensiontomerge
        _kind_hint: dimension
        _type_hint: number
      hidden_pivots: {}
      y_axes: []
      join_fields:
      - field_name: dimensiontomerge
        source_field_name: dimensiontomerge
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      custom:
        id: 024b0cbf-30ba-33dd-b2a0-4d003d7c037e
        label: Custom
        type: continuous
        stops:
        - color: "#536BA5"
          offset: 0
        - color: "#a6e86e"
          offset: 100
      options:
        steps: 5
    show_sql_query_menu_options: false
    column_order: [hotel_corporative_encrypted.name, booking3, b3_to_b4, booking4_gateway,
      b4gateway_to_b4, booking4, b4_to_reservations, reservations]
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_labels:
      b4gateway_to_b4: B4Gateway_to_B4
      b4_to_reservations: B4G_to_Reservations
    series_cell_visualizations:
      booking1:
        is_active: false
    series_text_format:
      booking3:
        align: center
      booking4:
        align: center
      booking4_gateway:
        align: center
      reservations:
        align: center
      b3_to_b4:
        align: center
      b4_to_b4gateway:
        align: center
      b4gateway_to_reservations:
        align: center
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_font_color: "#FFFFFF"
    header_background_color: "#416BA9"
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: greater than, value: 0, background_color: !!null '',
        font_color: "#7CB342", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4}, bold: false, italic: false,
        strikethrough: false, fields: []}, {type: less than, value: 0, background_color: !!null '',
        font_color: "#EA4335", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4}, bold: false, italic: false,
        strikethrough: false, fields: []}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    isStepped: false
    orientation: automatic
    labelPosition: left
    labelOverlap: true
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    series_types: {}
    type: looker_grid
    hidden_pivots: {}
    hidden_fields: [dimensiontomerge]
    y_axes: []
    hide_totals: false
    hide_row_totals: false
    query_fields:
      measures:
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Booking3
        label_from_parameter:
        label_short: Booking3
        map_layer:
        name: booking3
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: sum
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: funnel_stats
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: funnel_stats
        dimension_group:
        error:
        field_group_variant:
        measure: true
        parameter: false
        primary_key: false
        project_name:
        scope: funnel_stats
        suggest_dimension: booking3
        suggest_explore: funnel_stats
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: ''
        source_file_path: ''
        sql:
        sql_case:
        filters:
        times_used: 0
        sorted:
          sort_index: 0
          desc: true
          pivot_index: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Booking4
        label_from_parameter:
        label_short: Booking4
        map_layer:
        name: booking4
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: sum
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: funnel_stats
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: funnel_stats
        dimension_group:
        error:
        field_group_variant:
        measure: true
        parameter: false
        primary_key: false
        project_name:
        scope: funnel_stats
        suggest_dimension: booking4
        suggest_explore: funnel_stats
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: ''
        source_file_path: ''
        sql:
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Booking4 Gateway
        label_from_parameter:
        label_short: Booking4 Gateway
        map_layer:
        name: booking4_gateway
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: sum
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: funnel_stats
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: funnel_stats
        dimension_group:
        error:
        field_group_variant:
        measure: true
        parameter: false
        primary_key: false
        project_name:
        scope: funnel_stats
        suggest_dimension: booking4_gateway
        suggest_explore: funnel_stats
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: ''
        source_file_path: ''
        sql:
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Reservations
        label_from_parameter:
        label_short: Reservations
        map_layer:
        name: reservations
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: mview_datos_reservas_6
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: mview_datos_reservas_6
        dimension_group:
        error:
        field_group_variant:
        measure: true
        parameter: false
        primary_key: false
        project_name:
        scope: mview_datos_reservas_6
        suggest_dimension: reservations
        suggest_explore: mview_datos_reservas_6
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: ''
        source_file_path: ''
        sql:
        sql_case:
        filters:
        times_used: 0
        sorted:
          sort_index: 0
          desc: true
          pivot_index: 0
        aggregate: true
      dimensions:
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Funnel Stats Hotel Code
        label_from_parameter:
        label_short: Hotel Code
        map_layer:
        name: funnel_stats.hotel_code
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: funnel_stats
        view_label: Funnel Stats
        dynamic: false
        week_start_day: monday
        original_view: funnel_stats
        dimension_group:
        error:
        field_group_variant: Hotel Code
        measure: false
        parameter: false
        primary_key: false
        project_name: bq_demo_c
        scope: funnel_stats
        suggest_dimension: funnel_stats.hotel_code
        suggest_explore: funnel_stats
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/bq_demo_c/files/views%2Ffunnel_stats.view.lkml?line=78"
        permanent: true
        source_file: views/funnel_stats.view.lkml
        source_file_path: bq_demo_c/views/funnel_stats.view.lkml
        sql: "${TABLE}.hotel_code "
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Hotel Corporative Encrypted Name
        label_from_parameter:
        label_short: Name
        map_layer:
        name: hotel_corporative_encrypted.name
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: hotel_corporative_encrypted
        view_label: Hotel Corporative Encrypted
        dynamic: false
        week_start_day: monday
        original_view: hotel_corporative_encrypted
        dimension_group:
        error:
        field_group_variant: Name
        measure: false
        parameter: false
        primary_key: false
        project_name: bq_demo_c
        scope: hotel_corporative_encrypted
        suggest_dimension: hotel_corporative_encrypted.name
        suggest_explore: mview_datos_reservas_6
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/bq_demo_c/files/views%2FHotel_corporative_encrypted.view.lkml?line=27"
        permanent: true
        source_file: views/Hotel_corporative_encrypted.view.lkml
        source_file_path: bq_demo_c/views/Hotel_corporative_encrypted.view.lkml
        sql: "${TABLE}.name "
        sql_case:
        filters:
        times_used: 0
      table_calculations:
      - label: B3_to_b4
        name: b3_to_b4
        expression: "${booking4}/${booking3}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.00%"
        is_numeric: true
        "$$hashKey": object:578
      - label: b4Gateway_to_b4
        name: b4gateway_to_b4
        expression: "${booking4_gateway}/${booking4}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.00%"
        is_numeric: true
        "$$hashKey": object:579
      - label: B4_to_Reservations
        name: b4_to_reservations
        expression: "${reservations}/${booking4}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.00%"
        is_numeric: true
        "$$hashKey": object:580
      pivots: []
    dynamic_fields:
    - category: table_calculation
      expression: "${bookings}/${booking4_gateway}"
      label: B4_to_Bookings
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: b4_to_bookings
      _type_hint: number
    listen:
    - Booking window: funnel_stats.date_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    - Travel window: mview_datos_reservas_6.start_date_timestamp_date
      Booking window: mview_datos_reservas_6.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 123
    col: 12
    width: 12
    height: 7
  - title: Cancellations
    name: Cancellations (2)
    model: bq_demo_c
    explore: mview_datos_reservas_6
    type: looker_grid
    fields: [mview_datos_reservas_6.cancellation_reason, revenue, bookings, rn]
    filters:
      mview_datos_reservas_6.cancelled: 'Yes'
    sorts: [revenue desc 0]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: table_calculation
      label: "%weight"
      value_format:
      value_format_name: percent_0
      calculation_type: percent_of_column_sum
      table_calculation: weight
      args:
      - revenue
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression:
      label: Revenue
      value_format:
      value_format_name: eur_0
      based_on: mview_datos_reservas_6.cancellation
      _kind_hint: measure
      measure: revenue
      type: sum
      _type_hint: number
    - category: measure
      expression:
      label: Bookings
      value_format:
      value_format_name:
      based_on: mview_datos_reservas_6.identifier
      _kind_hint: measure
      measure: bookings
      type: count_distinct
      _type_hint: number
    - category: measure
      expression:
      label: RN
      value_format:
      value_format_name:
      based_on: mview_datos_reservas_6.rn_cancelled
      _kind_hint: measure
      measure: rn
      type: sum
      _type_hint: number
    - category: table_calculation
      expression: "${revenue}/${rn}"
      label: ADR
      value_format:
      value_format_name: eur
      _kind_hint: measure
      table_calculation: adr
      _type_hint: number
    - category: table_calculation
      expression: "${revenue}/${bookings}"
      label: Ticket Medio
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: ticket_medio
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", mview_datos_reservas_6.cancellation_reason,
      revenue, bookings, adr, weight]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 60
    series_cell_visualizations:
      revenue:
        is_active: false
    header_font_color: "#ffffff"
    header_background_color: "#416BA9"
    hidden_fields: [rn]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Analysis of cancelled bookings, categorized by the reason provided
      for cancellation.
    listen:
      Board: mview_datos_reservas_6.board
      Room: mview_datos_reservas_6.room
      Device: mview_datos_reservas_6.device
      Source: mview_datos_reservas_6.source_fixed
      Travel window: mview_datos_reservas_6.start_date_timestamp_date
      Market: mview_datos_reservas_6.full_country
      RateName: mview_datos_reservas_6.rateName_fixed
      Booking window: mview_datos_reservas_6.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 116
    col: 0
    width: 12
    height: 7
  - title: User Leakage
    name: User Leakage
    model: bq_demo_c
    explore: forms
    type: looker_grid
    fields: [forms.count, reason]
    filters:
      forms.reason: "-NULL"
    sorts: [forms.count desc 0]
    limit: 5000
    column_limit: 50
    total: true
    dynamic_fields:
    - category: dimension
      expression: case(when(${forms.reason} = "found_better_price", "Found a better
        price"), when(${forms.reason} = "not_interested", "Not interested"), "Will
        return later")
      label: Reason
      value_format:
      value_format_name:
      dimension: reason
      _kind_hint: dimension
      _type_hint: string
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      forms.count: "#"
    series_cell_visualizations:
      forms.count:
        is_active: false
    header_font_color: "#ffffff"
    header_background_color: "#416BA9"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    note_state: collapsed
    note_display: hover
    note_text: Reasons why users abandoned the booking process or chose not to complete
      a reservation.
    listen:
      Booking window: forms.timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 116
    col: 12
    width: 12
    height: 7
  - title: Rate Name
    name: Rate Name
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_grid
    fields: [revenue, revenue_previo, bookings, bookings_previ, rn, rn_ly, mview_comparation_bookings.rateName_fixed]
    filters:
      mview_comparation_bookings.cancelled: 'No'
      mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: NOT
        NULL
      mview_comparation_bookings.rate_name: "-EMPTY"
      mview_comparation_bookings.promocode: ''
    sorts: [revenue desc]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression: ''
      label: Revenue
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Revenue previo
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue_previo
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "\n(${revenue}/${revenue_previo})-1 \n"
      label: "%rev"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: rev
      _type_hint: number
    - category: measure
      expression:
      label: Bookings
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression:
      label: Bookings previ
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings_previ
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "(${bookings}/${bookings_previ})-1"
      label: "%bookings"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: bookings_1
      _type_hint: number
    - category: table_calculation
      label: "%weight"
      value_format:
      value_format_name: percent_0
      calculation_type: percent_of_column_sum
      table_calculation: weight
      args:
      - revenue
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: RN
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: RN LY
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn_ly
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${revenue}/${rn}"
      label: ADR
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: adr
      _type_hint: number
    - category: table_calculation
      expression: "${revenue_previo}/${rn_ly}"
      label: ADR LY
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: adr_ly
      _type_hint: number
    - category: table_calculation
      expression: "(${adr}/${adr_ly})-1 \n"
      label: "%ADR"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: adr_1
      _type_hint: number
    - category: table_calculation
      expression: "(${rn}/${rn_ly})-1 \n"
      label: RN%
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rn_1
      _type_hint: number
    - category: table_calculation
      expression: "${revenue}/${bookings}"
      label: Ticket Medio
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: ticket_medio
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      mview_comparation_bookings.rateName_fixed: left
    column_order: [mview_comparation_bookings.rateName_fixed, revenue, rev, bookings,
      bookings_1, rn, rn_1, adr, adr_1, weight]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 10
    series_labels:
      rev: "%"
      bookings_1: "%"
      adr_1: "%"
      mview_comparation_bookings.rateName_fixed: Rate Name
      rn_1: "%"
    series_column_widths:
      revenue: 100
      bookings: 100
      rev: 80
      bookings_1: 80
      weight: 80
      adr: 80
      adr_1: 80
      mview_comparation_bookings.promo: 150
      mview_comparation_bookings.rate_name: 400
      mview_comparation_bookings.rateName_fixed: 300
      rn: 81
      rn_1: 70
    series_cell_visualizations:
      revenue:
        is_active: false
    header_font_color: "#ffffff"
    header_background_color: "#416BA9"
    conditional_formatting: [{type: equal to, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [rev, bookings_1,
          adr_1, rn_1]}, {type: greater than, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [rev, bookings_1,
          adr_1, rn_1]}, {type: less than, value: 0, background_color: '', font_color: "#EA4335",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [bookings_1, rev,
          adr_1, rn_1]}]
    truncate_column_names: false
    defaults_version: 1
    hidden_fields: [bookings_previ, revenue_previo, rn_ly, adr_ly]
    note_state: collapsed
    note_display: hover
    note_text: Performance metrics broken down by individual rate plans.
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 68
    col: 12
    width: 12
    height: 7
  - title: Room Nights
    name: Room Nights
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: single_value
    fields: [sum_of_rn, sum_of_rn_copy]
    filters:
      mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: NOT
        NULL
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${sum_of_rn}-${sum_of_rn_copy}"
      label: diff
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: diff
      _type_hint: number
    - category: measure
      expression: ''
      label: Nights
      based_on: mview_comparation_bookings.nights
      _kind_hint: measure
      measure: nights
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Last year nights
      based_on: mview_comparation_bookings.nights
      _kind_hint: measure
      measure: last_year_nights
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: measure
      expression: ''
      label: Sum of Rn
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: sum_of_rn
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Sum of Rn Copy
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: sum_of_rn_copy
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [sum_of_rn_copy]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: above
    note_text: Room * Nights
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 11
    col: 5
    width: 5
    height: 2
  - title: Rooms
    name: Rooms (2)
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: single_value
    fields: [rooms, rooms_ly]
    filters:
      mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: NOT
        NULL
      mview_comparation_bookings.promo: ''
      mview_comparation_bookings.promocode: ''
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${rooms}-${rooms_ly}"
      label: diff
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: diff
      _type_hint: number
    - category: measure
      expression: ''
      label: Nights
      based_on: mview_comparation_bookings.nights
      _kind_hint: measure
      measure: nights
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Last year nights
      based_on: mview_comparation_bookings.nights
      _kind_hint: measure
      measure: last_year_nights
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: measure
      expression: ''
      label: rooms
      based_on: mview_comparation_bookings.num_rooms
      _kind_hint: measure
      measure: rooms
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: rooms ly
      based_on: mview_comparation_bookings.num_rooms
      _kind_hint: measure
      measure: rooms_ly
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [sum_of_rn_copy, rooms_ly]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: above
    note_text: Total rooms used
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 11
    col: 0
    width: 5
    height: 2
  - title: Cancellation Lead Time
    name: Cancellation Lead Time
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: single_value
    fields: [advance, advance_last_year]
    filters:
      mview_comparation_bookings.cancelled: 'Yes'
      mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: NOT
        NULL
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Advance
      value_format:
      value_format_name: decimal_1
      based_on: mview_comparation_bookings.advance_cancellation
      _kind_hint: measure
      measure: advance
      type: average
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Advance last year
      value_format:
      value_format_name: decimal_1
      based_on: mview_comparation_bookings.advance_cancellation
      _kind_hint: measure
      measure: advance_last_year
      type: average
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${advance}-${advance_last_year}"
      label: diff
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      table_calculation: diff
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [advance_last_year]
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: The number of days between when a booking is made and the guest’s check-in
      date of cancelled bookings.
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 15
    col: 3
    width: 5
    height: 2
  - title: Lead Time
    name: Lead Time
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: single_value
    fields: [advance, advance_last_year]
    filters:
      mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: NOT
        NULL
      mview_comparation_bookings.promo: ''
      mview_comparation_bookings.promocode: ''
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Advance
      value_format:
      value_format_name: decimal_1
      based_on: mview_comparation_bookings.advance
      _kind_hint: measure
      measure: advance
      type: average
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Advance last year
      value_format:
      value_format_name: decimal_1
      based_on: mview_comparation_bookings.advance
      _kind_hint: measure
      measure: advance_last_year
      type: average
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${advance}-${advance_last_year}"
      label: diff
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      table_calculation: diff
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [advance_last_year]
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: The number of days between when a hotel booking is made and the guest’s
      check-in date.
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 13
    col: 5
    width: 5
    height: 2
  - name: Weekly PickUp
    title: Weekly PickUp
    note_state: collapsed
    note_display: hover
    note_text: |
      El término "weekly pickup" en revenue management se refiere al número de reservas o habitaciones vendidas durante un período de una semana específica, independientemente de la fecha de estancia de esas reservas. Este concepto es importante para analizar el rendimiento de ventas y la demanda a corto plazo.
      Características clave del weekly pickup:

      Período de análisis: Abarca una semana completa.
      Alcance: Incluye todas las reservas realizadas durante esa semana, sin importar la fecha futura de la estancia.
      Utilidad: Permite evaluar la velocidad de venta y comparar el rendimiento semanal.
      Análisis de tendencias: Ayuda a identificar patrones de reserva y respuestas a estrategias de precios o promociones.
      El weekly pickup es una métrica valiosa para los revenue managers porque:

      Proporciona una visión rápida del desempeño de ventas semanal.
      Permite comparar el volumen de reservas entre diferentes semanas.
      Ayuda a ajustar estrategias de precios y disponibilidad a corto plazo.
      Facilita la identificación de períodos de alta o baja demanda.
    merged_queries:
    - model: bq_demo_c
      explore: mview_datos_reservas_6
      type: looker_line
      fields: [mview_datos_reservas_6.week_number_booking, sum_of_price, sum_of_price_supplements,
        count_of_identifier, sum_of_rn]
      filters:
        mview_datos_reservas_6.real_timestamp__date: 2025/01/06 to 2025/12/31
      sorts: [sum_of_price desc 0]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - _kind_hint: measure
        _type_hint: number
        based_on: mview_datos_reservas_6.price
        expression: ''
        label: Sum of Price
        measure: sum_of_price
        type: sum
      - _kind_hint: measure
        _type_hint: number
        based_on: mview_datos_reservas_6.price_supplements
        expression: ''
        label: Sum of Price Supplements
        measure: sum_of_price_supplements
        type: sum
      - category: table_calculation
        expression: "${sum_of_price} +${sum_of_price_supplements}"
        label: Revenue
        value_format:
        value_format_name: decimal_0
        _kind_hint: measure
        table_calculation: revenue
        _type_hint: number
      - _kind_hint: measure
        _type_hint: number
        based_on: mview_datos_reservas_6.identifier
        expression: ''
        label: Count of Identifier
        measure: count_of_identifier
        type: count_distinct
      - _kind_hint: measure
        _type_hint: number
        based_on: mview_datos_reservas_6.rn
        expression: ''
        label: Sum of Rn
        measure: sum_of_rn
        type: sum
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: ''
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      show_null_points: true
      interpolation: linear
      defaults_version: 1
      join_fields: []
    - model: bq_demo_c
      explore: mview_datos_reservas_6
      type: table
      fields: [mview_datos_reservas_6.week_number_booking, sum_of_price, sum_of_price_supplements,
        count_of_identifier_ly, sum_of_rn_ly]
      filters:
        mview_datos_reservas_6.real_timestamp__date: last year
      sorts: [sum_of_price desc 0]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - _kind_hint: measure
        _type_hint: number
        based_on: mview_datos_reservas_6.price
        expression: ''
        label: Sum of Price
        measure: sum_of_price
        type: sum
      - _kind_hint: measure
        _type_hint: number
        based_on: mview_datos_reservas_6.price_supplements
        expression: ''
        label: Sum of Price Supplements
        measure: sum_of_price_supplements
        type: sum
      - category: table_calculation
        expression: "${sum_of_price} +${sum_of_price_supplements}"
        label: Revenue LY
        value_format:
        value_format_name:
        _kind_hint: measure
        table_calculation: revenue_ly
        _type_hint: number
      - category: measure
        expression: ''
        label: Count of Identifier LY
        based_on: mview_datos_reservas_6.identifier
        _kind_hint: measure
        measure: count_of_identifier_ly
        type: count_distinct
        _type_hint: number
      - category: measure
        expression: ''
        label: Sum of Rn LY
        based_on: mview_datos_reservas_6.rn
        _kind_hint: measure
        measure: sum_of_rn_ly
        type: sum
        _type_hint: number
      join_fields:
      - field_name: mview_datos_reservas_6.week_number_booking
        source_field_name: mview_datos_reservas_6.week_number_booking
    - model: bq_demo_c
      explore: mview_datos_reservas_6
      type: table
      fields: [sum_of_price, mview_datos_reservas_6.week_number_booking, sum_of_price_supplements]
      filters:
        mview_datos_reservas_6.partition_timestamp_date: this year
        mview_datos_reservas_6.cancelled: 'Yes'
      sorts: [sum_of_price desc 0]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - _kind_hint: measure
        _type_hint: number
        based_on: mview_datos_reservas_6.price
        expression: ''
        label: Sum of Price
        measure: sum_of_price
        type: sum
      - _kind_hint: measure
        _type_hint: number
        based_on: mview_datos_reservas_6.price_supplements
        expression: ''
        label: Sum of Price Supplements
        measure: sum_of_price_supplements
        type: sum
      - category: table_calculation
        expression: "${sum_of_price}+${sum_of_price_supplements}"
        label: Cancellation
        value_format:
        value_format_name: decimal_0
        _kind_hint: measure
        table_calculation: cancellation
        _type_hint: number
      join_fields:
      - field_name: mview_datos_reservas_6.week_number_booking
        source_field_name: mview_datos_reservas_6.week_number_booking
    - model: bq_demo_c
      explore: mview_datos_reservas_6
      type: table
      fields: [mview_datos_reservas_6.week_number_cxl, sum_of_price, sum_of_price_supplements]
      filters:
        mview_datos_reservas_6.partition_timestamp_date: last year
        mview_datos_reservas_6.cancelled: 'Yes'
      sorts: [sum_of_price desc 0]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - _kind_hint: measure
        _type_hint: number
        based_on: mview_datos_reservas_6.price
        expression: ''
        label: Sum of Price
        measure: sum_of_price
        type: sum
      - _kind_hint: measure
        _type_hint: number
        based_on: mview_datos_reservas_6.price_supplements
        expression: ''
        label: Sum of Price Supplements
        measure: sum_of_price_supplements
        type: sum
      - category: table_calculation
        expression: "${sum_of_price}+ ${sum_of_price_supplements}"
        label: Cancellation ly
        value_format:
        value_format_name: decimal_0
        _kind_hint: measure
        table_calculation: cancellation_ly
        _type_hint: number
      join_fields:
      - field_name: mview_datos_reservas_6.week_number_cxl
        source_field_name: mview_datos_reservas_6.week_number_booking
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: revenue, id: revenue,
            name: PickUp}, {axisId: revenue_ly, id: revenue_ly, name: PickUp LY},
          {axisId: cancellation, id: cancellation, name: Cancellations}, {axisId: cancellation_ly,
            id: cancellation_ly, name: Cancellations LY}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: left, series: [{axisId: sum_of_rn, id: sum_of_rn,
            name: RN}, {axisId: sum_of_rn_ly, id: sum_of_rn_ly, name: RN LY}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: left, series: [{axisId: count_of_identifier,
            id: count_of_identifier, name: Booking}, {axisId: count_of_identifier_ly,
            id: count_of_identifier_ly, name: Booking LY}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    hidden_series: [cancellation, cancellation_ly, sum_of_rn_ly, count_of_identifier_ly,
      revenue_ly]
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      cancellation: "#416BA9"
      revenue: "#416BA9"
      revenue_ly: "#A81D15"
      sum_of_rn: "#416BA9"
      count_of_identifier: "#416BA9"
      count_of_identifier_ly: "#A81D15"
      sum_of_rn_ly: "#A81D15"
      cancellation_ly: "#A81D15"
    series_labels:
      revenue: PickUp
      revenue_ly: PickUp LY
      cancellation_ly: Cancellations LY
      cancellation: Cancellations
      count_of_identifier: Booking
      sum_of_rn: RN
      sum_of_rn_ly: RN LY
      count_of_identifier_ly: Booking LY
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    type: looker_line
    hidden_fields: [sum_of_price_supplements, sum_of_price, q1_sum_of_price_supplements,
      q1_sum_of_price, q2_sum_of_price, q2_sum_of_price_supplements, q3_sum_of_price,
      q3_sum_of_price_supplements]
    sorts: [q1_count_of_identifier desc]
    listen:
    - Travel window: mview_datos_reservas_6.start_date_timestamp_date
      Market: mview_datos_reservas_6.full_country
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    - Travel window: mview_datos_reservas_6.start_date_timestamp_date
      Market: mview_datos_reservas_6.full_country
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    - Travel window: mview_datos_reservas_6.start_date_timestamp_date
      Market: mview_datos_reservas_6.full_country
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    - Travel window: mview_datos_reservas_6.start_date_timestamp_date
      Market: mview_datos_reservas_6.full_country
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 18
    col: 4
    width: 16
    height: 7
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"children":[{"text":"General overview. How am I doing?","bold":true}],"type":"h1","align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 1
    col: 0
    width: 24
    height: 2
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":""}],"id":"asw4i"},{"children":[{"text":"Where
      do they make their reservations?","bold":true}],"type":"h1","align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 82
    col: 0
    width: 24
    height: 2
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":""}],"id":"x2712"},{"type":"h1","children":[{"text":"What
      do they reserve and how do they do it?","bold":true}],"id":"ars2i","align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 59
    col: 0
    width: 24
    height: 2
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":""}],"id":"th46z"},{"type":"h1","children":[{"text":"Who
      is my client?","bold":true}],"id":"c5394","align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 38
    col: 0
    width: 24
    height: 2
  - name: " (7)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":""}],"id":"5zeur"},{"children":[{"text":"Are
      there vanishing points? What are the reasons? Why do I have cancellations?","bold":true}],"type":"h1","align":"center","id":"1ugmo"}]'
    rich_content_json: '{"format":"slate"}'
    row: 102
    col: 0
    width: 24
    height: 2
  - name: " (8)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":""}],"id":"yifig"},{"type":"h1","children":[{"text":"Are
      my actions working?","bold":true}],"align":"center","id":"m5ezs"}]'
    rich_content_json: '{"format":"slate"}'
    row: 130
    col: 0
    width: 24
    height: 2
  - title: Promocode
    name: Promocode
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_grid
    fields: [revenue, revenue_previo, bookings, bookings_previ, mview_comparation_bookings.promocode,
      rn, rn_ly]
    filters:
      mview_comparation_bookings.cancelled: 'No'
      revenue: ">0"
      mview_comparation_bookings.promocode: "-EMPTY"
    sorts: [revenue desc 0]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression: ''
      label: Revenue
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Revenue previo
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue_previo
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "\n(${revenue}/${revenue_previo})-1 \n"
      label: "%rev"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: rev
      _type_hint: number
    - category: measure
      expression:
      label: Bookings
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression:
      label: Bookings previ
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings_previ
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "(${bookings}/${bookings_previ})-1"
      label: "%bookings"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: bookings_1
      _type_hint: number
    - category: table_calculation
      label: "%weight"
      value_format:
      value_format_name: percent_0
      calculation_type: percent_of_column_sum
      table_calculation: weight
      args:
      - revenue
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - category: measure
      expression: ''
      label: RN
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: RN LY
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn_ly
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${revenue}/${rn}"
      label: ADR
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: adr
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${revenue_previo}/${rn_ly}"
      label: ADR LY
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: adr_ly
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${adr}/${adr_ly})-1 \n"
      label: "%ADR"
      value_format:
      value_format_name: percent_2
      _kind_hint: dimension
      table_calculation: adr_1
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${rn}/${rn_ly})-1 \n"
      label: RN%
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rn_1
      _type_hint: number
    - category: table_calculation
      expression: "${revenue}/${bookings}"
      label: Ticket Medio
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: ticket_medio
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      mview_comparation_bookings.promo: left
      mview_comparation_bookings.promo2: left
      mview_comparation_bookings.promo3: left
      mview_comparation_bookings.promocode: left
    column_order: [mview_comparation_bookings.promo, mview_comparation_bookings.promo2,
      mview_comparation_bookings.promo3, mview_comparation_bookings.promocode, revenue,
      rev, bookings, bookings_1, adr, adr_1, weight]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 10
    series_labels:
      rev: "%"
      bookings_1: "%"
      adr_1: "%"
      rn_1: "%"
    series_column_widths:
      mview_comparation_bookings.promo2: 75
      mview_comparation_bookings.promocode: 75
      mview_comparation_bookings.promo3: 73
    series_cell_visualizations:
      revenue:
        is_active: false
    header_font_color: "#ffffff"
    header_background_color: "#416BA9"
    conditional_formatting: [{type: equal to, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [rev, bookings_1,
          rn_1]}, {type: greater than, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [rev, bookings_1,
          rn_1]}, {type: less than, value: 0, background_color: '', font_color: "#EA4335",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [bookings_1, rev,
          rn_1]}]
    truncate_column_names: false
    defaults_version: 1
    hidden_fields: [bookings_previ, revenue_previo, rn_ly]
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Performance metrics for bookings made using specific promotional codes
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 132
    col: 12
    width: 12
    height: 7
  - title: 'Promotions '
    name: 'Promotions '
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_grid
    fields: [revenue, revenue_previo, bookings, bookings_previ, mview_comparation_bookings.promo,
      rn, rn_ly]
    filters:
      mview_comparation_bookings.cancelled: 'No'
      mview_comparation_bookings.promo: "-NULL"
      revenue: ">0"
    sorts: [revenue desc 0]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression: ''
      label: Revenue
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Revenue previo
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue_previo
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "\n(${revenue}/${revenue_previo})-1 \n"
      label: "%rev"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: rev
      _type_hint: number
    - category: measure
      expression:
      label: Bookings
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression:
      label: Bookings previ
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings_previ
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "(${bookings}/${bookings_previ})-1"
      label: "%bookings"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: bookings_1
      _type_hint: number
    - category: table_calculation
      label: "%weight"
      value_format:
      value_format_name: percent_0
      calculation_type: percent_of_column_sum
      table_calculation: weight
      args:
      - revenue
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - category: measure
      expression: ''
      label: RN
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: RN LY
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn_ly
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${revenue}/${rn}"
      label: ADR
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: adr
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${revenue_previo}/${rn_ly}"
      label: ADR LY
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: adr_ly
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${adr}/${adr_ly})-1 \n"
      label: "%ADR"
      value_format:
      value_format_name: percent_2
      _kind_hint: dimension
      table_calculation: adr_1
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${rn}/${rn_ly})-1 \n"
      label: RN%
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rn_1
      _type_hint: number
    - category: table_calculation
      expression: "${revenue}/${bookings}"
      label: Ticket Medio
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: ticket_medio
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      mview_comparation_bookings.promo: left
      mview_comparation_bookings.promo2: left
      mview_comparation_bookings.promo3: left
      mview_comparation_bookings.promocode: left
    column_order: [mview_comparation_bookings.promo, revenue, rev, bookings, bookings_1,
      rn, rn_1]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 10
    series_labels:
      rev: "%"
      bookings_1: "%"
      adr_1: "%"
      rn_1: "%"
    series_column_widths:
      mview_comparation_bookings.promo2: 75
      mview_comparation_bookings.promocode: 75
      mview_comparation_bookings.promo3: 73
    series_cell_visualizations:
      revenue:
        is_active: false
    header_font_color: "#ffffff"
    header_background_color: "#416BA9"
    conditional_formatting: [{type: equal to, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [rev, bookings_1,
          rn_1]}, {type: greater than, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [rev, bookings_1,
          rn_1]}, {type: less than, value: 0, background_color: '', font_color: "#EA4335",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [bookings_1, rev,
          rn_1]}]
    truncate_column_names: false
    defaults_version: 1
    hidden_fields: [bookings_previ, revenue_previo, rn_ly]
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Performance metrics for various promotional offers and campaigns.
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 132
    col: 0
    width: 12
    height: 7
  - name: " (9)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":""}],"id":"9mdaz"},{"type":"h1","children":[{"text":"Do
      they include services or experiences with their stay?","bold":true}],"id":"iy5o9","align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 93
    col: 0
    width: 24
    height: 2
  - title: Markets map
    name: Markets map
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_google_map
    fields: [revenue, mview_comparation_bookings.country]
    filters:
      mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: NOT
        NULL
    sorts: [revenue desc 0]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: table_calculation
      expression: "(${bookings}/${bookings_last_year})-1"
      label: "%Bookings"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: bookings_1
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${revenue}/${rn}"
      label: ADR
      value_format:
      value_format_name: eur
      _kind_hint: measure
      table_calculation: adr
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${revenue_last_year}/${rn_last_year}"
      label: ADR last year
      value_format:
      value_format_name: eur
      _kind_hint: measure
      table_calculation: adr_last_year
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${rn}/${rn_last_year})-1"
      label: "%RN"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rn_1
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${revenue}/${revenue_last_year})-1"
      label: "%Revenue"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: revenue_1
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${cancellations}/${cancellations_last_year})-1"
      label: "%Cancellations"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: cancellations_1
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${lead_time}/${lead_time_last_year})-1"
      label: "%LeadTime"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: leadtime
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${av_los}/${av_los_last_year})-1"
      label: "%AvLos"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: avlos
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${adr}/${adr_last_year})-1"
      label: "%ADR"
      value_format:
      value_format_name: percent_0
      _kind_hint: dimension
      table_calculation: adr_1
      _type_hint: number
      is_disabled: true
    - category: measure
      expression:
      label: Bookings
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.identifier
      _kind_hint: measure
      measure: bookings
      type: count_distinct
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
        mview_comparation_bookings.cancelled: 'No'
    - category: measure
      expression:
      label: Bookings last year
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.identifier
      _kind_hint: measure
      measure: bookings_last_year
      type: count_distinct
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
        mview_comparation_bookings.cancelled: 'No'
    - category: measure
      expression:
      label: RN
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression:
      label: RN last year
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn_last_year
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: measure
      expression:
      label: Revenue
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression:
      label: Revenue last year
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue_last_year
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: measure
      expression:
      label: Cancellations
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.cancellation
      _kind_hint: measure
      measure: cancellations
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression:
      label: Cancellations last year
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.cancellation
      _kind_hint: measure
      measure: cancellations_last_year
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: measure
      expression:
      label: Lead time
      value_format:
      value_format_name: decimal_0
      based_on: mview_comparation_bookings.advance
      _kind_hint: measure
      measure: lead_time
      type: average
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
        mview_comparation_bookings.cancelled: 'No'
    - category: measure
      expression:
      label: Lead time last year
      value_format:
      value_format_name: decimal_0
      based_on: mview_comparation_bookings.advance
      _kind_hint: measure
      measure: lead_time_last_year
      type: average
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
        mview_comparation_bookings.cancelled: 'No'
    - category: measure
      expression:
      label: Av. LoS.
      value_format:
      value_format_name: decimal_1
      based_on: mview_comparation_bookings.nights
      _kind_hint: measure
      measure: av_los
      type: average
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
        mview_comparation_bookings.cancelled: 'No'
    - category: measure
      expression:
      label: Av. LoS. last year
      value_format:
      value_format_name: decimal_1
      based_on: mview_comparation_bookings.nights
      _kind_hint: measure
      measure: av_los_last_year
      type: average
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
        mview_comparation_bookings.cancelled: 'No'
    - category: measure
      expression:
      label: Revenue Copy
      value_format:
      value_format_name: eur_0
      based_on: mview_comparation_bookings.revenue
      _kind_hint: measure
      measure: revenue_copy
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    hidden_fields: []
    hidden_points_if_no: []
    series_labels:
      bookings_1: "%"
      rn_1: "%"
      revenue_1: "%"
      leadtime: "%"
      avlos: "%"
      adr_1: "%"
      cancellations_1: "%"
      mview_comparation_bookings.full_country: Country
    show_view_names: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: false
    map_tile_provider: light
    map_position: custom
    map_latitude: 36
    map_longitude: 3
    map_zoom: 3
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    map_value_colors: ["#f0f0f0", "#416BA9", "#3959A9", "#214f92"]
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [mview_comparation_bookings.full_country, bookings, bookings_1,
      rn, rn_1, revenue, revenue_1, cancellations, cancellations_1, lead_time, leadtime,
      av_los, avlos, adr, adr_1]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      bookings:
        is_active: false
    header_font_color: "#FFF"
    header_background_color: "#416ba9"
    conditional_formatting: [{type: equal to, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: true, italic: false, strikethrough: false, fields: []}, {type: greater
          than, value: 0, background_color: '', font_color: "#7CB342", color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: true, italic: false, strikethrough: false, fields: []}, {type: less
          than, value: 0, background_color: '', font_color: "#EA4335", color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: true, italic: false, strikethrough: false, fields: []}, {type: less
          than, value: 0, background_color: '', font_color: "#7CB342", color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: true, italic: false, strikethrough: false, fields: []}, {type: equal
          to, value: 0, background_color: '', font_color: "#EA4335", color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: true, italic: false, strikethrough: false, fields: []}, {type: greater
          than, value: 0, background_color: '', font_color: "#EA4335", color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: true, italic: false, strikethrough: false, fields: []}]
    defaults_version: 0
    pinned_columns:
      mview_comparation_bookings.full_country: left
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Ejemplo
    title_hidden: true
    listen:
      Board: mview_comparation_bookings.board
      Room: mview_comparation_bookings.room
      Device: mview_comparation_bookings.device
      Source: mview_comparation_bookings.source_fixed
      Travel window: mview_comparation_bookings.comparation_startDate_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 40
    col: 2
    width: 20
    height: 11
  - name: " (10)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"children":[{"text":""}],"type":"p"}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 1
  - name: Bookings1 to Reservations
    title: Bookings1 to Reservations
    merged_queries:
    - model: bq_demo_c
      explore: mview_comparation_bookings
      type: table
      fields: [mview_comparation_bookings.hotel_code, count_of_identifier, count_of_identifier_ly]
      filters:
        mview_comparation_bookings.cancelled: 'No'
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: measure
        expression: ''
        label: Reservation
        based_on: mview_comparation_bookings.identifier
        _kind_hint: measure
        measure: reservation
        type: count_distinct
        _type_hint: number
      - category: measure
        expression: ''
        label: Count of Identifier
        based_on: mview_comparation_bookings.identifier
        _kind_hint: measure
        measure: count_of_identifier
        type: count_distinct
        _type_hint: number
        filters:
          mview_comparation_bookings.last_year_booking: '0'
      - category: measure
        expression: ''
        label: Count of Identifier ly
        based_on: mview_comparation_bookings.identifier
        _kind_hint: measure
        measure: count_of_identifier_ly
        type: count_distinct
        _type_hint: number
        filters:
          mview_comparation_bookings.last_year_booking: '1'
      hidden_pivots: {}
      join_fields: []
    - model: bq_demo_c
      explore: view_comparation_funnel_stats
      type: table
      fields: [view_comparation_funnel_stats.hotel_code, sum_of_booking1_unique_ips,
        sum_of_booking1_unique_ips_ly]
      limit: 500
      dynamic_fields:
      - category: measure
        expression: ''
        label: Sum of Booking1 Unique Ips
        based_on: view_comparation_funnel_stats.booking1_unique_ips
        _kind_hint: measure
        measure: sum_of_booking1_unique_ips
        type: sum
        _type_hint: number
        filters:
          view_comparation_funnel_stats.last_year_booking: '0'
      - category: measure
        expression: ''
        label: Sum of Booking1 Unique Ips ly
        based_on: view_comparation_funnel_stats.booking1_unique_ips
        _kind_hint: measure
        measure: sum_of_booking1_unique_ips_ly
        type: sum
        _type_hint: number
        filters:
          view_comparation_funnel_stats.last_year_booking: '1'
      join_fields:
      - field_name: view_comparation_funnel_stats.hotel_code
        source_field_name: mview_comparation_bookings.hotel_code
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [mview_datos_reservas_6.num_reservas, funnel_stats.hotel_code,
      sum_of_booking1_unique_ips, count_of_identifier, count_of_identifier_ly, sum_of_booking1_unique_ips_ly,
      bookings3_to_reservations_ly]
    series_types: {}
    type: single_value
    hidden_pivots: {}
    dynamic_fields:
    - category: table_calculation
      expression: "${count_of_identifier}/${sum_of_booking1_unique_ips}"
      label: Bookings3 to Reservations
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: bookings3_to_reservations
      _type_hint: number
    - category: table_calculation
      expression: "${count_of_identifier_ly}/${sum_of_booking1_unique_ips_ly}"
      label: Bookings3 to Reservations ly
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: bookings3_to_reservations_ly
      _type_hint: number
    - category: table_calculation
      expression: "(${bookings3_to_reservations}/${bookings3_to_reservations_ly})-1"
      label: Diff
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: diff
      _type_hint: number
    listen:
    - Source: mview_comparation_bookings.source_fixed
      Board: mview_comparation_bookings.board
      Device: mview_comparation_bookings.device
      Room: mview_comparation_bookings.room
      OTB*: mview_comparation_bookings.partition_timestamp_date
      Market: mview_comparation_bookings.full_country
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    - Market: view_comparation_funnel_stats.full_country
      Booking window: view_comparation_funnel_stats.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 113
    col: 12
    width: 4
    height: 3
  - name: Bookings3 to Reservations
    title: Bookings3 to Reservations
    merged_queries:
    - model: bq_demo_c
      explore: view_comparation_funnel_stats
      type: table
      fields: [view_comparation_funnel_stats.hotel_code, sum_of_booking3, sum_of_booking3_ly]
      filters:
        view_comparation_funnel_stats.comparation_partitiontimestamp_without_future_date: NOT
          NULL
      sorts: [sum_of_booking3 desc 0]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: measure
        expression: ''
        label: Sum of Booking3
        based_on: view_comparation_funnel_stats.booking3
        _kind_hint: measure
        measure: sum_of_booking3
        type: sum
        _type_hint: number
        filters:
          view_comparation_funnel_stats.last_year_booking: '0'
      - category: measure
        expression: ''
        label: Sum of Booking3 ly
        based_on: view_comparation_funnel_stats.booking3
        _kind_hint: measure
        measure: sum_of_booking3_ly
        type: sum
        _type_hint: number
        filters:
          view_comparation_funnel_stats.last_year_booking: '1'
      join_fields: []
    - model: bq_demo_c
      explore: mview_comparation_bookings
      type: table
      fields: [mview_comparation_bookings.hotel_code, count_of_identifier, count_of_identifier_ly]
      filters:
        mview_comparation_bookings.cancelled: 'No'
        mview_comparation_bookings.comparation_partitiontimestamp_without_future_date: NOT
          NULL
      sorts: [count_of_identifier desc 0]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: measure
        expression: ''
        label: Count of Identifier
        based_on: mview_comparation_bookings.identifier
        _kind_hint: measure
        measure: count_of_identifier
        type: count_distinct
        _type_hint: number
        filters:
          mview_comparation_bookings.last_year_booking: '0'
      - category: measure
        expression: ''
        label: Count of Identifier ly
        based_on: mview_comparation_bookings.identifier
        _kind_hint: measure
        measure: count_of_identifier_ly
        type: count_distinct
        _type_hint: number
        filters:
          mview_comparation_bookings.last_year_booking: '1'
      hidden_pivots: {}
      join_fields:
      - field_name: mview_comparation_bookings.hotel_code
        source_field_name: view_comparation_funnel_stats.hotel_code
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [sum_of_booking3, mview_datos_reservas_6.num_reservas, count_of_identifier,
      count_of_identifier_ly, sum_of_booking3_ly, bookings3_to_reservations_ly_copy,
      mview_comparation_bookings.hotel_code, bookings3_to_reservations_ly]
    series_types: {}
    type: single_value
    hidden_pivots: {}
    dynamic_fields:
    - category: table_calculation
      expression: "${count_of_identifier_ly}/${sum_of_booking3_ly}"
      label: Bookings3 to Reservations ly
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: bookings3_to_reservations_ly
      _type_hint: number
    - category: table_calculation
      expression: "${count_of_identifier}/${sum_of_booking3}"
      label: 'Bookings3 to Reservations '
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: bookings3_to_reservations
      _type_hint: number
    - category: table_calculation
      expression: "(${bookings3_to_reservations_ly}/${bookings3_to_reservations})-1"
      label: diff
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: diff
      _type_hint: number
    listen:
    - Market: view_comparation_funnel_stats.full_country
      Booking window: view_comparation_funnel_stats.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    - Source: mview_comparation_bookings.source_fixed
      Board: mview_comparation_bookings.board
      Device: mview_comparation_bookings.device
      Room: mview_comparation_bookings.room
      OTB*: mview_comparation_bookings.partition_timestamp_date
      Market: mview_comparation_bookings.full_country
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 110
    col: 12
    width: 4
    height: 3
  - title: Booking1 to Booking2
    name: Booking1 to Booking2
    model: bq_demo_c
    explore: view_comparation_funnel_stats
    type: single_value
    fields: [sum_of_booking2, sum_of_booking2_ly, sum_of_booking1_unique, sum_of_booking1_ly_unique]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Sum of Booking1
      based_on: view_comparation_funnel_stats.booking1_unique_ips
      _kind_hint: measure
      measure: sum_of_booking1
      type: sum
      _type_hint: number
      filters:
        view_comparation_funnel_stats.last_year_booking: '0'
    - _kind_hint: measure
      _type_hint: number
      based_on: view_comparation_funnel_stats.booking2
      expression: ''
      label: Sum of Booking2
      measure: sum_of_booking2
      type: sum
    - category: measure
      expression: ''
      label: Sum of Booking1 ly
      based_on: view_comparation_funnel_stats.booking1_unique_ips
      _kind_hint: measure
      measure: sum_of_booking1_ly
      type: sum
      _type_hint: number
      filters:
        view_comparation_funnel_stats.last_year_booking: '1'
    - category: measure
      expression: ''
      label: Sum of Booking2 ly
      based_on: view_comparation_funnel_stats.booking2
      _kind_hint: measure
      measure: sum_of_booking2_ly
      type: sum
      _type_hint: number
      filters:
        view_comparation_funnel_stats.last_year_booking: '1'
    - category: table_calculation
      expression: "(${sum_of_booking2}/${sum_of_booking1_unique})"
      label: Booking1 to booking 2
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: booking1_to_booking_2
      _type_hint: number
    - category: table_calculation
      expression: "(${sum_of_booking2_ly}/${sum_of_booking1_ly_unique})"
      label: Booking1 to booking 2 Copy
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: booking1_to_booking_2_copy
      _type_hint: number
    - category: table_calculation
      expression: "(${booking1_to_booking_2_copy}/${booking1_to_booking_2})-1"
      label: DIFF
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: diff
      _type_hint: number
    - category: measure
      expression: ''
      label: Sum of Booking1 unique
      based_on: view_comparation_funnel_stats.booking1_unique_ips
      _kind_hint: measure
      measure: sum_of_booking1_unique
      type: sum
      _type_hint: number
      filters:
        view_comparation_funnel_stats.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Sum of Booking1 ly unique
      based_on: view_comparation_funnel_stats.booking1_unique_ips
      _kind_hint: measure
      measure: sum_of_booking1_ly_unique
      type: sum
      _type_hint: number
      filters:
        view_comparation_funnel_stats.last_year_booking: '1'
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    hidden_fields: [sum_of_booking2, sum_of_booking2_ly, booking1_to_booking_2_copy]
    hidden_pivots: {}
    listen:
      Market: view_comparation_funnel_stats.full_country
      Booking window: view_comparation_funnel_stats.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 104
    col: 12
    width: 4
    height: 3
  - title: Bookings2 to Bookings3
    name: Bookings2 to Bookings3
    model: bq_demo_c
    explore: view_comparation_funnel_stats
    type: single_value
    fields: [sum_of_booking3, sum_of_booking2, sum_of_booking3_ly, sum_of_booking2_ly]
    filters: {}
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Sum of Booking3
      based_on: view_comparation_funnel_stats.booking3
      _kind_hint: measure
      measure: sum_of_booking3
      type: sum
      _type_hint: number
      filters:
        view_comparation_funnel_stats.last_year_booking: '0'
    - _kind_hint: measure
      _type_hint: number
      based_on: view_comparation_funnel_stats.booking2
      expression: ''
      label: Sum of Booking2
      measure: sum_of_booking2
      type: sum
    - category: measure
      expression: ''
      label: Sum of Booking3 ly
      based_on: view_comparation_funnel_stats.booking3
      _kind_hint: measure
      measure: sum_of_booking3_ly
      type: sum
      _type_hint: number
      filters:
        view_comparation_funnel_stats.last_year_booking: '1'
    - category: measure
      expression: ''
      label: Sum of Booking2 ly
      based_on: view_comparation_funnel_stats.booking2
      _kind_hint: measure
      measure: sum_of_booking2_ly
      type: sum
      _type_hint: number
      filters:
        view_comparation_funnel_stats.last_year_booking: '1'
    - category: table_calculation
      expression: "(${sum_of_booking3}/${sum_of_booking2})"
      label: Booking2 to booking 3
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: booking2_to_booking_3
      _type_hint: number
    - category: table_calculation
      expression: "(${sum_of_booking3_ly}/${sum_of_booking2_ly})"
      label: Booking2 to booking 3 Copy
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: booking2_to_booking_3_copy
      _type_hint: number
    - category: table_calculation
      expression: "(${booking2_to_booking_3_copy}/${booking2_to_booking_3})-1"
      label: DIFF
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: diff
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    hidden_fields: [sum_of_booking1, sum_of_booking2, sum_of_booking1_ly, booking1_to_booking_2_copy,
      sum_of_booking3, sum_of_booking3_ly, booking2_to_booking_3_copy, sum_of_booking2_ly]
    listen:
      Market: view_comparation_funnel_stats.full_country
      Booking window: view_comparation_funnel_stats.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 107
    col: 12
    width: 4
    height: 3
  - name: Conversion Rate
    title: Conversion Rate
    merged_queries:
    - model: bq_demo_c
      explore: mview_comparation_bookings
      type: table
      fields: [mview_comparation_bookings.hotel_code, count_of_identifier, count_of_identifier_ly]
      sorts: [count_of_identifier desc 0]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: measure
        expression: ''
        label: Reservation
        based_on: mview_comparation_bookings.identifier
        _kind_hint: measure
        measure: reservation
        type: count_distinct
        _type_hint: number
      - category: measure
        expression: ''
        label: Count of Identifier
        based_on: mview_comparation_bookings.identifier
        _kind_hint: measure
        measure: count_of_identifier
        type: count_distinct
        _type_hint: number
        filters:
          mview_comparation_bookings.last_year_booking: '0'
      - category: measure
        expression: ''
        label: Count of Identifier ly
        based_on: mview_comparation_bookings.identifier
        _kind_hint: measure
        measure: count_of_identifier_ly
        type: count_distinct
        _type_hint: number
        filters:
          mview_comparation_bookings.last_year_booking: '1'
      hidden_pivots: {}
      join_fields: []
    - model: bq_demo_c
      explore: view_comparation_funnel_stats
      type: table
      fields: [view_comparation_funnel_stats.hotel_code, sum_of_booking1_unique_ips,
        sum_of_booking1_unique_ips_ly]
      limit: 500
      dynamic_fields:
      - category: measure
        expression: ''
        label: Sum of Booking1 Unique Ips
        based_on: view_comparation_funnel_stats.booking1_unique_ips
        _kind_hint: measure
        measure: sum_of_booking1_unique_ips
        type: sum
        _type_hint: number
        filters:
          view_comparation_funnel_stats.last_year_booking: '0'
      - category: measure
        expression: ''
        label: Sum of Booking1 Unique Ips ly
        based_on: view_comparation_funnel_stats.booking1_unique_ips
        _kind_hint: measure
        measure: sum_of_booking1_unique_ips_ly
        type: sum
        _type_hint: number
        filters:
          view_comparation_funnel_stats.last_year_booking: '1'
      join_fields:
      - field_name: view_comparation_funnel_stats.hotel_code
        source_field_name: mview_comparation_bookings.hotel_code
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [mview_datos_reservas_6.num_reservas, funnel_stats.hotel_code,
      sum_of_booking1_unique_ips, count_of_identifier, count_of_identifier_ly, sum_of_booking1_unique_ips_ly,
      bookings3_to_reservations_ly]
    series_types: {}
    type: single_value
    hidden_pivots: {}
    dynamic_fields:
    - category: table_calculation
      expression: "${count_of_identifier}/${sum_of_booking1_unique_ips}"
      label: Bookings3 to Reservations
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: bookings3_to_reservations
      _type_hint: number
    - category: table_calculation
      expression: "${count_of_identifier_ly}/${sum_of_booking1_unique_ips_ly}"
      label: Bookings3 to Reservations ly
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: bookings3_to_reservations_ly
      _type_hint: number
    - category: table_calculation
      expression: "(${bookings3_to_reservations}/${bookings3_to_reservations_ly})-1"
      label: Diff
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: diff
      _type_hint: number
    listen:
    - Source: mview_comparation_bookings.source_fixed
      Board: mview_comparation_bookings.board
      Device: mview_comparation_bookings.device
      Room: mview_comparation_bookings.room
      Market: mview_comparation_bookings.full_country
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    - Market: view_comparation_funnel_stats.full_country
      Booking window: view_comparation_funnel_stats.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 5
    col: 0
    width: 5
    height: 2
  - title: Revenue Gateway Comparation
    name: Revenue Gateway Comparation
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_grid
    fields: [mview_comparation_bookings.gateway_type, bookings, revenue, revenue_previo,
      bookings_previ]
    sorts: [bookings desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Revenue
      value_format:
      value_format_name: usd_0
      based_on: mview_comparation_bookings.revenue_final
      _kind_hint: measure
      measure: revenue
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Revenue previo
      value_format:
      value_format_name: usd_0
      based_on: mview_comparation_bookings.revenue_final
      _kind_hint: measure
      measure: revenue_previo
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "\n(${revenue}/${revenue_previo})-1 \n"
      label: "%rev"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rev
      _type_hint: number
      is_disabled: true
    - category: measure
      expression:
      label: Bookings
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression:
      label: Bookings previ
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings_previ
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "(${bookings}/${bookings_previ})-1"
      label: "%bookings"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: bookings_1
      _type_hint: number
    - category: table_calculation
      label: "%weight"
      value_format:
      value_format_name: percent_0
      calculation_type: percent_of_column_sum
      table_calculation: weight
      args:
      - revenue
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - category: measure
      expression: ''
      label: RN
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: RN LY
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn_ly
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${revenue}/${rn}"
      label: ADR
      value_format:
      value_format_name: usd
      _kind_hint: measure
      table_calculation: adr
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${revenue_previo}/${rn_ly}"
      label: ADR LY
      value_format:
      value_format_name: usd
      _kind_hint: measure
      table_calculation: adr_ly
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${adr}/${adr_ly})-1 \n"
      label: "%ADR"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: adr_1
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${revenue}/${revenue_previo})-1 "
      label: "%rev"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: rev_1
      _type_hint: number
    filter_expression: matches_filter(${mview_comparation_bookings.cancelled}, `No`)
      AND matches_filter(${mview_comparation_bookings.comparation_partitiontimestamp_without_future_date},
      `NOT NULL`) AND matches_filter(${mview_comparation_bookings.gateway_type}, `-EMPTY`)
      AND matches_filter(${mview_comparation_bookings.gateway_type}, `-NULL`)
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [mview_comparation_bookings.gateway_type, revenue, rev_1, bookings]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 60
    series_labels:
      rev: "%"
      bookings_1: "%"
      adr_1: "%"
      weight: weight
    series_column_widths:
      bookings_1: 83
      bookings: 479
    series_cell_visualizations:
      revenue:
        is_active: false
    header_font_color: "#ffffff"
    header_background_color: "#416BA9"
    conditional_formatting: [{type: equal to, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: greater
          than, value: 0, background_color: '', font_color: "#7CB342", color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: less
          than, value: 0, background_color: '', font_color: "#EA4335", color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}]
    truncate_column_names: false
    defaults_version: 1
    hidden_fields: [revenue_previo, bookings_previ]
    pinned_columns:
      mview_comparation_bookings.device: left
    hidden_pivots: {}
    listen:
      Source: mview_comparation_bookings.source_fixed
      Board: mview_comparation_bookings.board
      OTB*: mview_comparation_bookings.partition_timestamp_date
      Device: mview_comparation_bookings.device
      Room: mview_comparation_bookings.room
      Travel window: mview_comparation_bookings.start_date_timestamp_date
      Market: mview_comparation_bookings.full_country
      RateName: mview_comparation_bookings.rateName_fixed
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 123
    col: 0
    width: 12
    height: 7
  - title: Revenue Gateway Comparation
    name: Revenue Gateway Comparation (2)
    model: bq_demo_c
    explore: mview_comparation_bookings
    type: looker_grid
    fields: [mview_comparation_bookings.gateway_type, bookings, revenue, revenue_previo,
      bookings_previ]
    sorts: [bookings desc 0]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression: ''
      label: Revenue
      value_format:
      value_format_name: usd_0
      based_on: mview_comparation_bookings.revenue_final
      _kind_hint: measure
      measure: revenue
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: Revenue previo
      value_format:
      value_format_name: usd_0
      based_on: mview_comparation_bookings.revenue_final
      _kind_hint: measure
      measure: revenue_previo
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "\n(${revenue}/${revenue_previo})-1 \n"
      label: "%rev"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: rev
      _type_hint: number
      is_disabled: true
    - category: measure
      expression:
      label: Bookings
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression:
      label: Bookings previ
      value_format:
      value_format_name:
      based_on: mview_comparation_bookings.num_reservas
      _kind_hint: measure
      measure: bookings_previ
      type: count
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "(${bookings}/${bookings_previ})-1"
      label: "%bookings"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: bookings_1
      _type_hint: number
    - category: table_calculation
      label: "%weight"
      value_format:
      value_format_name: percent_0
      calculation_type: percent_of_column_sum
      table_calculation: weight
      args:
      - revenue
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - category: measure
      expression: ''
      label: RN
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '0'
    - category: measure
      expression: ''
      label: RN LY
      based_on: mview_comparation_bookings.rn
      _kind_hint: measure
      measure: rn_ly
      type: sum
      _type_hint: number
      filters:
        mview_comparation_bookings.last_year_booking: '1'
    - category: table_calculation
      expression: "${revenue}/${rn}"
      label: ADR
      value_format:
      value_format_name: usd
      _kind_hint: measure
      table_calculation: adr
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${revenue_previo}/${rn_ly}"
      label: ADR LY
      value_format:
      value_format_name: usd
      _kind_hint: measure
      table_calculation: adr_ly
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${adr}/${adr_ly})-1 \n"
      label: "%ADR"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: adr_1
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${revenue}/${revenue_previo})-1 "
      label: "%rev"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: rev_1
      _type_hint: number
    - category: table_calculation
      label: "%weight"
      value_format:
      value_format_name: percent_0
      calculation_type: percent_of_column_sum
      table_calculation: weight_1
      args:
      - revenue
      _kind_hint: measure
      _type_hint: number
    filter_expression: matches_filter(${mview_comparation_bookings.cancelled}, `No`)
      AND matches_filter(${mview_comparation_bookings.comparation_partitiontimestamp_without_future_date},
      `NOT NULL`) AND matches_filter(${mview_comparation_bookings.gateway_type}, `-EMPTY`)
      AND matches_filter(${mview_comparation_bookings.gateway_type}, `-NULL`)
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [mview_comparation_bookings.gateway_type, revenue, rev_1, bookings]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 60
    series_labels:
      rev: "%"
      bookings_1: "%"
      adr_1: "%"
      weight: weight
    series_column_widths:
      bookings_1: 83
      bookings: 479
    series_cell_visualizations:
      revenue:
        is_active: false
    header_font_color: "#ffffff"
    header_background_color: "#416BA9"
    conditional_formatting: [{type: equal to, value: 0, background_color: '', font_color: "#7CB342",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: greater
          than, value: 0, background_color: '', font_color: "#7CB342", color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: less
          than, value: 0, background_color: '', font_color: "#EA4335", color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}]
    truncate_column_names: false
    defaults_version: 1
    hidden_fields: [revenue_previo, bookings_previ]
    pinned_columns:
      mview_comparation_bookings.device: left
    hidden_pivots: {}
    listen:
      Source: mview_comparation_bookings.source_fixed
      Market: mview_comparation_bookings.full_country
      Board: mview_comparation_bookings.board
      OTB*: mview_comparation_bookings.partition_timestamp_date
      Device: mview_comparation_bookings.device
      Room: mview_comparation_bookings.room
      Booking window: mview_comparation_bookings.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 139
    col: 0
    width: 12
    height: 7
  - title: Reservation Per Hour
    name: Reservation Per Hour
    model: bq_demo_c
    explore: mview_datos_reservas_6
    type: looker_line
    fields: [bookings, mview_datos_reservas_6.real_timestamp__hour]
    fill_fields: [mview_datos_reservas_6.real_timestamp__hour]
    sorts: [mview_datos_reservas_6.real_timestamp__hour desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Bookings
      based_on: mview_datos_reservas_6.identifier
      _kind_hint: measure
      measure: bookings
      type: count_distinct
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Travel window: mview_datos_reservas_6.start_date_timestamp_date
      Booking window: mview_datos_reservas_6.partition_timestamp_date
      Encrypted: hotel_corporative_encrypted.hotel_code_encrypted
      Hotel Code: hotel_corporative_encrypted.hotel_code
    row: 25
    col: 4
    width: 16
    height: 6
  filters:
  - name: Booking window
    title: Booking window
    type: field_filter
    default_value: last week
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: bq_demo_c
    explore: mview_comparation_bookings
    listens_to_filters: []
    field: mview_comparation_bookings.partition_timestamp_date
  - name: Travel window
    title: Travel window
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: bq_demo_c
    explore: mview_datos_reservas_6
    listens_to_filters: []
    field: mview_datos_reservas_6.start_date_timestamp_date
  - name: Market
    title: Market
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: bq_demo_c
    explore: mview_comparation_bookings
    listens_to_filters: [Board, Booking window, Encrypted]
    field: mview_comparation_bookings.full_country
  - name: Source
    title: Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: bq_demo_c
    explore: mview_comparation_bookings
    listens_to_filters: [Board, Booking window, Encrypted]
    field: mview_comparation_bookings.source_fixed
  - name: Device
    title: Device
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: bq_demo_c
    explore: mview_comparation_bookings
    listens_to_filters: [Board, Booking window, Encrypted]
    field: mview_comparation_bookings.device
  - name: RateName
    title: RateName
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: bq_demo_c
    explore: mview_comparation_bookings_by_start_date
    listens_to_filters: [Booking window, Encrypted]
    field: mview_comparation_bookings_by_start_date.rateName_fixed
  - name: Room
    title: Room
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: bq_demo_c
    explore: mview_comparation_bookings
    listens_to_filters: [Booking window, Encrypted]
    field: mview_comparation_bookings.room
  - name: Board
    title: Board
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: bq_demo_c
    explore: mview_comparation_bookings
    listens_to_filters: [Booking window, Encrypted]
    field: mview_comparation_bookings.board
  - name: OTB*
    title: OTB*
    type: field_filter
    default_value: this year
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: bq_demo_c
    explore: mview_comparation_bookings
    listens_to_filters: []
    field: mview_comparation_bookings.partition_timestamp_date
  - name: Encrypted
    title: Encrypted
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: true
    ui_config:
      type: advanced
      display: popover
      options: []
    model: bq_demo_c
    explore: mview_comparation_bookings
    listens_to_filters: []
    field: hotel_corporative_encrypted.hotel_code_encrypted
  - name: Hotel Code
    title: Hotel Code
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: bq_demo_c
    explore: funnel_stats
    listens_to_filters: [Encrypted]
    field: hotel_corporative_encrypted.hotel_code
