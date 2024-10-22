locals {
  foundational_security_ecs_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/ECS"
  })
}

benchmark "foundational_security_ecs" {
  title         = "Elastic Container Service"
  documentation = file("./foundational_security/docs/foundational_security_ecs.md")
  children = [
    control.foundational_security_ecs_1,
    control.foundational_security_ecs_2,
    control.foundational_security_ecs_3,
    control.foundational_security_ecs_4,
    control.foundational_security_ecs_5,
    control.foundational_security_ecs_8,
    control.foundational_security_ecs_9,
    control.foundational_security_ecs_10,
    control.foundational_security_ecs_12
  ]

  tags = merge(local.foundational_security_ecs_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_ecs_1" {
  title         = "1 Amazon ECS task definitions should have secure networking modes and user definitions"
  description   = "This control checks whether an Amazon ECS task definition that has host networking mode also has 'privileged' or 'user' container definitions. The control fails for task definitions that have host network mode and container definitions where privileged=false or is empty and user=root or is empty."
  severity      = "medium"
  query         = query.ecs_task_definition_user_for_host_mode_check
  documentation = file("./foundational_security/docs/foundational_security_ecs_1.md")

  tags = merge(local.foundational_security_ecs_common_tags, {
    foundational_security_item_id  = "ecs_1"
    foundational_security_category = "secure_access_management"
  })
}

control "foundational_security_ecs_2" {
  title       = "2 Amazon ECS services should not have public IP addresses assigned to them automatically"
  description = "This control checks whether Amazon ECS services are configured to automatically assign public IP addresses. This control fails if AssignPublicIP is ENABLED. This control passes if AssignPublicIP is DISABLED."
  severity    = "high"
  query       = query.ecs_service_not_publicly_accessible
  #documentation = file("./foundational_security/docs/foundational_security_ecs_2.md")

  tags = merge(local.foundational_security_ecs_common_tags, {
    foundational_security_item_id  = "ecs_2"
    foundational_security_category = "resources_not_publicly_accessible"
  })
}

control "foundational_security_ecs_3" {
  title         = "3 ECS task definitions should not share the host's process namespace"
  description   = "This control checks if Amazon ECS task definitions are configured to share a host’s process namespace with its containers. The control fails if the task definition shares the host's process namespace with the containers running on it."
  severity      = "high"
  query         = query.ecs_task_definition_no_host_pid_mode
  documentation = file("./foundational_security/docs/foundational_security_ecs_3.md")

  tags = merge(local.foundational_security_ecs_common_tags, {
    foundational_security_item_id  = "ecs_3"
    foundational_security_category = "resource_configuration"
  })
}

control "foundational_security_ecs_4" {
  title         = "4 ECS containers should run as non-privileged"
  description   = "This control checks if the privileged parameter in the container definition of Amazon ECS Task Definitions is set to true. The control fails if this parameter is equal to true."
  severity      = "high"
  query         = query.ecs_task_definition_container_non_privileged
  documentation = file("./foundational_security/docs/foundational_security_ecs_4.md")

  tags = merge(local.foundational_security_ecs_common_tags, {
    foundational_security_item_id  = "ecs_4"
    foundational_security_category = "root_user_access_restrictions"
  })
}

control "foundational_security_ecs_5" {
  title         = "5 ECS containers should be limited to read-only access to root filesystems"
  description   = "This control checks if ECS containers are limited to read-only access to mounted root filesystems. This control fails if the ReadonlyRootFilesystem parameter in the container definition of ECS task definitions is set to false."
  severity      = "high"
  query         = query.ecs_task_definition_container_readonly_root_filesystem
  documentation = file("./foundational_security/docs/foundational_security_ecs_5.md")

  tags = merge(local.foundational_security_ecs_common_tags, {
    foundational_security_item_id  = "ecs_5"
    foundational_security_category = "secure_access_management"
  })
}

control "foundational_security_ecs_8" {
  title         = "8 Secrets should not be passed as container environment variables"
  description   = "This control checks if the key value of any variables in the environment parameter of container definitions includes AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, or ECS_ENGINE_AUTH_DATA. This control fails if a single environment variable in any container definition equals AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, or ECS_ENGINE_AUTH_DATA. This control does not cover environmental variables passed in from other locations such as Amazon S3."
  severity      = "high"
  query         = query.ecs_task_definition_container_environment_no_secret
  documentation = file("./foundational_security/docs/foundational_security_ecs_8.md")

  tags = merge(local.foundational_security_ecs_common_tags, {
    foundational_security_item_id  = "ecs_8"
    foundational_security_category = "credentials_not_hard_coded"
  })
}

control "foundational_security_ecs_9" {
  title         = "9 ECS task definitions should have a logging configuration"
  description   = "This control checks if the latest active Amazon ECS task definition has a logging configuration specified. The control fails if the task definition doesn't have the logConfiguration property defined or if the value for logDriver is null in at least one container definition."
  severity      = "high"
  query         = query.ecs_task_definition_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_ecs_9.md")

  tags = merge(local.foundational_security_ecs_common_tags, {
    foundational_security_item_id  = "ecs_9"
    foundational_security_category = "logging"
  })
}

control "foundational_security_ecs_10" {
  title         = "10 Fargate services should run on the latest Fargate platform version"
  description   = "This control checks if Amazon ECS Fargate services are running the latest Fargate platform version. This control fails if the platform version is not the latest."
  severity      = "medium"
  query         = query.ecs_service_fargate_using_latest_platform_version
  documentation = file("./foundational_security/docs/foundational_security_ecs_10.md")

  tags = merge(local.foundational_security_ecs_common_tags, {
    foundational_security_item_id  = "ecs_10"
    foundational_security_category = "vulnerability_patch_and_version_management"
  })
}

control "foundational_security_ecs_12" {
  title         = "12 ECS clusters should have Container Insights enabled"
  description   = "This control checks if ECS clusters use Container Insights. This control fails if Container Insights are not set up for a cluster."
  severity      = "medium"
  query         = query.ecs_cluster_container_insights_enabled
  documentation = file("./foundational_security/docs/foundational_security_ecs_12.md")

  tags = merge(local.foundational_security_ecs_common_tags, {
    foundational_security_item_id  = "ecs_12"
    foundational_security_category = "logging"
  })
}
