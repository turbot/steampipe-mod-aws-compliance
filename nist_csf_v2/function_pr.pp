benchmark "nist_csf_v2_pr" {
  title       = "Protect (PR)"
  description = "Safeguards to manage the organization's cybersecurity risks are used."
  children = [
    benchmark.nist_csf_v2_pr_aa,
    benchmark.nist_csf_v2_pr_ds,
    benchmark.nist_csf_v2_pr_ps,
    benchmark.nist_csf_v2_pr_ir
  ]
}

benchmark "nist_csf_v2_pr_aa" {
  title       = "Identity Management, Authentication, and Access Control (PR.AA)"
  description = "Access to physical and logical assets is limited to authorized users, services, and hardware and managed commensurate with the assessed risk of unauthorized access."
  children = [
    benchmark.nist_csf_v2_pr_aa_01,
    benchmark.nist_csf_v2_pr_aa_02,
    benchmark.nist_csf_v2_pr_aa_03,
    benchmark.nist_csf_v2_pr_aa_04,
    benchmark.nist_csf_v2_pr_aa_05
  ]
}

benchmark "nist_csf_v2_pr_aa_01" {
  title       = "PR.AA-01"
  description = "Identities and credentials for authorized users, services, and hardware are managed by the organization."
  children = [
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_all_policy_no_service_wild_card,
    control.iam_custom_policy_unattached_no_star_star,
    control.iam_group_user_role_no_inline_policies,
    control.iam_custom_managed_policy_attached_to_role,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_access_key_age_90,
    control.iam_user_access_key_unused_45,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.iam_user_with_administrator_access_mfa_enabled
  ]
}

benchmark "nist_csf_v2_pr_aa_02" {
  title       = "PR.AA-02"
  description = "Identities are proofed and bound to credentials based on the context of interactions."
  children = [
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_all_policy_no_service_wild_card,
    control.iam_custom_policy_unattached_no_star_star,
    control.iam_group_user_role_no_inline_policies,
    control.iam_custom_managed_policy_attached_to_role,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_with_administrator_access_mfa_enabled
  ]
}

benchmark "nist_csf_v2_pr_aa_03" {
  title       = "PR.AA-03"
  description = "Users, services, and hardware are authenticated."
  children = [
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_all_policy_no_service_wild_card,
    control.iam_custom_policy_unattached_no_star_star,
    control.iam_group_user_role_no_inline_policies,
    control.iam_custom_managed_policy_attached_to_role,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_with_administrator_access_mfa_enabled,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_root_login
  ]
}

benchmark "nist_csf_v2_pr_aa_04" {
  title       = "PR.AA-04"
  description = "Identity assertions are protected, conveyed, and verified."
  children = [
    control.acm_certificate_expires_30_days,
    control.acm_certificate_no_failed_certificate,
    control.acm_certificate_no_pending_validation_certificate,
    control.acm_certificate_not_expired,
    control.acm_certificate_rsa_key_length_2048_bits_or_greater,
    control.acm_certificate_transparency_logging_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_with_administrator_access_mfa_enabled,
    control.kms_cmk_policy_prohibit_public_access,
    control.kms_cmk_rotation_enabled,
    control.kms_key_decryption_restricted_in_iam_customer_managed_policy,
    control.kms_key_decryption_restricted_in_iam_inline_policy
  ]
}

benchmark "nist_csf_v2_pr_aa_05" {
  title       = "PR.AA-05"
  description = "Access permissions, entitlements, and authorizations are defined in a policy, managed, enforced, and reviewed, and incorporate the principles of least privilege and separation of duties."
  children = [
    control.iam_all_policy_no_service_wild_card,
    control.iam_custom_policy_unattached_no_star_star,
    control.iam_group_user_role_no_inline_policies,
    control.iam_custom_managed_policy_attached_to_role,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_user_access_key_age_90,
    control.iam_user_access_key_unused_45,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.iam_user_with_administrator_access_mfa_enabled,
    control.log_metric_filter_iam_policy
  ]
}

