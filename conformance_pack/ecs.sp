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
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    nist_800_53_rev_5      = "true"
  })
}

control "ecs_task_definition_logging_enabled" {
  title       = "ECS task definitions should have logging enabled"
  description = "Ensure logging is enabled for task definitions so that you can access your containerized application logs for debugging and auditing purposes. On top of centralized logging, these log drivers often include additional capabilities that are useful for operation."
  sql         = query.ecs_task_definition_logging_enabled.sql

  tags = merge(local.conformance_pack_ecs_common_tags, {
    other_checks = "true"
  })
}
