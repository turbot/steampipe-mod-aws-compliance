benchmark "rbi_nbfc_cyber_2026_v" {
  title       = "Chapter V - Requirements for NBFCs (Middle Layer and above excluding CICs)"
  description = "IT governance, IT and information security risk management, baseline cybersecurity and resilience requirements, and information systems audit for NBFCs-Middle Layer, Upper Layer and Top Layer, excluding Core Investment Companies."

  children = [
    benchmark.rbi_nbfc_cyber_2026_v_92,
    benchmark.rbi_nbfc_cyber_2026_v_109,
    benchmark.rbi_nbfc_cyber_2026_v_111,
    benchmark.rbi_nbfc_cyber_2026_v_113,
    benchmark.rbi_nbfc_cyber_2026_v_114,
    benchmark.rbi_nbfc_cyber_2026_v_115,
    benchmark.rbi_nbfc_cyber_2026_v_118,
    benchmark.rbi_nbfc_cyber_2026_v_125,
    benchmark.rbi_nbfc_cyber_2026_v_133
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "V"
  })
}

benchmark "rbi_nbfc_cyber_2026_v_92" {
  title       = "92. Outdated and Unsupported Software"
  description = "For seamless continuity of business operations, an NBFC shall avoid using outdated and unsupported hardware or software and shall monitor software end-of-support (EOS) dates and Annual Maintenance Contract (AMC) dates of IT hardware on an ongoing basis."

  children = [
    control.ecs_service_fargate_using_latest_platform_version,
    control.eks_cluster_with_latest_kubernetes_version,
    control.lambda_function_use_latest_runtime,
    control.opensearch_domain_updated_with_latest_service_software_version,
    control.sagemaker_notebook_instance_supported_platform_version
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "92"
  })
}

benchmark "rbi_nbfc_cyber_2026_v_109" {
  title       = "109. Audit Trails"
  description = "The NBFC shall ensure that every IT application / system that can access or affect critical or sensitive information has necessary audit logging capabilities and provides audit trails."

  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_log_group_retention_period_365,
    control.codebuild_project_logging_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.es_domain_logs_to_cloudwatch,
    control.opensearch_domain_logs_to_cloudwatch,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_audit_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "109"
  })
}

benchmark "rbi_nbfc_cyber_2026_v_111" {
  title       = "111. Monitoring of Audit Trails and System Logs"
  description = "The NBFC shall put in place a system for regularly monitoring the audit trails and system logs to detect, understand or recover from any unauthorised activity or attack."

  children = [
    control.cloudtrail_trail_integrated_with_logs,
    control.guardduty_enabled,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_root_login,
    control.log_metric_filter_unauthorized_api,
    control.securityhub_enabled
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "111"
  })
}

benchmark "rbi_nbfc_cyber_2026_v_113" {
  title       = "113. Need-based Access"
  description = "Access to information assets shall be allowed only where a valid business need exists."

  children = [
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "113"
  })
}

benchmark "rbi_nbfc_cyber_2026_v_114" {
  title       = "114. Supervision of Elevated Access"
  description = "The NBFC shall closely supervise personnel with elevated system access entitlements with all their system activities logged and periodically reviewed."

  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.log_metric_filter_iam_policy,
    control.log_metric_filter_root_login
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "114"
  })
}

benchmark "rbi_nbfc_cyber_2026_v_115" {
  title       = "115. Multi-factor Authentication for Privileged Users"
  description = "The NBFC, based on the risk assessment, shall implement two-factor or multi-factor authentication for privileged users of (i) critical information systems and (ii) for critical activities."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_with_administrator_access_mfa_enabled
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "115"
  })
}

benchmark "rbi_nbfc_cyber_2026_v_118" {
  title       = "118. Cryptographic Controls"
  description = "The key length, algorithms, cipher suites, and applicable protocols used in transmission channels, processing of data, and authentication purposes shall be strong. The NBFC shall adopt internationally accepted and published standards that are not deprecated / demonstrated to be insecure / vulnerable, and the configurations involved in implementing such controls shall be compliant with extant laws and regulatory instructions."

  children = [
    control.cloudfront_distribution_no_deprecated_ssl_protocol,
    control.cloudfront_distribution_use_secure_cipher,
    control.elb_listener_use_secure_ssl_cipher,
    control.elb_tls_listener_protocol_version,
    control.es_domain_encrypted_using_tls_1_2,
    control.opensearch_domain_uses_latest_tls_security_policy,
    control.s3_bucket_enforces_ssl
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "118"
  })
}

benchmark "rbi_nbfc_cyber_2026_v_125" {
  title       = "125. Remediation of Vulnerabilities"
  description = "The NBFC shall ensure to fix the identified vulnerabilities and associated risks in a time-bound manner by undertaking requisite corrective measures and ensure that the compliance is sustained to avoid recurrence of known vulnerabilities such as those available in Common Vulnerabilities and Exposures (CVE) database."

  children = [
    control.ec2_instance_ssm_managed,
    control.guardduty_finding_archived,
    control.rds_db_instance_automatic_minor_version_upgrade_enabled,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "125"
  })
}

benchmark "rbi_nbfc_cyber_2026_v_133" {
  title       = "133. Backup and Restoration of Data"
  description = "The NBFC shall backup data and periodically restore such backed-up data to check its usability. The integrity of such backup data shall be preserved along with securing it from unauthorised access."

  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_manual_deletion_disabled,
    control.backup_recovery_point_min_retention_35_days,
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_in_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.s3_bucket_cross_region_replication_enabled
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "133"
  })
}
