locals {
  all_controls_autoscaling_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/AutoScaling"
  })
}

benchmark "all_controls_autoscaling" {
  title       = "Auto Scaling"
  description = "This section contains recommendations for configuring Auto Scaling resources."
  children = [
    control.autoscaling_ec2_launch_configuration_no_sensitive_data,
    control.autoscaling_group_multiple_az_configured,
    control.autoscaling_group_no_suspended_process,
    control.autoscaling_group_propagate_tags_to_ec2_instance_enabled,
    control.autoscaling_group_uses_ec2_launch_template,
    control.autoscaling_group_with_lb_use_health_check,
    control.autoscaling_launch_config_hop_limit,
    control.autoscaling_launch_config_public_ip_disabled,
    control.autoscaling_launch_config_requires_imdsv2,
    control.autoscaling_use_multiple_instance_types_in_multiple_az
  ]

  tags = merge(local.all_controls_autoscaling_common_tags, {
    type = "Benchmark"
  })
}
