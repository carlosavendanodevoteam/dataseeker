view: agent_work_time {
  derived_table: {
    sql:
      WITH logins AS (
        SELECT
          Username,
          Event_Type,
          Event_Date AS login_time,
          LEAD(Event_Date) OVER (PARTITION BY Username ORDER BY Event_Date) AS next_event_time,
          LEAD(Event_Type) OVER (PARTITION BY Username ORDER BY Event_Date) AS next_event
        FROM
          `analysis-seeker.bi_dataset.RING2TRAVEL_AGENTS_REPORT`
        WHERE
          Event_Type = 'login' and
          Event_Subtype = 'voice-channel'
      ),
      logouts AS (
        SELECT
          Username,
          Event_Date AS logout_time,
        FROM
          `analysis-seeker.bi_dataset.RING2TRAVEL_AGENTS_REPORT`
        WHERE
          Event_Type = 'logout'
      )
      SELECT
        logins.Username,
        logins.login_time,
        MIN(logouts.logout_time) AS logout_time,
      FROM
        logins
      JOIN
        logouts ON logins.Username = logouts.Username
      WHERE
        logouts.logout_time > logins.login_time
        AND logouts.logout_time <= logins.next_event_time
      GROUP BY
        logins.Username, logins.login_time
    ;;
  }

  dimension: agent {
    type: string
    sql: ${TABLE}.Username ;;
  }

  dimension: Event_Subtype {
    type: string
    sql: ${TABLE}.Event_Subtype ;;
  }

  dimension: login_time {
    type: duration_minute
    sql: if(${TABLE}.Event_Type = 'login' and ${TABLE}.Event_Subtype = 'voice-channel' ,${TABLE}.login_time, 0) ;;
  }

  dimension: logout_time {
    type: duration_minute
    sql: ${TABLE}.logout_time ;;
  }

  measure: work_duration_hours {
    type: number
    sql: TIMESTAMP_DIFF(${logout_time}, ${login_time}, HOUR) ;;
  }
}
