locals {
  conformance_pack_autoscaling_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/AutoScaling"
  })
}

control "autoscaling_launch_config_requires_imdsv2" {
  title       = "Auto Scaling group should configure EC2 instances to require Instance Metadata Service Version 2 (IMDSv2)"
  description = "This control checks whether IMDSv2 is enabled on all instances launched by Amazon EC2 Auto Scaling groups. The control fails if the Instance Metadata Service (IMDS) version is not included in the launch configuration or if both IMDSv1 and IMDSv2 are enabled."
  query       = query.autoscaling_launch_config_requires_imdsv2

  tags = merge(local.conformance_pack_autoscaling_common_tags, {
    nist_csf     = "true"
    pci_dss_v321 = "true"
  })
}

control "autoscaling_group_with_lb_use_health_check" {
  title       = "Auto Scaling groups with a load balancer should use health checks"
  description = "The Elastic Load Balancer (ELB) health checks for Amazon Elastic Compute Cloud (Amazon EC2) Auto Scaling groups support maintenance of adequate capacity and availability."
  query       = query.autoscaling_group_with_lb_use_health_check

  tags = merge(local.conformance_pack_autoscaling_common_tags, {
    cis_controls_v8_ig1                    = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
  })
}

control "autoscaling_launch_config_public_ip_disabled" {
  title       = "Auto Scaling launch config public IP should be disabled"
  description = "Ensure if Amazon EC2 Auto Scaling groups have public IP addresses enabled through Launch Configurations. This rule is non compliant if the Launch Configuration for an Auto Scaling group has AssociatePublicIpAddress set to 'true'."
  query       = query.autoscaling_launch_config_public_ip_disabled

  tags = merge(local.conformance_pack_autoscaling_common_tags, {
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
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
  })
}

control "autoscaling_group_no_suspended_process" {
  title       = "Auto Scaling groups should not have any suspended processes"
  description = "Ensure that there are no Auto Scaling Groups (ASGs) with suspended processes provisioned in your AWS account in order to avoid disrupting the auto scaling workflow."
  query       = query.autoscaling_group_no_suspended_process

  tags = merge(local.conformance_pack_autoscaling_common_tags, {
    other_checks = "true"
  })
}

control "autoscaling_group_multiple_az_configured" {
  title       = "EC2 auto scaling groups should cover multiple availability zones"
  description = "This control checks whether an Amazon EC2 Auto Scaling group spans multiple availability zones. The control fails if an auto scaling group does not span multiple availability zones."
  query       = query.autoscaling_group_multiple_az_configured

  tags = merge(local.conformance_pack_autoscaling_common_tags, {
    nist_csf = "true"
  })
}

control "autoscaling_use_multiple_instance_types_in_multiple_az" {
  title       = "EC2 auto scaling groups should use multiple instance types in multiple availability zones"
  description = "This control checks whether an Amazon EC2 Auto Scaling group uses multiple instance types. The control fails if the Auto Scaling group has only one instance type defined."
  query       = query.autoscaling_use_multiple_instance_types_in_multiple_az

  tags = merge(local.conformance_pack_autoscaling_common_tags, {
    nist_csf = "true"
  })
}

control "autoscaling_launch_config_hop_limit" {
  title       = "EC2 auto scaling group launch configurations should not have metadata response hop limit greater than 1"
  description = "This control checks the number of network hops that a metadata token can travel. The control fails if the metadata response hop limit is greater than 1."
  query       = query.autoscaling_launch_config_hop_limit

  tags = merge(local.conformance_pack_autoscaling_common_tags, {
    nist_csf = "true"
  })
}

control "autoscaling_ec2_launch_configuration_no_sensitive_data" {
  title       = "EC2 auto scaling group launch configurations user data should not have any sensitive data"
  description = "Ensure that sensitive information is not included in the user data of the launch configuration. It is recommended to utilize Secrets Manager as an alternative for securely managing sensitive data."
  query       = query.autoscaling_ec2_launch_configuration_no_sensitive_data

  tags = merge(local.conformance_pack_autoscaling_common_tags, {
    other_checks = "true"
  })
}

query "autoscaling_launch_config_requires_imdsv2" {
  sql = <<-EOQ
    select
      launch_configuration_arn as resource,
      case
        when metadata_options_http_tokens = 'required' then 'ok'
        else 'alarm'
      end as status,
      case
        when metadata_options_http_tokens = 'required' then title || ' configured to use Instance Metadata Service Version 2 (IMDSv2).'
        else title || ' not configured to use Instance Metadata Service Version 2 (IMDSv2).'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_ec2_launch_configuration;
  EOQ
}

