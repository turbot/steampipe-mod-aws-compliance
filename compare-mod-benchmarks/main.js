const _ = require("lodash");
const fs = require('fs-extra');
const json2csv = require('json-2-csv');

function main() {
  const frameworkName = process.argv[2];

  // Read in files and remove duplicates in case of multiple regions or
  // aggregate connections
  const frameworksFile = _.uniqWith(fs.readJsonSync(`./output/${frameworkName}_frameworks.json`), _.isEqual);
  const benchmarksFile = _.uniqWith(fs.readJsonSync(`./output/${frameworkName}_benchmarks.json`), _.isEqual);

  const csvOptions = {
    "checkSchemaDifferences": true
  }

  // Compare Audit Manager frameworks to Steampipe benchmarks to find missing
  // controls
  var diff = _.differenceWith(frameworksFile, benchmarksFile, compareFrameworkToBenchmark)
  sortedDiff = _.sortBy(diff, ["steampipe_benchmark", "source_type", "steampipe_control"])
  console.log(`Missing controls: ${sortedDiff.length} (results in output/${frameworkName}_missing_controls.csv)` )

  // The CSV will be written with the Audit Manager framework control name
  json2csv.json2csv(sortedDiff, (err, csv) => {
    if (err) throw err;
    fs.outputFile(`./output/${frameworkName}_missing_controls.csv`, csv, err => {
      if (err) throw err;
    })
    //console.log(csv);
  }, csvOptions);

  // Compare Steampipe benchmarks to Audit Manager frameworks to find extra
  // controls
  diff = _.differenceWith(benchmarksFile, frameworksFile, compareBenchmarkToFramework)
  sortedDiff = _.sortBy(diff, ["steampipe_benchmark", "source_type", "steampipe_control"])
  console.log(`Extra controls: ${sortedDiff.length} (results in output/${frameworkName}_extra_controls.csv)` )

  // The CSV will be written with the Steampipe control name
  json2csv.json2csv(sortedDiff, (err, csv) => {
    if (err) throw err;
    fs.outputFile(`./output/${frameworkName}_extra_controls.csv`, csv, err => {
      if (err) throw err;
    })
    //console.log(csv);
  }, csvOptions);

}

