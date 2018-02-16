connection: "snowflake_airflow"

include: "/core/common.lkml"
# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: fivetran_airflow_default_datagroup {
  sql_trigger: SELECT count(*) FROM AIRFLOW_AIRFLOW.log;;
  #max_cache_age: "1 hour"
}

persist_with: fivetran_airflow_default_datagroup

explore: dag {
  join: dag_run {
    sql_on: ${dag.dag_id} = ${dag_run.dag_id} ;;
    relationship: one_to_many
  }
  join: task_instance {
    sql_on: ${dag.dag_id} = ${task_instance.dag_id};;
    relationship: one_to_many
  }
  join: job {
    sql_on: ${task_instance.job_id} = ${job.id} ;;
    relationship: one_to_many
   }
}

explore: task {
  join: task_instance {
    sql_on: (${task.dag_id}, ${task.task_id}) = (${task_instance.dag_id}, ${task_instance.task_id});;
    relationship: one_to_many
  }
  join: log {
    sql_on: (${task.dag_id}, ${task.task_id}) = (${log.dag_id}, ${log.task_id}) ;;
    relationship: one_to_many
  }

  # *******************
  # task_id in celery_taskmeta seems to bear no relation to the task_id in any of the other tables
  # *************
  #join: celery_taskmeta {
  #  sql_on: ${task.task_id} = ${celery_taskmeta.task_id} ;;
  #  relationship: one_to_many
  #}
}
