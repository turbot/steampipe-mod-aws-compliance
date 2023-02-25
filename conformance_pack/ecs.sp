locals {
  conformance_pack_ecs_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/ECS"
  })
}

control "ecs_cluster_instance_in_vpc" {
  title       = "ECS Cluster instances should be in a VPC"
  description = "Deploy AWS ECS cluster instance within an Amazon Virtual Private Cloud (Amazon VPC) for a secure communication between a instance and other services within the Amazon VPC."
  query       = query.ecs_cluster_instance_in_vpc

  tags = merge(local.conformance_pack_ecs_common_tags, {
    other_checks = "true"
  })
}

control "ecs_cluster_no_registered_container_instance" {
  title       = "At least one instance should be registered with ECS Cluster"
  description = "This control ensures that at least one container instance is  registered with an ECS cluster."
  query       = query.ecs_cluster_no_registered_container_instance

  tags = merge(local.conformance_pack_ecs_common_tags, {
    other_checks = "true"
  })
}

control "ecs_service_load_balancer_attached" {
  title       = "ECS service should be attached to load balancer"
  description = "ECS service can be configured to use Elastic Load Balancing to distribute traffic evenly across the tasks in your service. It is recommend to use Application Load Balancers for your Amazon ECS services so that you can take advantage of these latest features, unless your service requires a feature that is only available with Network Load Balancers or Classic Load Balancers."
  query       = query.ecs_service_load_balancer_attached

  tags = merge(local.conformance_pack_ecs_common_tags, {
    other_checks = "true"
  })
}

control "ecs_task_definition_user_for_host_mode_check" {
  title       = "ECS task definition container definitions should be checked for host mode"
  description = "Check if Amazon Elastic Container Service (Amazon ECS) task definition with host networking mode has 'privileged' or 'user' container definitions.The rule is NON_COMPLIANT for task definitions with host network mode and container definitions of privileged=false or empty and user=root or empty."
  query       = query.ecs_task_definition_user_for_host_mode_check

  tags = merge(local.conformance_pack_ecs_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_5      = "true"
  })
}

control "ecs_task_definition_logging_enabled" {
  title       = "ECS task definitions should have logging enabled"
  description = "Ensure logging is enabled for task definitions so that you can access your containerized application logs for debugging and auditing purposes. On top of centralized logging, these log drivers often include additional capabilities that are useful for operation."
  query       = query.ecs_task_definition_logging_enabled

  tags = merge(local.conformance_pack_ecs_common_tags, {
    other_checks = "true"
  })
}
