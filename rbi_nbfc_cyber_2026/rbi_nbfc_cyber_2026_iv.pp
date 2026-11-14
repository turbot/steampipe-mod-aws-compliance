benchmark "rbi_nbfc_cyber_2026_iv" {
  title       = "Chapter IV - Requirements for NBFCs (Base Layer with asset size ₹500 crore and above)"
  description = "IT governance, IT policy, information security and cybersecurity, IT operations, information systems audit, business continuity planning and disaster recovery, and IT services outsourcing requirements for NBFCs-Base Layer with asset size ₹500 crore and above."

  children = [
    benchmark.rbi_nbfc_cyber_2026_iv_21_1,
    benchmark.rbi_nbfc_cyber_2026_iv_21_3,
    benchmark.rbi_nbfc_cyber_2026_iv_21_7,
    benchmark.rbi_nbfc_cyber_2026_iv_21_8,
    benchmark.rbi_nbfc_cyber_2026_iv_21_9,
    benchmark.rbi_nbfc_cyber_2026_iv_23,
    benchmark.rbi_nbfc_cyber_2026_iv_26,
    benchmark.rbi_nbfc_cyber_2026_iv_44_7,
    benchmark.rbi_nbfc_cyber_2026_iv_44_8,
    benchmark.rbi_nbfc_cyber_2026_iv_44_9,
    benchmark.rbi_nbfc_cyber_2026_iv_59_3
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "IV"
  })
}

benchmark "rbi_nbfc_cyber_2026_iv_21_1" {
  title       = "21(1) Identification and Classification of Information Assets"
  description = "The NBFC shall maintain detailed inventory of information assets with distinct and clear identification of the assets."

  children = [
    control.ebs_volume_unused,
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.ecr_repository_tag_immutability_enabled
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "21(1)"
  })
}

benchmark "rbi_nbfc_cyber_2026_iv_21_3" {
  title       = "21(3) Role-based Access Control"
  description = "Access to information shall be based on well-defined user roles such as system administrator, user manager, and application owner. The NBFC shall avoid dependence on one or few persons for a particular job. There shall be clear delegation of authority for right to upgrade / change user profiles and permissions, and changes to key business parameters (e.g., interest rates), and the same shall also be documented."

  children = [
    control.ec2_instance_iam_profile_attached,
    control.efs_access_point_enforce_root_directory,
    control.efs_access_point_enforce_user_identity,
    control.emr_cluster_kerberos_enabled,
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "21(3)"
  })
}

benchmark "rbi_nbfc_cyber_2026_iv_21_7" {
  title       = "21(7) Incident Management"
  description = "The NBFC shall define what constitutes an information security incident and implement processes for preventing, detecting, analysing, and responding to such incidents."

  children = [
    control.elb_application_lb_waf_enabled,
    control.guardduty_enabled,
    control.guardduty_finding_archived,
    control.securityhub_enabled,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "21(7)"
  })
}

benchmark "rbi_nbfc_cyber_2026_iv_21_8" {
  title       = "21(8) Audit Trails"
  description = "The NBFC shall ensure that audit trails exist for IT assets satisfying its business requirements including regulatory and legal requirements, facilitating audit, serving as forensic evidence when required, and assisting in dispute resolution. The NBFC shall ensure to record any unauthorised user activity in the audit trail."

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
    rbi_nbfc_cyber_2026_item_id = "21(8)"
  })
}

benchmark "rbi_nbfc_cyber_2026_iv_21_9" {
  title       = "21(9) Public Key Infrastructure (PKI)"
  description = "The NBFC shall increase the usage of PKI to ensure confidentiality of data, access control, data integrity, authentication, and non-repudiation."

  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.elb_application_lb_http_drop_invalid_header_enabled,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.opensearch_domain_https_required,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "21(9)"
  })
}

benchmark "rbi_nbfc_cyber_2026_iv_23" {
  title       = "23. Vulnerability Management"
  description = "The NBFC shall establish a vulnerability management process to identify, manage, and eliminate the vulnerabilities in the information systems. The vulnerability management aspects shall be covered in the cybersecurity policy."

  children = [
    control.ec2_instance_ssm_managed,
    control.guardduty_finding_archived,
    control.rds_db_instance_automatic_minor_version_upgrade_enabled,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "23"
  })
}

benchmark "rbi_nbfc_cyber_2026_iv_26" {
  title       = "26. Cyber Crisis Management Plan"
  description = "The NBFC shall take effective measures to prevent cyber-attacks and to promptly detect any cyber-intrusions so as to respond / recover / contain the fallout. The NBFC shall be well prepared to face emerging cyber-threats such as 'zero-day' attacks, remote access threats, and targeted attacks."

  children = [
    control.ec2_instance_ssm_managed,
    control.guardduty_enabled,
    control.guardduty_finding_archived,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "26"
  })
}

benchmark "rbi_nbfc_cyber_2026_iv_44_7" {
  title       = "44(7) Fraud Analysis"
  description = "Fraud analysis - Suspicious transaction analysis, embezzlement, theft or suspected money-laundering, misappropriation of assets, and manipulation of financial records. The regulatory requirement of reporting fraud to RBI shall be system driven."

  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "44(7)"
  })
}

benchmark "rbi_nbfc_cyber_2026_iv_44_8" {
  title       = "44(8) Capacity and Performance Analysis"
  description = "Capacity and performance analysis of IT security systems."

  children = [
    control.autoscaling_group_with_lb_use_health_check,
    control.dynamodb_table_auto_scaling_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.ec2_instance_ebs_optimized,
    control.elastic_beanstalk_enhanced_health_reporting_enabled,
    control.elb_application_gateway_network_lb_multiple_az_configured,
    control.elb_application_lb_deletion_protection_enabled,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.elb_classic_lb_multiple_az_configured,
    control.guardduty_enabled,
    control.lambda_function_concurrent_execution_limit_configured,
    control.lambda_function_dead_letter_queue_configured,
    control.lambda_function_multiple_az_configured,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.rds_db_instance_deletion_protection_enabled,
    control.rds_db_instance_multiple_az_enabled,
    control.s3_bucket_object_lock_enabled,
    control.securityhub_enabled,
    control.vpc_vpn_tunnel_up
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "44(8)"
  })
}

benchmark "rbi_nbfc_cyber_2026_iv_44_9" {
  title       = "44(9) Incident Reporting"
  description = "Incident reporting, their impact and steps taken for non-recurrence of such events in the future."

  children = [
    control.guardduty_enabled,
    control.guardduty_finding_archived
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "44(9)"
  })
}

benchmark "rbi_nbfc_cyber_2026_iv_59_3" {
  title       = "59(3) Backup Sites"
  description = "The NBFC shall consider the need to put in place necessary backup sites for its critical business systems and data centres."

  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_min_retention_35_days,
    control.dynamodb_table_auto_scaling_enabled,
    control.dynamodb_table_in_backup_plan,
    control.ebs_volume_in_backup_plan,
    control.ec2_instance_protected_by_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.fsx_file_system_protected_by_backup_plan,
    control.kms_cmk_rotation_enabled,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.s3_bucket_cross_region_replication_enabled
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "59(3)"
  })
}
