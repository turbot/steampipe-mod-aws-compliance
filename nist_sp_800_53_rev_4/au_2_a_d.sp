benchmark "nist_sp_800_53_rev4_au_2_a_d" {
  title       = "AU-2 (a)(d) Audit Events"
  description = "The organization: a. Determines that the information system is capable of auditing the following events: [Assignment: organization-defined auditable events]; d. Determines that the following events are to be audited within the information system: [Assignment: organization-defined audited events (the subset of the auditable events defined in AU-2 a.) along with the frequency of (or situation requiring) auditing for each identified event]."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.rds_db_instance_logging_enabled,
    control.wafv2_web_acl_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
  ]

  tags = local.nist_sp_800_53_rev4_common_tags
}