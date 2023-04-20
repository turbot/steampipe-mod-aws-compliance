locals {
  conformance_pack_ecs_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/ECS"
  })
}

control "ecs_cluster_encryption_at_rest_enabled" {
  title       = "ECS clusters encryption at rest should be enabled"
  description = "This control checks whether ECS Clustes have encryption at rest enabled. The check fails if encryption at rest is not enabled as sensitive data should be protected."
  query       = query.ecs_cluster_encryption_at_rest_enabled

  tags = merge(local.conformance_pack_ecs_common_tags, {
    other_checks = "true"
  })
}

control "ecs_cluster_instance_in_vpc" {
  title       = "ECS cluster instances should be in a VPC"
  description = "Deploy AWS ECS cluster instance within an Amazon Virtual Private Cloud (Amazon VPC) for a secure communication between a instance and other services within the Amazon VPC."
  query       = query.ecs_cluster_instance_in_vpc

  tags = merge(local.conformance_pack_ecs_common_tags, {
    other_checks = "true"
  })
}

control "ecs_cluster_no_registered_container_instance" {
  title       = "At least one instance should be registered with ECS cluster"
  description = "This control ensures that at least one container instance is registered with an ECS cluster."
  query       = query.ecs_cluster_no_registered_container_instance

  tags = merge(local.conformance_pack_ecs_common_tags, {
    other_checks = "true"
  })
}

control "ecs_service_load_balancer_attached" {
  title       = "ECS services should be attached to a load balancer"
  description = "ECS service can be configured to use Elastic Load Balancing to distribute traffic evenly across the tasks in your service. It is recommended to use Application Load Balancers for your Amazon ECS services so that you can take advantage of these latest features, unless your service requires a feature that is only available with Network Load Balancers or Classic Load Balancers."
  query       = query.ecs_service_load_balancer_attached

  tags = merge(local.conformance_pack_ecs_common_tags, {
    other_checks = "true"
  })
}

