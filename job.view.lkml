view: job {
  sql_table_name: AIRFLOW_AIRFLOW.JOB ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._FIVETRAN_DELETED ;;
    hidden: yes
  }

  dimension: _fivetran_synced {
    type: string
    sql: ${TABLE}._FIVETRAN_SYNCED ;;
    hidden: yes
  }

  dimension: dag_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.DAG_ID ;;
  }

  dimension: end_date {
    type: string
    sql: ${TABLE}.END_DATE ;;
  }

  dimension: executor_class {
    type: string
    sql: ${TABLE}.EXECUTOR_CLASS ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}.HOSTNAME ;;
  }

  dimension: job_type {
    type: string
    sql: ${TABLE}.JOB_TYPE ;;
  }

  dimension: latest_heartbeat {
    type: string
    sql: ${TABLE}.LATEST_HEARTBEAT ;;
  }

  dimension: start_date {
    type: string
    sql: ${TABLE}.START_DATE ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.STATE ;;
  }

  dimension: unixname {
    type: string
    sql: ${TABLE}.UNIXNAME ;;
  }

  measure: count {
    type: count
    drill_fields: [id, unixname, hostname, dag.dag_id, task_instance.count]
  }
}
