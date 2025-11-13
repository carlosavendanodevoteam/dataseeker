# --- Archivo: view_marketing_digital.view.lkml ---

view: view_marketing_digital {
  sql_table_name: `analysis-seeker.bi_core.MVIEW_MARKETING_DIGITAL` ;;

  dimension_group: partition_date {
    datatype: date
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.partition_date ;;
  }

  # --- Dimensiones (con etiquetas en Español) ---

  dimension: data_source {
    type: string
    description: "Fuente de los datos (ej. WIHP, Derbysoft)"
    label: "Fuente de Datos"
    sql: ${TABLE}.data_source ;;
  }

  dimension: original_source {
    type: string
    label: "Fuente Original"
    sql: ${TABLE}.original_source ;;
  }

  dimension: hotel_code {
    type: string
    label: "Código de Hotel"
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: campaign_id {
    type: string
    label: "ID de Campaña"
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    label: "Nombre de Campaña"
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: country {
    type: string
    label: "País"
    sql: ${TABLE}.country ;;
  }

  dimension: device {
    type: string
    label: "Dispositivo"
    sql: ${TABLE}.device ;;
  }


  # --- Medidas (Métricas Base) ---

  dimension: impressions {
    type: number
    label: "Impresiones"
    sql: ${TABLE}.impressions ;;
  }

  dimension: eligible_impressions {
    type: number
    label: "Impresiones Elegibles"
    sql: ${TABLE}.eligible_impressions ;;
  }

  dimension: clicks {
    type: number
    label: "Clicks"
    sql: ${TABLE}.clicks ;;
  }

  dimension: cost {
    type: number
    label: "Coste"
    sql: ${TABLE}.cost ;;

  }

  dimension: conversions {
    type: number
    label: "Conversiones"
    sql: ${TABLE}.conversions ;;
  }

  dimension: conversions_value {
    type: number
    label: "Valor de Conversion"
    sql: ${TABLE}.conversions_value ;;

  }

  measure: count {
    type: count
    label: "Conteo de Filas"
    drill_fields: [hotel_code, campaign_name]
  }

  # --- Medidas Calculadas (KPIs de Marketing) ---

  dimension: ctr {
    type: number
    label: "CTR (Click-Through Rate)"
    # (Clicks / Impresiones)
    sql: SAFE_DIVIDE(${clicks}, ${impressions}) ;;

  }

  dimension: cpc {
    type: number
    label: "CPC (Coste por Click)"
    # (Coste / Clicks)
    sql: SAFE_DIVIDE(${cost}, ${clicks}) ;;

  }

  dimension: cvr {
    type: number
    label: "Tasa de Conversión (CVR)"
    # (Conversiones / Clicks)
    sql: SAFE_DIVIDE(${conversions}, ${clicks}) ;;
    value_format_name: "percent_2"
  }

  dimension: cpa {
    type: number
    label: "CPA (Coste por Adquisición)"
    # (Coste / Conversiones)
    sql: SAFE_DIVIDE(${cost}, ${conversions}) ;;

  }

  dimension: roas {
    type: number
    label: "ROAS (Retorno de Inversión Publicitaria)"
    # (Valor de Conversión / Coste)
    sql: SAFE_DIVIDE(${conversions_value}, ${cost}) ;;
    value_format_name: "decimal_2"
  }
}
