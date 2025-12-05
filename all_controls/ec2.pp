locals {
  all_controls_ec2_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/EC2"
  })
}

benchmark "all_controls_ec2" {
  title       = "EC2"
  description = "This section contains recommendations for configuring EC2 resources."
  children = [
    control.ec2_ami_ebs_encryption_enabled,
    control.ec2_ami_not_older_than_90_days,
    control.ec2_ami_restrict_public_access,
    control.ec2_client_vpn_endpoint_client_connection_logging_enabled,
    control.ec2_ebs_default_encryption_enabled,
    control.ec2_instance_attached_ebs_volume_delete_on_termination_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.ec2_instance_ebs_optimized,
    control.ec2_instance_iam_profile_attached,
    control.ec2_instance_in_vpc,
    control.ec2_instance_no_amazon_key_pair,
    control.ec2_instance_no_high_level_finding_in_inspector_scan,
    control.ec2_instance_no_iam_passrole_and_lambda_invoke_function_access,
    control.ec2_instance_no_iam_role_attached_with_credentials_exposure_access,
    control.ec2_instance_no_iam_role_with_alter_critical_s3_permissions_configuration,
    control.ec2_instance_no_iam_role_with_cloud_log_tampering_access,
    control.ec2_instance_no_iam_role_with_data_destruction_access,
    control.ec2_instance_no_iam_role_with_database_management_write_access,
    control.ec2_instance_no_iam_role_with_defense_evasion_impact_of_aws_security_services_access,
    control.ec2_instance_no_iam_role_with_destruction_kms_access,
    control.ec2_instance_no_iam_role_with_destruction_rds_access,
    control.ec2_instance_no_iam_role_with_elastic_ip_hijacking_access,
    control.ec2_instance_no_iam_role_with_management_level_access,
    control.ec2_instance_no_iam_role_with_new_group_creation_with_attached_policy_access,
    control.ec2_instance_no_iam_role_with_new_role_creation_with_attached_policy_access,
    control.ec2_instance_no_iam_role_with_new_user_creation_with_attached_policy_access,
    control.ec2_instance_no_iam_role_with_org_write_access,
    control.ec2_instance_no_iam_role_with_privilege_escalation_risk_access,
    control.ec2_instance_no_iam_role_with_security_group_write_access,
    control.ec2_instance_no_iam_role_with_write_access_to_resource_based_policies,
    control.ec2_instance_no_iam_role_with_write_permission_on_critical_s3_configuration,
    control.ec2_instance_no_iam_with_write_level_access,
    control.ec2_instance_no_launch_wizard_security_group,
    control.ec2_instance_not_older_than_180_days,
    control.ec2_instance_not_publicly_accessible,
    control.ec2_instance_not_use_multiple_enis,
    control.ec2_instance_protected_by_backup_plan,
    control.ec2_instance_publicly_accessible_iam_profile_attached,
    control.ec2_instance_termination_protection_enabled,
    control.ec2_instance_user_data_no_secrets,
    control.ec2_instance_uses_imdsv2,
    control.ec2_instance_using_iam_instance_role,
    control.ec2_instance_virtualization_type_no_paravirtual,
    control.ec2_launch_template_default_version_uses_imdsv2,
    control.ec2_launch_template_ebs_volume_encrypted,
    control.ec2_launch_template_not_publicly_accessible,
    control.ec2_network_inteface_source_destination_check_enabled,
    control.ec2_network_interface_unused,
    control.ec2_spot_fleet_request_with_launch_parameter_ebs_encryption_enabled,
    control.ec2_stopped_instance_30_days,
    control.ec2_stopped_instance_90_days,
    control.ec2_transit_gateway_auto_cross_account_attachment_disabled
  ]

  tags = merge(local.all_controls_ec2_common_tags, {
    type = "Benchmark"
  })
}
