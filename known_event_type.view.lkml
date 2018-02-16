view: known_event_type {
  sql_table_name: AIRFLOW_AIRFLOW.KNOWN_EVENT_TYPE ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._FIVETRAN_DELETED ;;
  }

  dimension: _fivetran_synced {
    type: string
    sql: ${TABLE}._FIVETRAN_SYNCED ;;
  }

  dimension: know_event_type {
    type: string
    sql: ${TABLE}.KNOW_EVENT_TYPE ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
