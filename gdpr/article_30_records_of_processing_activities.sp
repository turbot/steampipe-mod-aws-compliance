benchmark "article_30_records_of_processing_activities" {
  title       = "Article 30 Records of processing activities"
  description = "Article 30 of the GDPR states that '…each controller and, where applicable, the controller’s representative, shall maintain a record of processing activities under its responsibility.' This article also includes details about which information must be recorded when you monitor the processing of all personal data. Controllers and processors are also required to send breach notifications in a timely manner, so detecting incidents quickly is important. To help enable customers to comply with these obligations, AWS offers the following monitoring and logging services."
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
