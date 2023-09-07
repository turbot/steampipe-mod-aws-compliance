locals {
  all_controls_ec2_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/EC2"
  })
}

benchmark "all_controls_ec2" {
  title       = "EC2"
  description = "This section contains recommendations for configuring EC2 resources."
  children = [
    control.ec2_ami_restrict_public_access,
    control.ec2_ebs_default_encryption_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.ec2_instance_ebs_optimized,
    control.ec2_instance_iam_profile_attached,
    control.ec2_instance_in_vpc,
    control.ec2_instance_no_amazon_key_pair,
    control.ec2_instance_no_high_level_finding_in_inspector_scan,
    control.ec2_instance_no_launch_wizard_security_group,
    control.ec2_instance_not_publicly_accessible,
    control.ec2_instance_not_use_multiple_enis,
    control.ec2_instance_protected_by_backup_plan,
    control.ec2_instance_publicly_accessible_iam_profile_attached,
    control.ec2_instance_termination_protection_enabled,
    control.ec2_instance_user_data_no_secrets,
    control.ec2_instance_uses_imdsv2,
    control.ec2_instance_virtualization_type_no_paravirtual,
    control.ec2_launch_template_not_publicly_accessible,
    control.ec2_stopped_instance_30_days,
    control.ec2_transit_gateway_auto_cross_account_attachment_disabled
  ]

  tags = merge(local.all_controls_ec2_common_tags, {
    type = "Benchmark"
  })
}
