locals {
  extra_checks_ecs_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_ecs" {
  title       = "ECS"
  description = "This benchmark contains additional checks for AWS ECS service, these checks are out of the scope of any predefined benchmarks for AWS."
  children = [
    control.ecs_task_definition_logging_enabled,
  ]

  tags = local.extra_checks_ecs_common_tags
}

