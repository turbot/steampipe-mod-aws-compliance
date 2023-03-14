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
    cis_controls_v8_ig1    = "true"
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
      -- Required Columns
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
      -- Additional Dimensions
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
      -- Required Columns
      a.task_definition_arn as resource,
      case
        when b.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.arn is not null then a.title || ' logging enabled.'
        else a.title || ' logging disabled.'
      end as reason
      -- Additional Dimensions
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ecs_task_definition as a
      left join task_definitions_logging_enabled as b on a.task_definition_arn = b.arn;
  EOQ
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
      -- Required Columns
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
      -- Additional Dimensions
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
      -- Required Columns
      c.arn as resource,
      case
        when i.vpc_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when i.vpc_id is null then c.title || ' not in VPC.'
        else c.title || ' in VPC.'
      end as reason
      -- Additional Dimensions
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
      -- Required Columns
      cluster_arn as resource,
      case
        when registered_container_instances_count = 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when registered_container_instances_count = 0 then title || ' has no container instance registered.'
        else title || ' has ' || registered_container_instances_count || ' container instance(s) registered.'
      end as reason
      -- Additional Dimensions
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ecs_cluster;
  EOQ
}

query "ecs_service_load_balancer_attached" {
  sql = <<-EOQ
    select
      -- Required Columns
      arn as resource,
      case
        when jsonb_array_length(load_balancers) = 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when jsonb_array_length(load_balancers) = 0 then title || ' has no load balancer attached.'
        else title || ' has ' || jsonb_array_length(load_balancers) || ' load balancer(s) attached.'
      end as reason
      -- Additional Dimensions
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ecs_service;
  EOQ
}