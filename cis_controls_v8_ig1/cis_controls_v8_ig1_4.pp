benchmark "cis_controls_v8_ig1_4" {
  title       = "4 Secure Configuration of Enterprise Assets and Software"
  description = "Establish and maintain the secure configuration of enterprise assets (end-user devices, including portable and mobile; network devices; non-computing/IoT devices; and servers) and software (operating systems and applications)."
  children = [
    benchmark.cis_controls_v8_ig1_4_1,
    benchmark.cis_controls_v8_ig1_4_6,
    benchmark.cis_controls_v8_ig1_4_7
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_4_1" {
  title       = "4.1 Establish and Maintain a Secure Configuration Process"
  description = "Establish and maintain a secure configuration process for enterprise assets (end-user devices, including portable and mobile, non-computing/IoT devices, and servers) and software (operating systems and applications). Review and update documentation annually, or when significant enterprise changes occur that could impact this Safeguard."
  children = [
    control.account_part_of_organizations,
    control.cloudtrail_security_trail_enabled,
    control.ebs_volume_unused,
    control.ec2_stopped_instance_30_days,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_association_compliant
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_4_6" {
  title       = "4.6 Securely Manage Enterprise Assets and Software"
  description = "Securely manage enterprise assets and software. Example implementations include managing configuration through version-controlled-infrastructure-as-code and accessing administrative interfaces over secure network protocols, such as Secure Shell (SSH) and Hypertext Transfer Protocol Secure (HTTPS). Do not use insecure management protocols, such as Telnet (Teletype Network) and HTTP, unless operationally essential."
  children = [
    control.account_part_of_organizations,
    control.autoscaling_group_with_lb_use_health_check,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.ebs_attached_volume_encryption_enabled,
    control.ebs_encryption_by_default_enabled,
    control.ec2_instance_iam_profile_attached,
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.kms_cmk_rotation_enabled,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_enforces_ssl,
    control.s3_bucket_logging_enabled,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_flow_logs_enabled,
    control.vpc_security_group_restrict_ingress_ssh_all
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_4_7" {
  title       = "4.7 Manage Default Accounts on Enterprise Assets and Software"
  description = "Manage default accounts on enterprise assets and software, such as root, administrator, and other pre-configured vendor accounts. Example implementations can include: disabling default accounts or making them unusable."
  children = [
    control.iam_root_user_mfa_enabled,
    control.vpc_security_group_restrict_ingress_ssh_all
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}