view: task_instance {
  sql_table_name: AIRFLOW_AIRFLOW.TASK_INSTANCE ;;

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._FIVETRAN_DELETED ;;
  }

  dimension: _fivetran_synced {
    type: string
    sql: ${TABLE}._FIVETRAN_SYNCED ;;
  }

  dimension: dag_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.DAG_ID ;;
  }

  dimension: duration {
    sql: ${TABLE}.DURATION/60/24;;
  }

  measure: duration_total {
    type: sum
    sql: ${duration} ;;
    value_format_name: duration_hms
  }

  measure: duration_avg {
    type: average
    sql: ${duration} ;;
    value_format_name: duration_hms
  }

  dimension: end_date {
    type: string
    sql: ${TABLE}.END_DATE ;;
  }

  dimension_group: execution_date {
    type: time
    timeframes: [time,date,time_of_day,hour,minute]
    sql: ${TABLE}.EXECUTION_DATE ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}.HOSTNAME ;;
  }

  dimension: job_id {
    type: number
    primary_key: yes
    # hidden: yes
    sql: ${TABLE}.JOB_ID ;;
  }

  dimension: operator {
    type: string
    sql: ${TABLE}.OPERATOR ;;
  }

  dimension: pool {
    type: string
    sql: ${TABLE}.POOL ;;
  }

  dimension: priority_weight {
    type: number
    sql: ${TABLE}.PRIORITY_WEIGHT ;;
  }

  dimension: queue {
    type: string
    sql: ${TABLE}.QUEUE ;;
  }

  dimension: queued_dttm {
    type: string
    sql: ${TABLE}.QUEUED_DTTM ;;
  }

  dimension: start_date {
    type: string
    sql: ${TABLE}.START_DATE ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.STATE ;;
  }

  dimension: task_id {
    type: string
    sql: ${TABLE}.TASK_ID ;;
  }

  dimension: try_number {
    type: number
    sql: ${TABLE}.TRY_NUMBER ;;
  }

  dimension: unixname {
    type: string
    sql: ${TABLE}.UNIXNAME ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      unixname,
      hostname,
      dag.dag_id,
      job.id,
      job.unixname,
      job.hostname
    ]
  }
}
