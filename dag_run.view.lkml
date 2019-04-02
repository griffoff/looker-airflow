view: dag_run {
  sql_table_name: AIRFLOW_AIRFLOW.DAG_RUN ;;

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

  dimension_group: execution_date {
    type: time
    timeframes: [time, date, time_of_day,hour, minute]
    sql: ${TABLE}.EXECUTION_DATE ;;
  }

  dimension: external_trigger {
    type: yesno
    sql: ${TABLE}.EXTERNAL_TRIGGER ;;
  }

  dimension: run_id {
    type: string
    sql: ${TABLE}.RUN_ID ;;
  }

  dimension: start_date {
    type: string
    sql: ${TABLE}.START_DATE ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.STATE ;;
  }

  measure: count {
    type: count
    drill_fields: [id, dag.dag_id]
  }
}
