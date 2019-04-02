view: log {
  sql_table_name: AIRFLOW_AIRFLOW.LOG ;;

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

  dimension: dttm {
    type: string
    sql: ${TABLE}.DTTM ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.EVENT ;;
  }

 dimension_group: execution_date {
  type: time
  timeframes: [time,date,time_of_day,hour,minute]
  sql: ${TABLE}.EXECUTION_DATE ;;
}

  dimension: extra {
    type: string
    sql: ${TABLE}.EXTRA ;;
  }

  dimension: owner {
    type: string
    sql: ${TABLE}.OWNER ;;
  }

  dimension: task_id {
    type: string
    sql: ${TABLE}.TASK_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [id, dag.dag_id]
  }
}
