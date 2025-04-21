---
- dashboard: bucked_test
  title: bucked
  layout: newspaper
  description: ''
  preferred_slug: nwoaxBCZ2ANOLEWlEQr8En
  elements:
  - title: Untitled
    name: Untitled
    model: bq_demo_c
    explore: view_comparation_hotel_ads_cpa
    type: table
    fields: [hotel_corporative_encrypted.hotel_code]
    limit: 500
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Untitled1
    name: Untitled1
    model: bq_demo_c
    explore: view_comparation_hotel_ads_cpa
    type: table
    fields: [hotel_corporative_encrypted.hotel_code]
    limit: 500
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 6
  - title: test_visual
    name: test_visual
    model: bq_demo_c
    explore: mview_datos_reservas_6
    type: looker_pie
    fields: [hotel_corporative_encrypted.hotel_code, count_of_identifier]
    sorts: [count_of_identifier desc 0]
    limit: 50
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: mview_datos_reservas_6.identifier
      expression: ''
      label: Count of Identifier
      measure: count_of_identifier
      type: count_distinct
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    listen: {}
    row: 0
    col: 8
    width: 8
    height: 6
