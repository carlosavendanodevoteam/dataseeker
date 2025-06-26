view: manager_change_history {
  sql_table_name: `bi_dataset.MANAGER_CHANGE_HISTORY` ;;


  dimension: changes {
    type: string
    html: {% assign words = value | split: '*@@*' %}
    {% for word in words %}
      {% if word == "B" or word == "*@@*B"%}
        <b>
      {% elsif word == "CLOSE_B" %}
        </b>
      {% elsif word == "BR" %}
        </br>
      {% elsif word == "RED" %}
        <span style='color:#ba1a1a'>
      {% elsif word == "CLOSE_RED" %}
        </span>
      {% elsif word == "GREY" %}
        <span style='color:#6e6565'>
      {% elsif word == "CLOSE_GREY" %}
        </span>
      {% elsif word == "GREEN" %}
        <span style='color:#30b50b'>
      {% elsif word == "CLOSE_GREEN" %}
        </span>
      {% else %}
        {{word}}
      {% endif %}
    {% endfor %};;
  }

  dimension: data {
    type: string
    sql: ${TABLE}.data ;;
  }
  dimension: entity_identifier {
    type: string
    sql: ${TABLE}.entity_identifier ;;
  }
  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }
  dimension: previous_data {
    type: string
    sql: ${TABLE}.previous_data ;;
  }
  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
  dimension: user {
    type: string
    sql: ${TABLE}.user ;;
  }
  measure: count {
    type: count
  }
}
