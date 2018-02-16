# If necessary, uncomment the line below to include explore_source.

include: "fivetran_airflow.model.lkml"

view: task {
  derived_table: {
    explore_source: dag {
      column: dag_id { field: task_instance.dag_id }
      column: task_id { field: task_instance.task_id }
      column: operator { field: task_instance.operator }
      column: duration_avg { field: task_instance.duration_avg }
      column: duration_total { field: task_instance.duration_total }
      column: count { field: task_instance.count }
    }
    datagroup_trigger: fivetran_airflow_default_datagroup
  }
  dimension: dag_id {}
  dimension: task_id {primary_key:yes}
  dimension: operator {}
  dimension: duration_avg {
    value_format: "hh:mm:ss"
    type: number
  }
  dimension: duration_total {
    value_format: "hh:mm:ss"
    type: number
  }
  dimension: count {
    type: number
  }

}
