benchmark "article_30_records_of_processing_activities" {
  title       = "Article 30 Records of processing activities"
  description = "The controller and, where applicable, the controller's representative, shall maintain a record of processing activities under its responsibility."
  children = [
    benchmark.article_30_records_of_processing_activities_1,
  ]

  tags = local.gdpr_common_tags
}

benchmark "article_30_records_of_processing_activities_1" {
  title       = "Article 30 Records of processing activities 1"
  description = "That record shall contain all of the following information: the name and contact details of the controller and, where applicable, the joint controller, the controller's representative and the data protection officer; the purposes of the processing; a description of the categories of data subjects and of the categories of personal data; the categories of recipients to whom the personal data have been or will be disclosed including recipients in third countries or international organisations; where applicable, transfers of personal data to a third country or an international organisation, including the identification of that third country or international organisation and, in the case of transfers referred to in the second subparagraph of Article 49(1), the documentation of suitable safeguards; where possible, the envisaged time limits for erasure of the different categories of data; where possible, a general description of the technical and organisational security measures referred to in Article 32(1)."
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
    control.vpc_flow_logs_enabled,
  ]

  tags = local.gdpr_common_tags
}
