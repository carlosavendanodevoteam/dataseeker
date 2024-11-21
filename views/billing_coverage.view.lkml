# The name of this view in Looker is "Billing Coverage"
view: billing_coverage {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `analysis-seeker.Google_ads_dataset.BILLING_COVERAGE` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Bill Number" in Explore.

  dimension: bill_number {
    type: string
    sql: ${TABLE}.bill_number ;;
  }

  dimension: cancelled {
    type: yesno
    sql: ${TABLE}.cancelled ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.Hotel_code ;;
  }

  dimension: import {
    type: number
    sql: ${TABLE}.import ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: month {
    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Month ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_revenue {
    type: sum
    sql: ${revenue} ;;  }
  measure: average_revenue {
    type: average
    sql: ${revenue} ;;  }
  measure: count {
    type: count
  }

  dimension: month_number{
    type: number
    sql:  EXTRACT(month FROM cast(${TABLE}.month as timestamp)) ;;
  }

  dimension: year_number{
    type: number
    sql:  EXTRACT(YEAR FROM cast(${TABLE}.month as timestamp)) ;;
  }

  dimension: month_text{
    type: string
    sql: Case
        when ${month_number} = 1 then "Jan"
        when ${month_number} = 2 then "Feb"
        when ${month_number} = 3 then "Mar"
        when ${month_number} = 4 then "Apr"
        when ${month_number} = 5 then "May"
        when ${month_number} = 6 then "Jun"
        when ${month_number} = 7 then "Jul"
        when ${month_number} = 8 then "Aug"
        when ${month_number} = 9 then "Sep"
        when ${month_number} = 10 then "Oct"
        when ${month_number} = 11 then "Nov"
        else "Dec"
      End;;
  }

  dimension: bookingDate {
    type: string
    sql: CONCAT(${year_number}, ' ', ${month_text}) ;;
  }


}
