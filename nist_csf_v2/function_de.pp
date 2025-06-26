benchmark "nist_csf_v2_de" {
  title       = "Detect (DE)"
  description = "Possible cybersecurity attacks and compromises are found and analyzed."
  children = [
    benchmark.nist_csf_v2_de_cm,
    benchmark.nist_csf_v2_de_ae
  ]
}

benchmark "nist_csf_v2_de_cm" {
  title       = "Continuous Monitoring (DE.CM)"
  description = "Assets are monitored to find anomalies, indicators of compromise, and other potentially adverse events."
  children = [
    benchmark.nist_csf_v2_de_cm_01,
    benchmark.nist_csf_v2_de_cm_02,
    benchmark.nist_csf_v2_de_cm_03,
    benchmark.nist_csf_v2_de_cm_06,
    benchmark.nist_csf_v2_de_cm_09
  ]
}

benchmark "nist_csf_v2_de_cm_01" {
  title       = "DE.CM-01"
  description = "Networks and network services are monitored to find potentially adverse events."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.cloudwatch_alarm_action_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.log_metric_filter_network_acl,
    control.log_metric_filter_network_gateway,
    control.log_metric_filter_route_table,
    control.log_metric_filter_security_group,
    control.log_metric_filter_vpc,
    control.vpc_flow_logs_enabled
  ]
}

benchmark "nist_csf_v2_de_cm_02" {
  title       = "DE.CM-02"
  description = "The physical environment is monitored to find potentially adverse events."
  children = [
    control.autoscaling_group_multiple_az_configured,
    control.cloudwatch_alarm_action_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.rds_db_instance_multiple_az_enabled
  ]
}

benchmark "nist_csf_v2_de_cm_03" {
  title       = "DE.CM-03"
  description = "Personnel activity and technology usage are monitored to find potentially adverse events."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_iam_policy,
    control.log_metric_filter_unauthorized_api
  ]
}

benchmark "nist_csf_v2_de_cm_06" {
  title       = "DE.CM-06"
  description = "External service provider activities and services are monitored to find potentially adverse events."
  children = [
    control.cloudwatch_cross_account_sharing,
    control.log_metric_filter_bucket_policy,
    control.log_metric_filter_cloudtrail_configuration,
    control.log_metric_filter_config_configuration,
    control.sns_topic_policy_prohibit_cross_account_access
  ]
}

benchmark "nist_csf_v2_de_cm_09" {
  title       = "DE.CM-09"
  description = "Computing hardware and software, runtime environments, and their data are monitored to find potentially adverse events."
  children = [
    control.cloudwatch_alarm_action_enabled,
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.dynamodb_table_protected_by_backup_plan,
    control.ebs_volume_in_backup_plan,
    control.ebs_volume_protected_by_backup_plan,
    control.ec2_instance_detailed_monitoring_enabled,
    control.ec2_instance_protected_by_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.efs_file_system_protected_by_backup_plan,
    control.log_metric_filter_bucket_policy,
    control.log_metric_filter_cloudtrail_configuration,
    control.log_metric_filter_config_configuration,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_protected_by_backup_plan,
    control.s3_bucket_lifecycle_policy_enabled,
    control.s3_bucket_versioning_and_lifecycle_policy_enabled,
    control.s3_bucket_versioning_enabled
  ]
}

benchmark "nist_csf_v2_de_ae" {
  title       = "Adverse Event Analysis (DE.AE)"
  description = "Anomalies, indicators of compromise, and other potentially adverse events are analyzed to characterize the events and detect cybersecurity incidents."
  children = [
    benchmark.nist_csf_v2_de_ae_02,
    benchmark.nist_csf_v2_de_ae_03,
    benchmark.nist_csf_v2_de_ae_04,
    benchmark.nist_csf_v2_de_ae_06,
    benchmark.nist_csf_v2_de_ae_07,
    benchmark.nist_csf_v2_de_ae_08
  ]
}

benchmark "nist_csf_v2_de_ae_02" {
  title       = "DE.AE-02"
  description = "Potentially adverse events are analyzed to better understand associated activities."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.guardduty_enabled,
    control.log_metric_filter_bucket_policy,
    control.log_metric_filter_cloudtrail_configuration,
    control.log_metric_filter_config_configuration,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_iam_policy,
    control.log_metric_filter_unauthorized_api,
    control.securityhub_enabled
  ]
}

benchmark "nist_csf_v2_de_ae_03" {
  title       = "DE.AE-03"
  description = "Information is correlated from multiple sources."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.guardduty_enabled,
    control.log_metric_filter_bucket_policy,
    control.log_metric_filter_cloudtrail_configuration,
    control.log_metric_filter_config_configuration,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_iam_policy,
    control.log_metric_filter_unauthorized_api,
    control.securityhub_enabled
  ]
}

benchmark "nist_csf_v2_de_ae_04" {
  title       = "DE.AE-04"
  description = "The estimated impact and scope of adverse events are understood."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.guardduty_enabled,
    control.log_metric_filter_bucket_policy,
    control.log_metric_filter_cloudtrail_configuration,
    control.log_metric_filter_config_configuration,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_iam_policy,
    control.log_metric_filter_unauthorized_api,
    control.securityhub_enabled
  ]
}

benchmark "nist_csf_v2_de_ae_06" {
  title       = "DE.AE-06"
  description = "Information on adverse events is provided to authorized staff and tools."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.guardduty_enabled,
    control.log_metric_filter_bucket_policy,
    control.log_metric_filter_cloudtrail_configuration,
    control.log_metric_filter_config_configuration,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_iam_policy,
    control.log_metric_filter_unauthorized_api,
    control.securityhub_enabled
  ]
}

benchmark "nist_csf_v2_de_ae_07" {
  title       = "DE.AE-07"
  description = "Cyber threat intelligence and other contextual information are integrated into the analysis."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.guardduty_enabled,
    control.log_metric_filter_bucket_policy,
    control.log_metric_filter_cloudtrail_configuration,
    control.log_metric_filter_config_configuration,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_iam_policy,
    control.log_metric_filter_unauthorized_api,
    control.securityhub_enabled
  ]
}

benchmark "nist_csf_v2_de_ae_08" {
  title       = "DE.AE-08"
  description = "Incidents are declared when adverse events meet the defined incident criteria."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.guardduty_enabled,
    control.log_metric_filter_bucket_policy,
    control.log_metric_filter_cloudtrail_configuration,
    control.log_metric_filter_config_configuration,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_iam_policy,
    control.log_metric_filter_unauthorized_api,
    control.securityhub_enabled
  ]
}