query "autoscaling_group_with_lb_use_health_check" {
  sql = <<-EOQ
    select
      autoscaling_group_arn as resource,
      case
        when load_balancer_names is null and target_group_arns is null then 'alarm'
        when health_check_type != 'ELB' then 'alarm'
        else 'ok'
      end as status,
      case
        when load_balancer_names is null and target_group_arns is null then title || ' not associated with a load balancer.'
        when health_check_type != 'ELB' then title || ' does not use ELB health check.'
        else title || ' uses ELB health check.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_autoscaling_group;
  EOQ
}

query "autoscaling_launch_config_public_ip_disabled" {
  sql = <<-EOQ
    select
      launch_configuration_arn as resource,
      case
        when associate_public_ip_address then 'alarm'
        else 'ok'
      end as status,
      case
        when associate_public_ip_address then title || ' public IP enabled.'
        else title || ' public IP disabled.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_ec2_launch_configuration;
  EOQ
}

query "autoscaling_group_no_suspended_process" {
  sql = <<-EOQ
    select
      autoscaling_group_arn as resource,
      case
        when suspended_processes is null then 'ok'
        else 'alarm'
      end as status,
      case
        when suspended_processes is null then title || ' has no suspended process.'
        else title || ' has suspended process.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_autoscaling_group;
  EOQ
}

query "autoscaling_group_multiple_az_configured" {
  sql = <<-EOQ
    select
      autoscaling_group_arn as resource,
      case
        when jsonb_array_length(availability_zones) > 1 then 'ok'
        else 'alarm'
      end as status,
      title || ' has ' || jsonb_array_length(availability_zones) || ' availability zone(s).' as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_autoscaling_group;
  EOQ
}

query "autoscaling_use_multiple_instance_types_in_multiple_az" {
  sql = <<-EOQ
    with autoscaling_groups as (
      select
        autoscaling_group_arn,
        title,
        mixed_instances_policy_launch_template_overrides,
        region,
        tags,
        _ctx,
        account_id
    from
        aws_ec2_autoscaling_group
    ),
    distinct_instance_types_count as (
      select
        autoscaling_group_arn,
        count(distinct(e -> 'InstanceType')) as distinct_instance_types
    from
        autoscaling_groups,
        jsonb_array_elements(mixed_instances_policy_launch_template_overrides) as e
    group by
        autoscaling_group_arn,
        title,
        mixed_instances_policy_launch_template_overrides
    )
    select
      a.autoscaling_group_arn as resource,
      case
        when b.distinct_instance_types > 1 then 'ok'
        else 'alarm'
      end as status,
      case
        when b.distinct_instance_types > 1 then title || ' uses ' || b.distinct_instance_types || ' instance types.'
        else title || ' does not use multiple instance types.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
    from
      autoscaling_groups as a
      left join distinct_instance_types_count as b on a.autoscaling_group_arn = b.autoscaling_group_arn;
  EOQ
}

query "autoscaling_launch_config_hop_limit" {
  sql = <<-EOQ
    select
      launch_configuration_arn as resource,
      case
        when metadata_options_put_response_hop_limit is null then 'ok'
        when metadata_options_put_response_hop_limit > 1 then 'alarm'
        else 'ok'
      end as status,
      case
        --If you do not specify a value, the hop limit default is 1.
        when metadata_options_put_response_hop_limit is null then title || ' metadata response hop limit set to default.'
        else title || ' has a metadata response hop limit of ' || metadata_options_put_response_hop_limit || '.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_ec2_launch_configuration;
  EOQ
}

query "autoscaling_ec2_launch_configuration_no_sensitive_data" {
  sql = <<-EOQ
    select
      launch_configuration_arn as resource,
      case
        when
          user_data like any (array [ '%pass%', '%secret%', '%token%', '%key%' ])
          or user_data ~ '(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]' then 'alarm'
        else 'ok'
      end as status,
      case
        when
          user_data like any (array [ '%pass%', '%secret%', '%token%', '%key%' ])
          or user_data ~ '(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]' then title || ' has potential secret patterns in user data.'
        else title || ' does not contain secret patterns in user data.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_ec2_launch_configuration;
  EOQ
}


# Non-Config rule query

query "autoscaling_group_uses_ec2_launch_template" {
  sql = <<-EOQ
    select
      autoscaling_group_arn as resource,
      case
        when launch_template_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when launch_template_id is not null then title || ' using an EC2 launch template.'
        else title || ' not using an EC2 launch template.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_autoscaling_group;
  EOQ
}