benchmark "nist_csf_v2_pr_ds" {
  title       = "Data Security (PR.DS)"
  description = "Data are managed consistent with the organization’s risk strategy to protect the confidentiality, integrity, and availability of information."
  children = [
    benchmark.nist_csf_v2_pr_ds_01,
    benchmark.nist_csf_v2_pr_ds_02,
    benchmark.nist_csf_v2_pr_ds_11
  ]
}

benchmark "nist_csf_v2_pr_ds_01" {
  title       = "PR.DS-01"
  description = "The confidentiality, integrity, and availability of data-at-rest are protected."
  children = [
    control.athena_workgroup_encryption_at_rest_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.ebs_attached_volume_encryption_enabled,
    control.ebs_encryption_by_default_enabled,
    control.ebs_snapshot_encryption_enabled,
    control.ebs_volume_encryption_at_rest_enabled,
    control.ecs_cluster_encryption_at_rest_enabled,
    control.efs_file_system_encrypt_data_at_rest,
    control.efs_file_system_encrypted_with_cmk,
    control.kms_cmk_policy_prohibit_public_access,
    control.kms_cmk_rotation_enabled,
    control.kms_key_decryption_restricted_in_iam_customer_managed_policy,
    control.kms_key_decryption_restricted_in_iam_inline_policy,
    control.neptune_db_cluster_encryption_at_rest_enabled,
    control.neptune_db_cluster_snapshot_encryption_at_rest_enabled,
    control.rds_db_cluster_encryption_at_rest_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_enforces_ssl,
    control.sns_topic_encrypted_at_rest,
    control.sqs_queue_encrypted_at_rest,
    control.sqs_queue_encrypted_with_kms_cmk,
    control.ssm_parameter_encryption_enabled
  ]
}

benchmark "nist_csf_v2_pr_ds_02" {
  title       = "PR.DS-02"
  description = "The confidentiality, integrity, and availability of data-in-transit are protected."
  children = [
    control.acm_certificate_expires_30_days,
    control.acm_certificate_no_failed_certificate,
    control.acm_certificate_no_pending_validation_certificate,
    control.acm_certificate_not_expired,
    control.acm_certificate_rsa_key_length_2048_bits_or_greater,
    control.acm_certificate_transparency_logging_enabled,
    control.cloudfront_distribution_use_custom_ssl_certificate,
    control.directory_service_certificate_expires_90_days,
    control.efs_file_system_enforces_ssl,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.elb_listener_use_secure_ssl_cipher,
    control.elb_network_lb_tls_listener_security_policy_configured,
    control.elb_tls_listener_protocol_version,
    control.emr_cluster_encryption_in_transit_enabled,
    control.es_domain_encrypted_using_tls_1_2,
    control.msk_cluster_encryption_in_transit_with_tls_enabled,
    control.opensearch_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled
  ]
}

benchmark "nist_csf_v2_pr_ds_11" {
  title       = "PR.DS-11"
  description = "Backups of data are created, protected, maintained, and tested."
  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_plan_region_configured,
    control.backup_recovery_point_encryption_enabled,
    control.backup_recovery_point_manual_deletion_disabled,
    control.backup_recovery_point_min_retention_35_days,
    control.backup_report_plan_configured,
    control.backup_vault_region_configured,
    control.ebs_volume_in_backup_plan,
    control.ebs_volume_protected_by_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.efs_file_system_protected_by_backup_plan,
    control.fsx_file_system_protected_by_backup_plan,
    control.neptune_db_cluster_automated_backup_enabled,
    control.neptune_db_cluster_copy_tags_to_snapshot_enabled
  ]
}

benchmark "nist_csf_v2_pr_ps" {
  title       = "Platform Security (PR.PS)"
  description = "The hardware, software (e.g., firmware, operating systems, applications), and services of physical and virtual platforms are managed consistent with the organization’s risk strategy to protect their confidentiality, integrity, and availability."
  children = [
    benchmark.nist_csf_v2_pr_ps_01,
    benchmark.nist_csf_v2_pr_ps_02,
    benchmark.nist_csf_v2_pr_ps_03,
    benchmark.nist_csf_v2_pr_ps_04,
    benchmark.nist_csf_v2_pr_ps_05,
    benchmark.nist_csf_v2_pr_ps_06
  ]
}

