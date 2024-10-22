locals {
  all_controls_ecs_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/ECS"
  })
}

benchmark "all_controls_ecs" {
  title       = "ECS"
  description = "This section contains recommendations for configuring ECS resources."
  children = [
    control.ecs_cluster_container_insights_enabled,
    control.ecs_cluster_container_instance_agent_connected,
    control.ecs_cluster_encryption_at_rest_enabled,
    control.ecs_cluster_instance_in_vpc,
    control.ecs_cluster_no_active_services_count,
    control.ecs_cluster_no_registered_container_instance,
    control.ecs_service_fargate_using_latest_platform_version,
    control.ecs_service_load_balancer_attached,
    control.ecs_service_not_publicly_accessible,
    control.ecs_task_definition_container_environment_no_secret,
    control.ecs_task_definition_container_non_privileged,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.ecs_task_definition_logging_enabled,
    control.ecs_task_definition_no_host_pid_mode,
    control.ecs_task_definition_no_root_user,
    control.ecs_task_definition_user_for_host_mode_check
  ]

  tags = merge(local.all_controls_ecs_common_tags, {
    type = "Benchmark"
  })
}
