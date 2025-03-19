locals {
  pci_dss_v400_appendix_a3_common_tags = merge(local.pci_dss_v400_common_tags, {
    control_set = "3"
  })
}

benchmark "pci_dss_v400_appendix_a3" {
  title = "Appendix A3: Designated Entities Supplemental Validation (DESV) (19)"

  children = [
    benchmark.pci_dss_v400_appendix_a3_3,
    benchmark.pci_dss_v400_appendix_a3_4,
    benchmark.pci_dss_v400_appendix_a3_5,
  ]

  tags = local.pci_dss_v400_appendix_a3_common_tags
}

benchmark "pci_dss_v400_appendix_a3_3" {
  title = "A3.3: Designated Entities Supplemental Validation (DESV) (19)."

  children = [
    benchmark.pci_dss_v400_appendix_a3_3_1,
  ]

  tags = merge(local.pci_dss_v400_appendix_a3_common_tags, {
    pci_dss_v400_item_id = "A3.3"
  })
}

benchmark "pci_dss_v400_appendix_a3_3_1" {
  title       = "A3.3.1: PCI DSS is incorporated into business-as-usual (BAU) activities."
  description = "Failures of critical security control systems are detected, alerted, and addressed promptly, including but not limited to failure of: Network security controls IDS/IPS FIM Anti-malware solutions Physical access controls Logical access controls Audit logging mechanisms Segmentation controls (if used) Automated audit log review mechanisms. This bullet is a best practice until its effective date; refer to Applicability Notes below for details. Automated code review tools (if used). This bullet is a best practice until its effective date; refer to Applicability Notes below for details. PCI DSS Reference: Requirements 1-12 Applicability Notes The bullets above (for automated log review mechanisms and automated code review tools (if used)) are best practices until 31 March 2025, after which they will be required as part of Requirement A3.3.1 and must be fully considered during a PCI DSS assessment."

  children = [
    control.apigateway_rest_api_stage_xray_tracing_enabled,
    control.cloudformation_stack_notifications_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.log_metric_filter_bucket_policy,
    control.log_metric_filter_cloudtrail_configuration,
    control.log_metric_filter_config_configuration,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_disable_or_delete_cmk,
    control.log_metric_filter_iam_policy,
    control.log_metric_filter_network_acl,
    control.log_metric_filter_network_gateway,
    control.log_metric_filter_root_login,
    control.log_metric_filter_route_table,
    control.log_metric_filter_security_group,
    control.log_metric_filter_unauthorized_api,
    control.log_metric_filter_vpc,
    control.s3_bucket_event_notifications_enabled,
    control.securityhub_enabled,
    control.sns_topic_notification_delivery_status_enabled,
    control.wafv2_rule_group_logging_enabled
  ]

  tags = merge(local.pci_dss_v400_appendix_a3_common_tags, {
    pci_dss_v400_item_id = "A3.3.1"
  })
}

benchmark "pci_dss_v400_appendix_a3_4" {
  title = "A3.4: Designated Entities Supplemental Validation (DESV) (19)."

  children = [
    benchmark.pci_dss_v400_appendix_a3_4_1,
  ]

  tags = merge(local.pci_dss_v400_appendix_a3_common_tags, {
    pci_dss_v400_item_id = "A3.3"
  })
}

benchmark "pci_dss_v400_appendix_a3_4_1" {
  title       = "A3.4.1: Logical access to the cardholder data environment is controlled and managed."
  description = "User accounts and access privileges to in-scope system components are reviewed at least once every six months to ensure user accounts and access privileges remain appropriate based on job function, and that all access is authorized."

  children = [
    control.backup_recovery_point_manual_deletion_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.docdb_cluster_snapshot_restrict_public_access,
    control.ebs_snapshot_not_publicly_restorable,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.efs_access_point_enforce_root_directory,
    control.efs_access_point_enforce_user_identity,
    control.emr_account_public_access_blocked,
    control.iam_group_not_empty,
    control.iam_user_unused_credentials_90,
    control.lambda_function_restrict_public_access,
    control.neptune_db_cluster_snapshot_prohibit_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_access_point_restrict_public_access,
    control.s3_bucket_mfa_delete_enabled,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.secretsmanager_secret_unused_90_day,
    control.ssm_document_prohibit_public_access,
  ]

  tags = merge(local.pci_dss_v400_appendix_a3_common_tags, {
    pci_dss_v400_item_id = "A3.4.1"
  })
}

benchmark "pci_dss_v400_appendix_a3_5" {
  title = "A3.5: Designated Entities Supplemental Validation (DESV) (19)."

  children = [
    benchmark.pci_dss_v400_appendix_a3_5_1,
  ]

  tags = merge(local.pci_dss_v400_appendix_a3_common_tags, {
    pci_dss_v400_item_id = "A3.5"
  })
}

benchmark "pci_dss_v400_appendix_a3_5_1" {
  title = "A3.5.1: PCI DSS scope is documented and validated."

  children = [
    control.apigateway_rest_api_stage_xray_tracing_enabled,
    control.cloudformation_stack_notifications_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.log_metric_filter_bucket_policy,
    control.log_metric_filter_cloudtrail_configuration,
    control.log_metric_filter_config_configuration,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_disable_or_delete_cmk,
    control.log_metric_filter_iam_policy,
    control.log_metric_filter_network_acl,
    control.log_metric_filter_network_gateway,
    control.log_metric_filter_root_login,
    control.log_metric_filter_route_table,
    control.log_metric_filter_security_group,
    control.log_metric_filter_unauthorized_api,
    control.log_metric_filter_vpc,
    control.s3_bucket_event_notifications_enabled,
    control.securityhub_enabled,
    control.sns_topic_notification_delivery_status_enabled,
    control.wafv2_rule_group_logging_enabled
  ]

  tags = merge(local.pci_dss_v400_appendix_a3_common_tags, {
    pci_dss_v400_item_id = "A3.5.1"
  })
}
