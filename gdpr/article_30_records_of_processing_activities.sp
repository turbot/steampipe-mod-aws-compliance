benchmark "article_30_records_of_processing_activities" {
  title       = "Article 30 Records of processing activities"
  documentation = file("./gdpr/docs/article_30_records_of_processing_activities.md")
  children = [
    control.cloudtrail_enabled_all_regions,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_security_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.config_enabled_all_regions,
    control.elb_application_classic_lb_logging_enabled,
    control.kms_cmk_rotation_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.vpc_flow_logs_enabled
  ]

  tags = local.gdpr_common_tags
}