// AWS Config rule to Steampipe control name mapping
const configRules = {
  "access_keys_rotated": "iam_user_access_key_age_90",
  "account_part_of_organizations": "account_part_of_organizations",
  "acm_certificate_expiration_check": "acm_certificate_expires_30_days",
  "alb_http_drop_invalid_header_enabled": "elb_application_lb_drop_http_headers",
  "alb_http_to_https_redirection_check": "elb_application_lb_redirect_http_request_to_https",
  "alb_waf_enabled": "elb_application_lb_waf_enabled",
  "api_gw_associated_with_waf": "apigateway_stage_use_waf_web_acl",
  "api_gw_cache_enabled_and_encrypted": "apigateway_stage_cache_encryption_at_rest_enabled",
  "api_gw_execution_logging_enabled": "apigateway_stage_logging_enabled",
  "api_gw_ssl_enabled": "apigateway_rest_api_stage_use_ssl_certificate",
  "aurora_resources_protected_by_backup_plan": "rds_db_cluster_aurora_protected_by_backup_plan",
  "autoscaling_group_elb_healthcheck_required": "autoscaling_group_with_lb_use_health_check",
  "backup_plan_min_frequency_and_min_retention_check": "backup_plan_min_retention_35_days",
  "backup_recovery_point_encrypted": "backup_recovery_point_encryption_enabled",
  "backup_recovery_point_manual_deletion_disabled": "backup_recovery_point_manual_deletion_disabled",
  "backup_recovery_point_minimum_retention_check": "backup_recovery_point_min_retention_35_days",
  "beanstalk_enhanced_health_reporting_enabled": "elastic_beanstalk_enhanced_health_reporting_enabled",
  "cloudformation_stack_notification_check": "cloudformation_stack_notifications_enabled",
  "cloudfront_security_policy_check": "cloudfront_distribution_use_secure_cipher",
  "cloudfront_viewer_policy_https": "cloudfront_distribution_encryption_in_transit_enabled",
  "cloudtrail_s3_dataevents_enabled": "cloudtrail_s3_data_events_enabled",
  "cloudtrail_security_trail_enabled": "cloudtrail_security_trail_enabled",
  "cloudwatch_alarm_action_check": "cloudwatch_alarm_action_enabled",
  "cloudwatch_alarm_action_enabled_check": "cloudwatch_alarm_action_enabled",
  "cloudwatch_log_group_encrypted": "log_group_encryption_at_rest_enabled",
  "cloud_trail_cloud_watch_logs_enabled": "cloudtrail_trail_integrated_with_logs",
  "cloud_trail_enabled": "cloudtrail_trail_enabled",
  "cloud_trail_encryption_enabled": "cloudtrail_trail_logs_encrypted_with_kms_cmk",
  "cloud_trail_log_file_validation_enabled": "cloudtrail_trail_validation_enabled",
  "cmk_backing_key_rotation_enabled": "kms_cmk_rotation_enabled",
  "codebuild_project_envvar_awscred_check": "codebuild_project_plaintext_env_variables_no_sensitive_aws_values",
  "codebuild_project_source_repo_url_check": "codebuild_project_source_repo_oauth_configured",
  "cw_loggroup_retention_period_check": "cloudwatch_log_group_retention_period_365",
  "dax_encryption_enabled": "dax_cluster_encryption_at_rest_enabled",
  "db_instance_backup_enabled": "rds_db_instance_backup_enabled",
  "dms_replication_not_public": "dms_replication_instance_not_publicly_accessible",
  "dynamodb_autoscaling_enabled": "dynamodb_table_auto_scaling_enabled",
  "dynamodb_in_backup_plan": "dynamodb_table_in_backup_plan",
  "dynamodb_pitr_enabled": "dynamodb_table_point_in_time_recovery_enabled",
  "dynamodb_resources_protected_by_backup_plan": "dynamodb_table_protected_by_backup_plan",
  "dynamodb_table_encrypted_kms": "dynamodb_table_encrypted_with_kms",
  "dynamodb_table_encryption_enabled": "dynamodb_table_encryption_enabled",
  "ebs_in_backup_plan": "ebs_volume_in_backup_plan",
  "ebs_optimized_instance": "ec2_instance_ebs_optimized",
  "ebs_resources_protected_by_backup_plan": "ebs_volume_protected_by_backup_plan",
  "ebs_snapshot_public_restorable_check": "ebs_snapshot_not_publicly_restorable",
  "ec2_ebs_encryption_by_default": "ec2_ebs_default_encryption_enabled",
  "ec2_imdsv2_check": "ec2_instance_uses_imdsv2",
  "ec2_instance_detailed_monitoring_enabled": "ec2_instance_detailed_monitoring_enabled",
  "ec2_instance_managed_by_ssm": "ec2_instance_ssm_managed",
  "ec2_instance_no_public_ip": "ec2_instance_not_publicly_accessible",
  "ec2_instance_profile_attached": "ec2_instance_iam_profile_attached",
  "ec2_managedinstance_association_compliance_status_check": "ssm_managed_instance_compliance_association_compliant",
  "ec2_managedinstance_patch_compliance_status_check": "ssm_managed_instance_compliance_patch_compliant",
  "ec2_resources_protected_by_backup_plan": "ec2_instance_protected_by_backup_plan",
  "ec2_security_group_attached_to_eni": "vpc_security_group_associated_to_eni",
  "ec2_security_group_attached_to_eni_periodic": "pci_v321_ec2_3",
  "ec2_stopped_instance": "ec2_stopped_instance_30_days",
  "ec2_transit_gateway_auto_vpc_attach_disabled": "ec2_transit_gateway_auto_cross_account_attachment_disabled",
  "ec2_volume_inuse_check": "ebs_attached_volume_delete_on_termination_enabled",
  "ecr_private_image_scanning_enabled": "ecr_repository_image_scan_on_push_enabled",
  "ecs_task_definition_log_configuration": "ecs_task_definition_logging_enabled",
  "ecs_task_definition_user_for_host_mode_check": "ecs_task_definition_user_for_host_mode_check",
  "efs_encrypted_check": "efs_file_system_encrypted_with_cmk",
  "efs_in_backup_plan": "efs_file_system_in_backup_plan",
  "efs_resources_protected_by_backup_plan": "efs_file_system_protected_by_backup_plan",
  "vpc_eip_associated": "vpc_eip_associated",
  "eks_endpoint_no_public_access": "eks_cluster_endpoint_restrict_public_access",
  "eks_secrets_encrypted": "eks_cluster_secrets_encrypted",
  "elasticache_redis_cluster_automatic_backup_check": "elasticache_redis_cluster_automatic_backup_retention_15_days",
  "elasticsearch_encrypted_at_rest": "es_domain_encryption_at_rest_enabled",
  "elasticsearch_in_vpc_only": "es_domain_in_vpc",
  "elasticsearch_logs_to_cloudwatch": "es_domain_logs_to_cloudwatch",
  "elasticsearch_node_to_node_encryption_check": "es_domain_node_to_node_encryption_enabled",
  "elbv2_acm_certificate_required": "elb_application_network_lb_use_ssl_certificate",
  "elb_acm_certificate_required": "elb_classic_lb_use_ssl_certificate",
  "elb_cross_zone_load_balancing_enabled": "elb_classic_lb_cross_zone_load_balancing_enabled",
  "elb_custom_security_policy_ssl_check": "elb_listener_use_secure_ssl_cipher",
  "elb_logging_enabled": "elb_application_classic_lb_logging_enabled",
  "elb_predefined_security_policy_ssl_check": "elb_listener_use_secure_ssl_cipher",
  "elb_tls_https_listeners_only": "elb_classic_lb_use_tls_https_listeners",
  "emr_kerberos_enabled": "emr_cluster_kerberos_enabled",
  "emr_master_no_public_ip": "emr_cluster_master_nodes_no_public_ip",
  "encrypted_volumes": "ebs_attached_volume_encryption_enabled",
  "fsx_resources_protected_by_backup_plan": "fsx_file_system_protected_by_backup_plan",
  "guardduty_enabled_centralized": "guardduty_enabled",
  "guardduty_non_archived_findings": "guardduty_finding_archived",
  "iam_customer_policy_blocked_kms_actions": "iam_policy_custom_no_blocked_kms_actions",
  "iam_group_has_users_check": "iam_group_not_empty",
  "iam_inline_policy_blocked_kms_actions": "iam_policy_inline_no_blocked_kms_actions",
  "iam_no_inline_policy_check": "iam_group_user_role_no_inline_policies",
  "iam_password_policy": "iam_account_password_policy_strong",
  "iam_policy_no_statements_with_admin_access": "iam_policy_no_star_star",
  "iam_policy_no_statements_with_full_access": "iam_all_policy_no_service_wild_card",
  "iam_role_managed_policy_check": "iam_policy_custom_no_assume_role",
  "iam_root_access_key_check": "iam_root_user_no_access_keys",
  "iam_user_group_membership_check": "iam_user_in_group",
  "iam_user_mfa_enabled": "iam_user_mfa_enabled",
  "iam_user_no_policies_check": "iam_user_no_inline_attached_policies",
  "iam_user_unused_credentials_check": "iam_user_unused_credentials_90",
  "incoming_ssh_disabled": "vpc_security_group_restrict_ingress_ssh_all",
  "instances_in_vpc": "ec2_instance_in_vpc",
  "internet_gateway_authorized_vpc_only": "vpc_igw_attached_to_authorized_vpc",
  "kinesis_stream_encrypted": "kinesis_stream_server_side_encryption_enabled",
  "kms_cmk_not_scheduled_for_deletion": "kms_key_not_pending_deletion",
  "lambda_concurrency_check": "lambda_function_concurrent_execution_limit_configured",
  "lambda_dlq_check": "lambda_function_dead_letter_queue_configured",
  "lambda_function_public_access_prohibited": "lambda_function_restrict_public_access",
  "lambda_inside_vpc": "lambda_function_in_vpc",
  "mfa_enabled_for_iam_console_access": "iam_user_console_access_mfa_enabled",
  "multi_region_cloud_trail_enabled": "cloudtrail_multi_region_trail_enabled",
  "no_unrestricted_route_to_igw": "vpc_route_table_restrict_public_access_to_igw",
  "opensearch_encrypted_at_rest": "pci_v321_opensearch_2",
  "opensearch_in_vpc_only": "pci_v321_opensearch_1",
  "rds_automatic_minor_version_upgrade_enabled": "rds_db_instance_automatic_minor_version_upgrade_enabled",
  "rds_cluster_deletion_protection_enabled": "rds_db_cluster_deletion_protection_enabled",
  "rds_cluster_iam_authentication_enabled": "rds_db_cluster_iam_authentication_enabled",
  "rds_enhanced_monitoring_enabled": "rds_db_instance_and_cluster_enhanced_monitoring_enabled",
  "rds_instance_deletion_protection_enabled": "rds_db_instance_deletion_protection_enabled",
  "rds_instance_iam_authentication_enabled": "rds_db_instance_iam_authentication_enabled",
  "rds_instance_public_access_check": "rds_db_instance_prohibit_public_access",
  "rds_in_backup_plan": "rds_db_instance_in_backup_plan",
  "rds_logging_enabled": "rds_db_instance_logging_enabled",
  "rds_multi_az_support": "rds_db_instance_multiple_az_enabled",
  "rds_resources_protected_by_backup_plan": "rds_db_instance_protected_by_backup_plan",
  "rds_snapshots_public_prohibited": "rds_db_snapshot_prohibit_public_access",
  "rds_snapshot_encrypted": "rds_db_snapshot_encrypted_at_rest",
  "rds_storage_encrypted": "rds_db_instance_encryption_at_rest_enabled",
  "redshift_backup_enabled": "redshift_cluster_automatic_snapshots_min_7_days",
  "redshift_cluster_configuration_check": "redshift_cluster_encryption_logging_enabled",
  "redshift_cluster_kms_enabled": "redshift_cluster_kms_enabled",
  "redshift_cluster_maintenancesettings_check": "redshift_cluster_maintenance_settings_check",
  "redshift_cluster_public_access_check": "redshift_cluster_prohibit_public_access",
  "redshift_enhanced_vpc_routing_enabled": "redshift_cluster_enhanced_vpc_routing_enabled",
  "restricted_incoming_traffic": "vpc_security_group_restricted_common_ports",
  "root_account_hardware_mfa_enabled": "iam_root_user_hardware_mfa_enabled",
  "root_account_mfa_enabled": "iam_root_user_mfa_enabled",
  "s3_account_level_public_access_blocks": "s3_public_access_block_bucket_account",
  "s3_bucket_default_lock_enabled": "s3_bucket_object_lock_enabled",
  "s3_bucket_logging_enabled": "s3_bucket_logging_enabled",
  "s3_bucket_policy_not_more_permissive": "s3_bucket_policy_restricts_cross_account_permission_changes",
  "s3_bucket_public_read_prohibited": "s3_bucket_restrict_public_read_access",
  "s3_bucket_public_write_prohibited": "s3_bucket_restrict_public_write_access",
  "s3_bucket_replication_enabled": "s3_bucket_cross_region_replication_enabled",
  "s3_bucket_server_side_encryption_enabled": "s3_bucket_default_encryption_enabled",
  "s3_bucket_ssl_requests_only": "s3_bucket_enforces_ssl",
  "s3_bucket_versioning_enabled": "s3_bucket_versioning_enabled",
  "s3_default_encryption_kms": "s3_bucket_default_encryption_enabled_kms",
  "sagemaker_endpoint_configuration_kms_key_configured": "sagemaker_endpoint_configuration_encryption_at_rest_enabled",
  "sagemaker_notebook_instance_inside_vpc": "sagemaker_notebook_instance_in_vpc",
  "sagemaker_notebook_instance_kms_key_configured": "sagemaker_notebook_instance_encryption_at_rest_enabled",
  "sagemaker_notebook_instance_root_access_check": "sagemaker_notebook_instance_root_access_disabled",
  "sagemaker_notebook_no_direct_internet_access": "sagemaker_notebook_instance_direct_internet_access_disabled",
  "secretsmanager_rotation_enabled_check": "secretsmanager_secret_automatic_rotation_enabled",
  "secretsmanager_scheduled_rotation_success_check": "secretsmanager_secret_rotated_as_scheduled",
  "secretsmanager_secret_periodic_rotation": "secretsmanager_secret_last_changed_90_day",
  "secretsmanager_secret_unused": "secretsmanager_secret_unused_90_day",
  "secretsmanager_using_cmk": "secretsmanager_secret_encrypted_with_kms_cmk",
  "securityhub_enabled": "securityhub_enabled",
  "service_vpc_endpoint_enabled": "vpc_endpoint_service_acceptance_required_enabled",
  "sns_encrypted_kms": "sns_topic_encrypted_at_rest",
  "ssm_document_not_public": "ssm_document_publicly_accessible",
  "subnet_auto_assign_public_ip_disabled": "vpc_subnet_auto_assign_public_ip_disabled",
  "vpc_default_security_group_closed": "vpc_default_security_group_restricts_all_traffic",
  "vpc_flow_logs_enabled": "vpc_flow_logs_enabled",
  "vpc_network_acl_unused_check": "vpc_network_acl_unused",
  "vpc_sg_open_only_to_authorized_ports": "vpc_security_group_restrict_ingress_tcp_udp_all",
  "vpc_vpn_2_tunnels_up": "vpc_vpn_tunnel_up",
  "wafv2_logging_enabled": "wafv2_web_acl_logging_enabled",
};

const compareFrameworkToBenchmark = (frameworkControl, benchmarkControl) => {
  const controlsEqual = (frameworkControl["steampipe_benchmark"] == benchmarkControl["benchmark"]) && (frameworkControl["source_type"] == benchmarkControl["source_type"]) && (frameworkControl["steampipe_control"] == benchmarkControl["steampipe_control"] || benchmarkControl["steampipe_control"] == configRules[_.get(frameworkControl, "steampipe_control", "")])
  return controlsEqual
}

const compareBenchmarkToFramework = (benchmarkControl, frameworkControl) => {
  const controlsEqual = (frameworkControl["steampipe_benchmark"] == benchmarkControl["benchmark"]) && (frameworkControl["source_type"] == benchmarkControl["source_type"]) && (frameworkControl["steampipe_control"] == benchmarkControl["steampipe_control"] || benchmarkControl["steampipe_control"] == configRules[_.get(frameworkControl, "steampipe_control", "")])
  return controlsEqual
}

main();