# The name of this view in Looker is "Call Agent"
view: call_agent {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.CALL_AGENT` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Agent" in Explore.

  dimension: agent {
    type: string
    sql: ${TABLE}.agent ;;
  }

  dimension: agent_name {
    type: string
    sql: ${TABLE}.agent_name ;;
  }

  dimension: billsec {
    type: number
    sql: ${TABLE}.billsec ;;
  }

  dimension: client {
    type: string
    sql: ${TABLE}.client ;;
  }

  dimension: did {
    type: string
    sql: ${TABLE}.did ;;
  }

  dimension: dst {
    type: number
    sql: ${TABLE}.dst ;;
  }

  dimension: duration {
    type: number
    sql: ${TABLE}.duration ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_duration {
    type: sum
    sql: ${duration} ;;  }
  measure: average_duration {
    type: average
    sql: ${duration} ;;  }

  dimension: fails {
    type: string
    sql: ${TABLE}.fails ;;
  }

  dimension: hotels_code {
    type: string
    sql: ${TABLE}.hotels_code ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: pdate {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.PDATE ;;
  }

  dimension: src {
    type: string
    sql: ${TABLE}.src ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: timestamp {
    type: string
    sql: ${TABLE}.timestamp ;;
  }
  measure: count {
    type: count
    drill_fields: [agent_name, name]
  }
}
