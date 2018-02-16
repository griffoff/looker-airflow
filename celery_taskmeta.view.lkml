view: celery_taskmeta {
  sql_table_name: AIRFLOW_AIRFLOW.CELERY_TASKMETA ;;

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

  dimension_group: date_done {
    type: time
    timeframes: [time,date,time_of_day,hour,minute]
    sql: ${TABLE}.DATE_DONE ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.STATUS ;;
  }

# *******************
# this seems to bear no relation to the task_id in any of the other tables
# *************
  dimension: task_id {
    type: string
    sql: ${TABLE}.TASK_ID ;;
  }

  dimension: traceback {
    type: string
    sql: ${TABLE}.TRACEBACK ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
