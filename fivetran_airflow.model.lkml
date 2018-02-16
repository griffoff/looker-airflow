connection: "snowflake_airflow"

include: "/core/common.lkml"
# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: fivetran_airflow_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: fivetran_airflow_default_datagroup

explore: dag {
  join: dag_run {
    sql_on: ${dag.dag_id} = ${dag_run.dag_id} ;;
  }
  join: task_instance {
    sql_on: ${dag.dag_id} = ${task_instance.dag_id} ;;
  }
}
