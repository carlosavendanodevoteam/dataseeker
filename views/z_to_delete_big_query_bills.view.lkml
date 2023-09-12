# The name of this view in Looker is "Z to Delete Big Query Bills"
view: z_to_delete_big_query_bills {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.Z_TO_DELETE_BIG_QUERY_BILLS` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Bi Engine Statistics Acceleration Mode" in Explore.

  dimension: bi_engine_statistics__acceleration_mode {
    type: string
    sql: ${TABLE}.bi_engine_statistics.acceleration_mode ;;
    group_label: "Bi Engine Statistics"
    group_item_label: "Acceleration Mode"
  }

  dimension: bi_engine_statistics__bi_engine_mode {
    type: string
    sql: ${TABLE}.bi_engine_statistics.bi_engine_mode ;;
    group_label: "Bi Engine Statistics"
    group_item_label: "Bi Engine Mode"
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: bi_engine_statistics__bi_engine_reasons {
    hidden: yes
    sql: ${TABLE}.bi_engine_statistics.bi_engine_reasons ;;
    group_label: "Bi Engine Statistics"
    group_item_label: "Bi Engine Reasons"
  }

  dimension: cache_hit {
    type: yesno
    sql: ${TABLE}.cache_hit ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: creation {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.creation_time ;;
  }

  dimension: destination_table__dataset_id {
    type: string
    sql: ${TABLE}.destination_table.dataset_id ;;
    group_label: "Destination Table"
    group_item_label: "Dataset ID"
  }

  dimension: destination_table__project_id {
    type: string
    sql: ${TABLE}.destination_table.project_id ;;
    group_label: "Destination Table"
    group_item_label: "Project ID"
  }

  dimension: destination_table__table_id {
    type: string
    sql: ${TABLE}.destination_table.table_id ;;
    group_label: "Destination Table"
    group_item_label: "Table ID"
  }

  dimension: dml_statistics__deleted_row_count {
    type: number
    sql: ${TABLE}.dml_statistics.deleted_row_count ;;
    group_label: "Dml Statistics"
    group_item_label: "Deleted Row Count"
  }

  dimension: dml_statistics__inserted_row_count {
    type: number
    sql: ${TABLE}.dml_statistics.inserted_row_count ;;
    group_label: "Dml Statistics"
    group_item_label: "Inserted Row Count"
  }

  dimension: dml_statistics__updated_row_count {
    type: number
    sql: ${TABLE}.dml_statistics.updated_row_count ;;
    group_label: "Dml Statistics"
    group_item_label: "Updated Row Count"
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

  dimension_group: end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.end_time ;;
  }

  dimension: error_result__debug_info {
    type: string
    sql: ${TABLE}.error_result.debug_info ;;
    group_label: "Error Result"
    group_item_label: "Debug Info"
  }

  dimension: error_result__location {
    type: string
    sql: ${TABLE}.error_result.location ;;
    group_label: "Error Result"
    group_item_label: "Location"
  }

  dimension: error_result__message {
    type: string
    sql: ${TABLE}.error_result.message ;;
    group_label: "Error Result"
    group_item_label: "Message"
  }

  dimension: error_result__reason {
    type: string
    sql: ${TABLE}.error_result.reason ;;
    group_label: "Error Result"
    group_item_label: "Reason"
  }

  dimension: job_id {
    type: string
    sql: ${TABLE}.job_id ;;
  }

  dimension: job_stages {
    hidden: yes
    sql: ${TABLE}.job_stages ;;
  }

  dimension: job_type {
    type: string
    sql: ${TABLE}.job_type ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: materialized_view_statistics__materialized_view {
    hidden: yes
    sql: ${TABLE}.materialized_view_statistics.materialized_view ;;
    group_label: "Materialized View Statistics"
    group_item_label: "Materialized View"
  }

  dimension: parent_job_id {
    type: string
    sql: ${TABLE}.parent_job_id ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: project_number {
    type: number
    sql: ${TABLE}.project_number ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }

  dimension: query_info__optimization_details {
    type: string
    sql: ${TABLE}.query_info.optimization_details ;;
    group_label: "Query Info"
    group_item_label: "Optimization Details"
  }

  dimension: query_info__performance_insights__avg_previous_execution_ms {
    type: number
    sql: ${TABLE}.query_info.performance_insights.avg_previous_execution_ms ;;
    group_label: "Query Info Performance Insights"
    group_item_label: "Avg Previous Execution Ms"
  }

  dimension: query_info__performance_insights__stage_performance_change_insights {
    hidden: yes
    sql: ${TABLE}.query_info.performance_insights.stage_performance_change_insights ;;
    group_label: "Query Info Performance Insights"
    group_item_label: "Stage Performance Change Insights"
  }

  dimension: query_info__performance_insights__stage_performance_standalone_insights {
    hidden: yes
    sql: ${TABLE}.query_info.performance_insights.stage_performance_standalone_insights ;;
    group_label: "Query Info Performance Insights"
    group_item_label: "Stage Performance Standalone Insights"
  }

  dimension: query_info__query_hashes__normalized_literals {
    type: string
    sql: ${TABLE}.query_info.query_hashes.normalized_literals ;;
    group_label: "Query Info Query Hashes"
    group_item_label: "Normalized Literals"
  }

  dimension: query_info__resource_warning {
    type: string
    sql: ${TABLE}.query_info.resource_warning ;;
    group_label: "Query Info"
    group_item_label: "Resource Warning"
  }

  dimension: referenced_tables {
    hidden: yes
    sql: ${TABLE}.referenced_tables ;;
  }

  dimension: reservation_id {
    type: string
    sql: ${TABLE}.reservation_id ;;
  }

  dimension: session_info__session_id {
    type: string
    sql: ${TABLE}.session_info.session_id ;;
    group_label: "Session Info"
    group_item_label: "Session ID"
  }

  dimension: slot_usage {
    type: number
    sql: ${TABLE}.slot_usage ;;
  }

  dimension_group: start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.start_time ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: statement_type {
    type: string
    sql: ${TABLE}.statement_type ;;
  }

  dimension: timeline {
    hidden: yes
    sql: ${TABLE}.timeline ;;
  }

  dimension: total_bytes_billed {
    type: number
    sql: ${TABLE}.total_bytes_billed ;;
  }

  dimension: total_bytes_processed {
    type: number
    sql: ${TABLE}.total_bytes_processed ;;
  }

  dimension: total_modified_partitions {
    type: number
    sql: ${TABLE}.total_modified_partitions ;;
  }

  dimension: total_slot_ms {
    type: number
    sql: ${TABLE}.total_slot_ms ;;
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: transferred_bytes {
    type: number
    sql: ${TABLE}.transferred_bytes ;;
  }

  dimension: user_email {
    type: string
    sql: ${TABLE}.user_email ;;
  }
  measure: count {
    type: count
  }
}

# The name of this view in Looker is "Z to Delete Big Query Bills Labels"
view: z_to_delete_big_query_bills__labels {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: key ;;
  }

  dimension: value {
    type: string
    sql: value ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: z_to_delete_big_query_bills__labels {
    type: string
    hidden: yes
    sql: z_to_delete_big_query_bills__labels ;;
  }
}

# The name of this view in Looker is "Z to Delete Big Query Bills Timeline"
view: z_to_delete_big_query_bills__timeline {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Active Units" in Explore.

  dimension: active_units {
    type: number
    sql: active_units ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_active_units {
    type: sum
    sql: ${active_units} ;;  }
  measure: average_active_units {
    type: average
    sql: ${active_units} ;;  }

  dimension: completed_units {
    type: number
    sql: completed_units ;;
  }

  dimension: elapsed_ms {
    type: number
    sql: elapsed_ms ;;
  }

  dimension: estimated_runnable_units {
    type: number
    sql: estimated_runnable_units ;;
  }

  dimension: pending_units {
    type: number
    sql: pending_units ;;
  }

  dimension: total_slot_ms {
    type: number
    sql: total_slot_ms ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: z_to_delete_big_query_bills__timeline {
    type: string
    hidden: yes
    sql: z_to_delete_big_query_bills__timeline ;;
  }
}

# The name of this view in Looker is "Z to Delete Big Query Bills Job Stages"
view: z_to_delete_big_query_bills__job_stages {
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Completed Parallel Inputs" in Explore.

  dimension: completed_parallel_inputs {
    type: number
    sql: completed_parallel_inputs ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_completed_parallel_inputs {
    type: sum
    sql: ${completed_parallel_inputs} ;;  }
  measure: average_completed_parallel_inputs {
    type: average
    sql: ${completed_parallel_inputs} ;;  }

  dimension: compute_mode {
    type: string
    sql: compute_mode ;;
  }

  dimension: compute_ms_avg {
    type: number
    sql: compute_ms_avg ;;
  }

  dimension: compute_ms_max {
    type: number
    sql: compute_ms_max ;;
  }

  dimension: compute_ratio_avg {
    type: number
    sql: compute_ratio_avg ;;
  }

  dimension: compute_ratio_max {
    type: number
    sql: compute_ratio_max ;;
  }

  dimension: end_ms {
    type: number
    sql: end_ms ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: input_stages {
    hidden: yes
    sql: input_stages ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: parallel_inputs {
    type: number
    sql: parallel_inputs ;;
  }

  dimension: read_ms_avg {
    type: number
    sql: read_ms_avg ;;
  }

  dimension: read_ms_max {
    type: number
    sql: read_ms_max ;;
  }

  dimension: read_ratio_avg {
    type: number
    sql: read_ratio_avg ;;
  }

  dimension: read_ratio_max {
    type: number
    sql: read_ratio_max ;;
  }

  dimension: records_read {
    type: number
    sql: records_read ;;
  }

  dimension: records_written {
    type: number
    sql: records_written ;;
  }

  dimension: shuffle_output_bytes {
    type: number
    sql: shuffle_output_bytes ;;
  }

  dimension: shuffle_output_bytes_spilled {
    type: number
    sql: shuffle_output_bytes_spilled ;;
  }

  dimension: slot_ms {
    type: number
    sql: slot_ms ;;
  }

  dimension: start_ms {
    type: number
    sql: start_ms ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: steps {
    hidden: yes
    sql: steps ;;
  }

  dimension: wait_ms_avg {
    type: number
    sql: wait_ms_avg ;;
  }

  dimension: wait_ms_max {
    type: number
    sql: wait_ms_max ;;
  }

  dimension: wait_ratio_avg {
    type: number
    sql: wait_ratio_avg ;;
  }

  dimension: wait_ratio_max {
    type: number
    sql: wait_ratio_max ;;
  }

  dimension: write_ms_avg {
    type: number
    sql: write_ms_avg ;;
  }

  dimension: write_ms_max {
    type: number
    sql: write_ms_max ;;
  }

  dimension: write_ratio_avg {
    type: number
    sql: write_ratio_avg ;;
  }

  dimension: write_ratio_max {
    type: number
    sql: write_ratio_max ;;
  }

  dimension: z_to_delete_big_query_bills__job_stages {
    type: string
    hidden: yes
    sql: z_to_delete_big_query_bills__job_stages ;;
  }
}

# The name of this view in Looker is "Z to Delete Big Query Bills Referenced Tables"
view: z_to_delete_big_query_bills__referenced_tables {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Dataset ID" in Explore.

  dimension: dataset_id {
    type: string
    sql: dataset_id ;;
  }

  dimension: project_id {
    type: string
    sql: project_id ;;
  }

  dimension: table_id {
    type: string
    sql: table_id ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: z_to_delete_big_query_bills__referenced_tables {
    type: string
    hidden: yes
    sql: z_to_delete_big_query_bills__referenced_tables ;;
  }
}

# The name of this view in Looker is "Z to Delete Big Query Bills Job Stages Steps"
view: z_to_delete_big_query_bills__job_stages__steps {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Kind" in Explore.

  dimension: kind {
    type: string
    sql: ${TABLE}.kind ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: substeps {
    hidden: yes
    sql: ${TABLE}.substeps ;;
  }
}

# The name of this view in Looker is "Z to Delete Big Query Bills Job Stages Input Stages"
view: z_to_delete_big_query_bills__job_stages__input_stages {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Z to Delete Big Query Bills Job Stages Input Stages" in Explore.

  dimension: z_to_delete_big_query_bills__job_stages__input_stages {
    type: number
    sql: z_to_delete_big_query_bills__job_stages__input_stages ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_z_to_delete_big_query_bills__job_stages__input_stages {
    type: sum
    sql: ${z_to_delete_big_query_bills__job_stages__input_stages} ;;  }
  measure: average_z_to_delete_big_query_bills__job_stages__input_stages {
    type: average
    sql: ${z_to_delete_big_query_bills__job_stages__input_stages} ;;  }
}

# The name of this view in Looker is "Z to Delete Big Query Bills Job Stages Steps Substeps"
view: z_to_delete_big_query_bills__job_stages__steps__substeps {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Z to Delete Big Query Bills Job Stages Steps Substeps" in Explore.

  dimension: z_to_delete_big_query_bills__job_stages__steps__substeps {
    type: string
    sql: z_to_delete_big_query_bills__job_stages__steps__substeps ;;
  }
}

# The name of this view in Looker is "Z to Delete Big Query Bills Bi Engine Statistics Bi Engine Reasons"
view: z_to_delete_big_query_bills__bi_engine_statistics__bi_engine_reasons {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }
}

# The name of this view in Looker is "Z to Delete Big Query Bills Materialized View Statistics Materialized View"
view: z_to_delete_big_query_bills__materialized_view_statistics__materialized_view {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Chosen" in Explore.

  dimension: chosen {
    type: yesno
    sql: ${TABLE}.chosen ;;
  }

  dimension: estimated_bytes_saved {
    type: number
    sql: ${TABLE}.estimated_bytes_saved ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_estimated_bytes_saved {
    type: sum
    sql: ${estimated_bytes_saved} ;;  }
  measure: average_estimated_bytes_saved {
    type: average
    sql: ${estimated_bytes_saved} ;;  }

  dimension: rejected_reason {
    type: string
    sql: ${TABLE}.rejected_reason ;;
  }

  dimension: table_reference__dataset_id {
    type: string
    sql: ${TABLE}.table_reference.dataset_id ;;
    group_label: "Table Reference"
    group_item_label: "Dataset ID"
  }

  dimension: table_reference__project_id {
    type: string
    sql: ${TABLE}.table_reference.project_id ;;
    group_label: "Table Reference"
    group_item_label: "Project ID"
  }

  dimension: table_reference__table_id {
    type: string
    sql: ${TABLE}.table_reference.table_id ;;
    group_label: "Table Reference"
    group_item_label: "Table ID"
  }
}

# The name of this view in Looker is "Z to Delete Big Query Bills Query Info Performance Insights Stage Performance Change Insights"
view: z_to_delete_big_query_bills__query_info__performance_insights__stage_performance_change_insights {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Input Data Change Records Read Diff Percentage" in Explore.

  dimension: input_data_change__records_read_diff_percentage {
    type: number
    sql: ${TABLE}.input_data_change.records_read_diff_percentage ;;
    group_label: "Input Data Change"
    group_item_label: "Records Read Diff Percentage"
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_input_data_change__records_read_diff_percentage {
    type: sum
    sql: ${input_data_change__records_read_diff_percentage} ;;  }
  measure: average_input_data_change__records_read_diff_percentage {
    type: average
    sql: ${input_data_change__records_read_diff_percentage} ;;  }

  dimension: stage_id {
    type: number
    sql: ${TABLE}.stage_id ;;
  }
}

# The name of this view in Looker is "Z to Delete Big Query Bills Query Info Performance Insights Stage Performance Standalone Insights"
view: z_to_delete_big_query_bills__query_info__performance_insights__stage_performance_standalone_insights {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Insufficient Shuffle Quota" in Explore.

  dimension: insufficient_shuffle_quota {
    type: yesno
    sql: ${TABLE}.insufficient_shuffle_quota ;;
  }

  dimension: slot_contention {
    type: yesno
    sql: ${TABLE}.slot_contention ;;
  }

  dimension: stage_id {
    type: number
    sql: ${TABLE}.stage_id ;;
  }
}