benchmark "nist_csf_v2_pr_ps_01" {
  title       = "PR.PS-01"
  description = "Configuration management practices are established and applied."
  children = [
    control.autoscaling_group_with_lb_use_health_check,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.directory_service_directory_snapshots_limit_2,
    control.dlm_ebs_snapshot_lifecycle_policy_enabled,
    control.ec2_instance_ssm_managed,
    control.networkfirewall_firewall_policy_rule_group_not_empty,
    control.networkfirewall_stateless_rule_group_not_empty,
    control.secretsmanager_secret_automatic_rotation_lambda_enabled,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant
  ]
}

benchmark "nist_csf_v2_pr_ps_02" {
  title       = "PR.PS-02"
  description = "Software is maintained, replaced, and removed commensurate with risk."
  children = [
    control.autoscaling_group_no_suspended_process,
    control.ec2_instance_ssm_managed,
    control.redshift_cluster_automatic_upgrade_major_versions_enabled,
    control.redshift_cluster_maintenance_settings_check,
    control.secretsmanager_secret_automatic_rotation_lambda_enabled,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant
  ]
}

benchmark "nist_csf_v2_pr_ps_03" {
  title       = "PR.PS-03"
  description = "Hardware is maintained, replaced, and removed commensurate with risk."
  children = [
    control.directory_service_directory_snapshots_limit_2,
    control.drs_job_enabled,
    control.ebs_attached_volume_delete_on_termination_enabled,
    control.ebs_volume_snapshot_exists,
    control.ebs_volume_unused,
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant
  ]
}

benchmark "nist_csf_v2_pr_ps_04" {
  title       = "PR.PS-04"
  description = "Log records are generated and made available for continuous monitoring."
  children = [
    control.appsync_graphql_api_field_level_logging_enabled,
    control.cloudfront_distribution_logging_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.cloudwatch_log_group_retention_period_365,
    control.codebuild_project_logging_enabled,
    control.codebuild_project_s3_logs_encryption_enabled,
    control.ecs_task_definition_logging_enabled,
    control.elastic_beanstalk_environment_logs_to_cloudwatch,
    control.es_domain_audit_logging_enabled,
    control.es_domain_error_logging_enabled,
    control.es_domain_logs_to_cloudwatch,
    control.log_group_encryption_at_rest_enabled,
    control.log_metric_filter_bucket_policy,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_iam_policy,
    control.log_metric_filter_root_login,
    control.neptune_db_cluster_audit_logging_enabled,
    control.networkfirewall_firewall_logging_enabled,
    control.route53_zone_query_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.s3_bucket_object_logging_enabled
  ]
}

benchmark "nist_csf_v2_pr_ps_05" {
  title       = "PR.PS-05"
  description = "Installation and execution of unauthorized software are prevented."
  children = [
    control.autoscaling_ec2_launch_configuration_no_sensitive_data,
    control.ec2_instance_ssm_managed,
    control.ecs_task_definition_container_non_privileged,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.ecs_task_definition_no_host_pid_mode,
    control.ecs_task_definition_no_root_user,
    control.ecs_task_definition_user_for_host_mode_check,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant
  ]
}

benchmark "nist_csf_v2_pr_ps_06" {
  title       = "PR.PS-06"
  description = "Secure software development practices are integrated, and their performance is monitored throughout the software development life cycle."
  children = [
    control.ecr_repository_image_scan_on_push_enabled,
    control.ecr_repository_lifecycle_policy_configured,
    control.ecr_repository_prohibit_public_access,
    control.ecr_repository_tag_immutability_enabled,
    control.ecs_task_definition_container_environment_no_secret,
    control.secretsmanager_secret_automatic_rotation_lambda_enabled
  ]
}

