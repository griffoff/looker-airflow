view: dag {
  sql_table_name: AIRFLOW_AIRFLOW.DAG ;;

  dimension: dag_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.DAG_ID ;;
  }

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._FIVETRAN_DELETED ;;
  }

  dimension: _fivetran_synced {
    type: string
    sql: ${TABLE}._FIVETRAN_SYNCED ;;
  }

  dimension: fileloc {
    type: string
    sql: ${TABLE}.FILELOC ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.IS_ACTIVE ;;
  }

  dimension: is_paused {
    type: yesno
    sql: ${TABLE}.IS_PAUSED ;;
  }

  dimension: is_subdag {
    type: yesno
    sql: ${TABLE}.IS_SUBDAG ;;
  }

  dimension: last_expired {
    type: string
    sql: ${TABLE}.LAST_EXPIRED ;;
  }

  dimension: last_pickled {
    type: string
    sql: ${TABLE}.LAST_PICKLED ;;
  }

  dimension: last_scheduler_run {
    type: string
    sql: ${TABLE}.LAST_SCHEDULER_RUN ;;
  }

  dimension: owners {
    type: string
    sql: ${TABLE}.OWNERS ;;
  }

  dimension: pickle_id {
    type: number
    sql: ${TABLE}.PICKLE_ID ;;
  }

  dimension: scheduler_lock {
    type: yesno
    sql: ${TABLE}.SCHEDULER_LOCK ;;
  }

  measure: count {
    type: count
    drill_fields: [dag_id, dag_run.count, job.count, log.count, task_instance.count]
  }
}