control "ecs_task_definition_user_for_host_mode_check" {
  title       = "ECS task definition container definitions should be checked for host mode"
  description = "Check if Amazon Elastic Container Service (Amazon ECS) task definition with host networking mode has 'privileged' or 'user' container definitions.The rule is non compliant for task definitions with host network mode and container definitions of privileged=false or empty and user=root or empty."
  query       = query.ecs_task_definition_user_for_host_mode_check

  tags = merge(local.conformance_pack_ecs_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
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

control "ecs_cluster_container_insights_enabled" {
  title       = "ECS clusters should have container insights enabled"
  description = "This control checks if ECS clusters use Container Insights. This control fails if Container Insights are not set up for a cluster."
  query       = query.ecs_cluster_container_insights_enabled

  tags = merge(local.conformance_pack_ecs_common_tags, {
    nist_csf = "true"
  })
}

control "ecs_task_definition_container_non_privileged" {
  title       = "ECS containers should run as non-privileged"
  description = "This control checks if the privileged parameter in the container definition of Amazon ECS Task Definitions is set to true. The control fails if this parameter is equal to true."
  query       = query.ecs_task_definition_container_non_privileged

  tags = merge(local.conformance_pack_ecs_common_tags, {
    nist_csf = "true"
  })
}

control "ecs_task_definition_container_readonly_root_filesystem" {
  title       = "ECS containers should be limited to read-only access to root filesystems"
  description = "This control checks if ECS containers are limited to read-only access to mounted root filesystems. This control fails if the ReadonlyRootFilesystem parameter in the container definition of ECS task definitions is set to false."
  query       = query.ecs_task_definition_container_readonly_root_filesystem

  tags = merge(local.conformance_pack_ecs_common_tags, {
    nist_csf = "true"
  })
}

control "ecs_task_definition_container_environment_no_secret" {
  title       = "ECS task definition containers should not have secrets passed as environment variables"
  description = "This control checks if the key value of any variables in the environment parameter of container definitions includes AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, or ECS_ENGINE_AUTH_DATA. This control fails if a single environment variable in any container definition equals AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, or ECS_ENGINE_AUTH_DATA. This control does not cover environmental variables passed in from other locations such as Amazon S3."
  query       = query.ecs_task_definition_container_environment_no_secret

  tags = merge(local.conformance_pack_ecs_common_tags, {
    nist_csf = "true"
  })
}

control "ecs_task_definition_no_host_pid_mode" {
  title       = "ECS task definitions should not share the host's process namespace"
  description = "This control checks if Amazon ECS task definitions are configured to share a host's process namespace with its containers. The control fails if the task definition shares the host's process namespace with the containers running on it."
  query       = query.ecs_task_definition_no_host_pid_mode

  tags = merge(local.conformance_pack_ecs_common_tags, {
    nist_csf = "true"
  })
}

control "ecs_service_fargate_using_latest_platform_version" {
  title       = "ECS fargate services should run on the latest fargate platform version"
  description = "This control checks if Amazon ECS Fargate services are running the latest Fargate platform version. This control fails if the platform version is not the latest."
  query       = query.ecs_service_fargate_using_latest_platform_version

  tags = merge(local.conformance_pack_ecs_common_tags, {
    nist_csf = "true"
  })
}

query "ecs_cluster_encryption_at_rest_enabled" {
  sql = <<-EOQ
    with unencrypted_volumes as (
      select
        distinct cluster_arn
      from
        aws_ecs_container_instance as i,
        aws_ec2_instance as e,
        jsonb_array_elements(block_device_mappings) as b,
        aws_ebs_volume as v
      where
        i.ec2_instance_id = e.instance_id
        and b -> 'Ebs' ->> 'VolumeId' = v.volume_id
        and not v.encrypted
    )
    select
      c.cluster_arn as resource,
      case
        when c.registered_container_instances_count = 0 then 'skip'
        when v.cluster_arn is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when c.registered_container_instances_count = 0 then title || ' has no container instance registered.'
        when v.cluster_arn is not null then c.title || ' encryption at rest disabled.'
        else c.title || ' encryption at rest enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
    from
      aws_ecs_cluster as c
      left join unencrypted_volumes as v on v.cluster_arn = c.cluster_arn;
  EOQ
}

query "ecs_cluster_instance_in_vpc" {
  sql = <<-EOQ
    select
      c.arn as resource,
      case
        when i.vpc_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when i.vpc_id is null then c.title || ' not in VPC.'
        else c.title || ' in VPC.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
    from
      aws_ecs_container_instance as c
      left join aws_ec2_instance as i on c.ec2_instance_id = i.instance_id;
  EOQ
}

query "ecs_cluster_no_registered_container_instance" {
  sql = <<-EOQ
    select
      cluster_arn as resource,
      case
        when registered_container_instances_count = 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when registered_container_instances_count = 0 then title || ' has no container instance registered.'
        else title || ' has ' || registered_container_instances_count || ' container instance(s) registered.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ecs_cluster;
  EOQ
}

query "ecs_service_load_balancer_attached" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when jsonb_array_length(load_balancers) = 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when jsonb_array_length(load_balancers) = 0 then title || ' has no load balancer attached.'
        else title || ' has ' || jsonb_array_length(load_balancers) || ' load balancer(s) attached.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ecs_service;
  EOQ
}

query "ecs_task_definition_user_for_host_mode_check" {
  sql = <<-EOQ
    with host_network_task_definition as (
      select
        distinct task_definition_arn as arn
      from
        aws_ecs_task_definition,
        jsonb_array_elements(container_definitions) as c
      where
        network_mode = 'host'
        and
          (c ->> 'Privileged' is not null
            and c ->> 'Privileged' <> 'false'
          )
        and
          ( c ->> 'User' is not null
          and c ->> 'User' <> 'root'
          )
    )
    select
      a.task_definition_arn as resource,
      case
        when a.network_mode is null or a.network_mode <> 'host' then 'skip'
        when b.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.network_mode is null or a.network_mode <> 'host' then a.title || ' not host network mode.'
        when b.arn is not null then a.title || ' have secure host network mode.'
        else a.title || ' not have secure host network mode.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ecs_task_definition as a
      left join host_network_task_definition as b on a.task_definition_arn = b.arn;
  EOQ
}

query "ecs_task_definition_logging_enabled" {
  sql = <<-EOQ
    with task_definitions_logging_enabled as (
      select
        distinct task_definition_arn as arn
      from
        aws_ecs_task_definition,
        jsonb_array_elements(container_definitions) as c
      where
        c ->> 'LogConfiguration' is not null
    )
    select
      a.task_definition_arn as resource,
      case
        when b.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.arn is not null then a.title || ' logging enabled.'
        else a.title || ' logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ecs_task_definition as a
      left join task_definitions_logging_enabled as b on a.task_definition_arn = b.arn;
  EOQ
}

query "ecs_cluster_container_insights_enabled" {
  sql = <<-EOQ
    select
      cluster_arn as resource,
      case
        when s ->> 'Name' = 'containerInsights' and s ->> 'Value' = 'enabled' then 'ok'
        else 'alarm'
      end as status,
      case
        when s ->> 'Name' = 'containerInsights' and s ->> 'Value' = 'enabled' then title || ' Container Insights enabled.'
        else title || ' Container Insights disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ecs_cluster as c,
      jsonb_array_elements(settings) as s;
  EOQ
}

query "ecs_task_definition_container_non_privileged" {
  sql = <<-EOQ
    with privileged_container_definition as (
      select
        distinct task_definition_arn as arn
      from
        aws_ecs_task_definition,
        jsonb_array_elements(container_definitions) as c
      where
        c ->> 'Privileged' = 'true'
    )
    select
      d.task_definition_arn as resource,
      case
        when c.arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when c.arn is null then d.title || ' does not have elevated privileges.'
        else d.title || ' has elevated privileges.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ecs_task_definition as d
      left join privileged_container_definition as c on d.task_definition_arn = c.arn;
  EOQ
}

query "ecs_task_definition_container_readonly_root_filesystem" {
  sql = <<-EOQ
    with privileged_container_definition as (
      select
        distinct task_definition_arn as arn
      from
        aws_ecs_task_definition,
        jsonb_array_elements(container_definitions) as c
      where
        c ->> 'ReadonlyRootFilesystem' = 'true'
    )
    select
      d.task_definition_arn as resource,
      case
        when c.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when c.arn is not null then d.title || ' containers limited to read-only access to root filesystems.'
        else d.title || ' containers not limited to read-only access to root filesystems.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ecs_task_definition as d
      left join privileged_container_definition as c on d.task_definition_arn = c.arn;
  EOQ
}

query "ecs_task_definition_container_environment_no_secret" {
  sql = <<-EOQ
    with definitions_with_secret_environment_variable as (
      select
        distinct task_definition_arn as arn
      from
        aws_ecs_task_definition,
        jsonb_array_elements(container_definitions) as c,
        jsonb_array_elements( c -> 'Environment') as e,
            jsonb_array_elements(
        case jsonb_typeof(c -> 'Secrets')
            when 'array' then (c -> 'Secrets')
            else null end
        ) as s
      where
        e ->> 'Name' like any (array ['AWS_ACCESS_KEY_ID', 'AWS_SECRET_ACCESS_KEY','ECS_ENGINE_AUTH_DATA'])
        or s ->> 'Name' like any (array ['AWS_ACCESS_KEY_ID', 'AWS_SECRET_ACCESS_KEY','ECS_ENGINE_AUTH_DATA'])
    )
    select
      d.task_definition_arn as resource,
      case
        when e.arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when e.arn is null then d.title || ' container environment variables does not have secrets.'
        else d.title || ' container environment variables have secrets.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ecs_task_definition as d
      left join definitions_with_secret_environment_variable as e on d.task_definition_arn = e.arn;
  EOQ
}

query "ecs_task_definition_no_host_pid_mode" {
  sql = <<-EOQ
    select
      task_definition_arn as resource,
      case
        when pid_mode = 'host' then 'alarm'
        else 'ok'
      end as status,
      case
        when pid_mode = 'host' then title || ' shares the host process namespace.'
        else title || ' does not share the host process namespace.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ecs_task_definition;
  EOQ
}

query "ecs_service_fargate_using_latest_platform_version" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when launch_type <> 'FARGATE' then 'skip'
        when platform_version = 'LATEST' then 'ok'
        else 'alarm'
      end as status,
      case
        when launch_type <> 'FARGATE' then title || ' is ' || launch_type || ' service.'
        when platform_version = 'LATEST' then title || ' running on the latest fargate platform version.'
        else title || ' not running on the latest fargate platform version.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ecs_service;
  EOQ
}

