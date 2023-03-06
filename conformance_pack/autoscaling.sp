locals {
  conformance_pack_autoscaling_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/AutoScaling"
  })
}

control "autoscaling_group_with_lb_use_health_check" {
  title       = "Auto Scaling groups with a load balancer should use health checks"
  description = "The Elastic Load Balancer (ELB) health checks for Amazon Elastic Compute Cloud (Amazon EC2) Auto Scaling groups support maintenance of adequate capacity and availability."
  query       = query.autoscaling_group_with_lb_use_health_check

  tags = merge(local.conformance_pack_autoscaling_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    hipaa                  = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
  })
}

control "autoscaling_launch_config_public_ip_disabled" {
  title       = "Auto Scaling launch config public IP should be disabled"
  description = "Ensure if Amazon EC2 Auto Scaling groups have public IP addresses enabled through Launch Configurations. This rule is non compliant if the Launch Configuration for an Auto Scaling group has AssociatePublicIpAddress set to 'true'."
  query       = query.autoscaling_launch_config_public_ip_disabled

  tags = merge(local.conformance_pack_autoscaling_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    nist_800_53_rev_5      = "true"
    rbi_cyber_security     = "true"
  })
}

control "autoscaling_group_no_suspended_process" {
  title       = "Auto Scaling groups should not have any suspended processes"
  description = "Ensure that there are no Auto Scaling Groups (ASGs) with suspended processes provisioned in your AWS account in order to avoid disrupting the auto scaling workflow."
  query       = query.autoscaling_group_no_suspended_processe

  tags = merge(local.conformance_pack_autoscaling_common_tags, {
    other_checks = "true"
  })
}

query "autoscaling_group_with_lb_use_health_check" {
  sql = <<-EOQ
    select
    -- Required Columns
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
    -- Additional Dimensions
    ${local.tag_dimensions_sql}
    ${local.common_dimensions_sql}
  from
    aws_ec2_autoscaling_group;
  EOQ
}

query "autoscaling_launch_config_public_ip_disabled" {
  sql = <<-EOQ
    select
      -- Required Columns
      launch_configuration_arn as resource,
      case
        when associate_public_ip_address then 'alarm'
        else 'ok'
      end as status,
      case
        when associate_public_ip_address then title || ' public IP enabled.'
        else title || ' public IP disabled.'
      end as reason
      -- Additional Dimensions
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_launch_configuration;
  EOQ
}

query "autoscaling_group_no_suspended_process" {
  sql = <<-EOQ
    select
      -- Required Columns
      autoscaling_group_arn as resource,
      case
        when suspended_processes is null then 'ok'
        else 'alarm'
      end as status,
      case
        when suspended_processes is null then title || ' has no suspended process.'
        else title || ' has suspended process.'
      end as reason
      -- Additional Dimensions
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_autoscaling_group;
  EOQ
}
