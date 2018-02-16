view: slot_pool {
  sql_table_name: AIRFLOW_AIRFLOW.SLOT_POOL ;;

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

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: pool {
    type: string
    sql: ${TABLE}.POOL ;;
  }

  dimension: slots {
    type: number
    sql: ${TABLE}.SLOTS ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
