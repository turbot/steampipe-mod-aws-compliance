locals {
  common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_312_e_2_i"
  })
}

benchmark "hipaa_164_312_e_2_i" {
  title       = "164.312(e)(2)(i) Integrity controls"
  description = "Implement security measures to ensure that electronically transmitted electronic protected health information is not improperly modified without detection until disposed of."
  children = [
    control.cloudtrail_integrated_with_logs,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.ec2_application_lb_configured_to_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.guardduty_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled
  ]
  tags          = local.common_tags
}
