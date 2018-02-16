view: import_error {
  sql_table_name: AIRFLOW_AIRFLOW.IMPORT_ERROR ;;

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

  dimension: filename {
    type: string
    sql: ${TABLE}.FILENAME ;;
  }

  dimension: stacktrace {
    type: string
    sql: ${TABLE}.STACKTRACE ;;
  }

  dimension: timestamp {
    type: string
    sql: ${TABLE}.TIMESTAMP ;;
  }

  measure: count {
    type: count
    drill_fields: [id, filename]
  }
}
