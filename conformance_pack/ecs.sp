locals {
  conformance_pack_ecs_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/ECS"
  })
}

control "ecs_task_definition_user_for_host_mode_check" {
  title       = "ECS task definition container definitions should be checked for host mode"
  description = "Check if Amazon Elastic Container Service (Amazon ECS) task definition with host networking mode has 'privileged' or 'user' container definitions.The rule is NON_COMPLIANT for task definitions with host network mode and container definitions of privileged=false or empty and user=root or empty."
  sql         = query.ecs_task_definition_user_for_host_mode_check.sql

  tags = merge(local.conformance_pack_ecs_common_tags, {
    fedramp = "true"
  })
}