# Non-Config rule query

query "ecs_cluster_container_instance_agent_connected" {
  sql = <<-EOQ
    with unconnected_agent_instance as (
      select
        distinct cluster_arn
      from
        aws_ecs_container_instance
      where
        agent_connected = false and status = 'ACTIVE'
    )
    select
      c.cluster_arn as resource,
      case
        when c.registered_container_instances_count = 0 then 'skip'
        when i.cluster_arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when c.registered_container_instances_count = 0 then title || ' has no container instance registered.'
        when i.cluster_arn is null then title || ' container instance has connected agent.'
        else title || ' container instance is either draining or has unconnected agents.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ecs_cluster as c
      left join unconnected_agent_instance as i on c.cluster_arn = i.cluster_arn;
  EOQ
}

query "ecs_service_not_publicly_accessible" {
  sql = <<-EOQ
    with service_awsvpc_mode_task_definition as (
      select
        a.service_name as service_name,
        b.task_definition_arn as task_definition
      from
        aws_ecs_service as a
        left join aws_ecs_task_definition as b on a.task_definition = b.task_definition_arn
      where
        b.network_mode = 'awsvpc'
    )
    select
      a.arn as resource,
      case
        when b.service_name is null then 'skip'
        when network_configuration -> 'AwsvpcConfiguration' ->> 'AssignPublicIp' = 'DISABLED' then 'ok'
        else 'alarm'
      end as status,
      case
        when b.service_name is null then a.title || ' task definition not host network mode.'
        when network_configuration -> 'AwsvpcConfiguration' ->> 'AssignPublicIp' = 'DISABLED' then a.title || ' not publicly accessible.'
        else a.title || ' publicly accessible.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ecs_service as a
      left join service_awsvpc_mode_task_definition as b on a.service_name = b.service_name;
  EOQ
}