benchmark "nist_csf_v2_pr_ir" {
  title       = "Technology Infrastructure Resilience (PR.IR)"
  description = "Security architectures are managed with the organization's risk strategy to protect asset confidentiality, integrity, and availability, and organizational resilience."
  children = [
    benchmark.nist_csf_v2_pr_ir_01,
    benchmark.nist_csf_v2_pr_ir_02,
    benchmark.nist_csf_v2_pr_ir_03,
    benchmark.nist_csf_v2_pr_ir_04
  ]
}

benchmark "nist_csf_v2_pr_ir_01" {
  title       = "PR.IR-01"
  description = "Networks and environments are protected from unauthorized logical access and usage."
  children = [
    control.account_part_of_organizations,
    control.iam_all_policy_no_service_wild_card,
    control.iam_policy_no_star_star,
    control.networkfirewall_firewall_in_vpc,
    control.networkfirewall_firewall_policy_default_stateless_action_check_fragmented_packets,
    control.networkfirewall_firewall_policy_default_stateless_action_check_full_packets,
    control.networkfirewall_firewall_policy_rule_group_not_empty,
    control.networkfirewall_stateless_rule_group_not_empty,
    control.sns_topic_policy_prohibit_cross_account_access,
    control.sns_topic_policy_prohibit_public_access,
    control.sns_topic_policy_prohibit_publishing_access,
    control.sns_topic_policy_prohibit_subscription_access,
    control.vpc_configured_to_use_vpc_endpoints,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]
}

benchmark "nist_csf_v2_pr_ir_02" {
  title       = "PR.IR-02"
  description = "The organization’s technology assets are protected from environmental threats."
  children = [
    control.autoscaling_group_multiple_az_configured,
    control.backup_plan_region_configured,
    control.backup_vault_region_configured,
    control.directory_service_directory_snapshots_limit_2,
    control.drs_job_enabled,
    control.ebs_attached_volume_delete_on_termination_enabled,
    control.ebs_volume_in_backup_plan,
    control.ebs_volume_protected_by_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.efs_file_system_protected_by_backup_plan,
    control.fsx_file_system_protected_by_backup_plan,
    control.neptune_db_cluster_automated_backup_enabled,
    control.neptune_db_cluster_copy_tags_to_snapshot_enabled,
    control.redshift_cluster_enhanced_vpc_routing_enabled,
    control.s3_bucket_cross_region_replication_enabled
  ]
}

benchmark "nist_csf_v2_pr_ir_03" {
  title       = "PR.IR-03"
  description = "Mechanisms are implemented to achieve resilience requirements in normal and adverse situations."
  children = [
    control.autoscaling_group_multiple_az_configured,
    control.autoscaling_group_with_lb_use_health_check,
    control.backup_plan_min_retention_35_days,
    control.backup_plan_region_configured,
    control.backup_recovery_point_encryption_enabled,
    control.backup_recovery_point_manual_deletion_disabled,
    control.backup_recovery_point_min_retention_35_days,
    control.backup_report_plan_configured,
    control.backup_vault_region_configured,
    control.neptune_db_cluster_automated_backup_enabled,
    control.neptune_db_cluster_copy_tags_to_snapshot_enabled,
    control.neptune_db_cluster_deletion_protection_enabled,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.s3_bucket_cross_region_replication_enabled
  ]
}

benchmark "nist_csf_v2_pr_ir_04" {
  title       = "PR.IR-04"
  description = "Adequate resource capacity to ensure availability is maintained."
  children = [
    control.autoscaling_group_multiple_az_configured,
    control.autoscaling_group_no_suspended_process,
    control.autoscaling_group_propagate_tags_to_ec2_instance_enabled,
    control.autoscaling_group_uses_ec2_launch_template,
    control.autoscaling_group_with_lb_use_health_check,
    control.cloudwatch_alarm_action_enabled_check,
    control.cloudwatch_alarm_action_enabled,
    control.directory_service_directory_snapshots_limit_2,
    control.ebs_attached_volume_delete_on_termination_enabled,
    control.ebs_volume_in_backup_plan,
    control.ebs_volume_protected_by_backup_plan,
    control.redshift_cluster_enhanced_vpc_routing_enabled
  ]
}
