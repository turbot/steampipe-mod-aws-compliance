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

