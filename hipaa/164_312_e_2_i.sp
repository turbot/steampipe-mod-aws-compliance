locals {
  hipaa_164_312_e_2_i_common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_312_e_2_i"
  })
}

benchmark "hipaa_164_312_e_2_i" {
  title       = "164.312(e)(2)(i) Integrity controls"
  description = "Implement security measures to ensure that electronically transmitted electronic protected health information is not improperly modified without detection until disposed of."
  children = [
    control.hipaa_164_312_e_2_i_cloudtrail_integrated_with_logs,
    control.hipaa_164_312_e_2_i_cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.hipaa_164_312_e_2_i_ec2_application_lb_configured_to_redirect_http_request_to_https,
    control.hipaa_164_312_e_2_i_elb_classic_lb_use_ssl_certificate,
    control.hipaa_164_312_e_2_i_guardduty_enabled,
    control.hipaa_164_312_e_2_i_redshift_cluster_encryption_in_transit_enabled,
    control.hipaa_164_312_e_2_i_s3_bucket_enforces_ssl,
    control.hipaa_164_312_e_2_i_s3_bucket_logging_enabled,
    control.hipaa_164_312_e_2_i_securityhub_enabled
  ]
  tags          = local.hipaa_164_312_e_2_i_common_tags
}

control "hipaa_164_312_e_2_i_ec2_application_lb_configured_to_redirect_http_request_to_https" {
  title       = "EC2 application LB should be configured to redirect http request to https"
  description = "To help protect data in transit, ensure that your Application Load Balancer automatically redirects unencrypted HTTP requests to HTTPS."
  sql         = query.ec2_application_lb_configured_to_redirect_http_request_to_https.sql

  tags = merge(local.hipaa_164_312_e_2_i_common_tags, {
    service = "ec2"
  })
}

control "hipaa_164_312_e_2_i_cloudtrail_integrated_with_logs" {
  title       = "Cloudtrail should be integrated with logs"
  description = "Use Amazon CloudWatch to centrally collect and manage log event activity."
  sql         = query.cloudtrail_integrated_with_logs.sql

  tags = merge(local.hipaa_164_312_e_2_i_common_tags, {
    service = "cloudtrail"
  })
}

control "hipaa_164_312_e_2_i_elb_classic_lb_use_ssl_certificate" {
  title       = "ELB classic LB should use SSL certificate"
  description = "Because sensitive data can exist and to help protect data at transit, ensure encryption is enabled for your Elastic Load Balancing."
  sql         = query.elb_classic_lb_use_ssl_certificate.sql

  tags = merge(local.hipaa_164_312_e_2_i_common_tags, {
    service = "elb"
  })
}

control "hipaa_164_312_e_2_i_guardduty_enabled" {
  title       = "GuardDuty should be enabled"
  description = "Amazon GuardDuty can help to monitor and detect potential cybersecurity events by using threat intelligence feeds."
  sql         = query.guardduty_enabled.sql

  tags = merge(local.hipaa_164_312_e_2_i_common_tags, {
    service = "guardduty"
  })
}

control "hipaa_164_312_e_2_i_cloudtrail_multi_region_trail_enabled" {
  title       = "At least one multi-region AWS CloudTrail should be present in an account"
  description = "AWS CloudTrail records AWS Management Console actions and API calls. You can identify which users and accounts called AWS, the source IP address from where the calls were made, and when the calls occurred. CloudTrail will deliver log files from all AWS Regions to your S3 bucket if MULTI_REGION_CLOUD_TRAIL_ENABLED is enabled."
  sql         = query.cloudtrail_multi_region_trail_enabled.sql

  tags = merge(local.hipaa_164_312_e_2_i_common_tags, {
    service = "cloudtrail"
  })
}

control "hipaa_164_312_e_2_i_redshift_cluster_encryption_in_transit_enabled" {
  title       = "Redshift cluster encryption in transit should be enabled"
  description = "Ensure that your Amazon Redshift clusters require TLS/SSL encryption to connect to SQL clients."
  sql         = query.redshift_cluster_encryption_in_transit_enabled.sql

  tags = merge(local.hipaa_164_312_e_2_i_common_tags, {
    service = "redshift"
  })
}

control "hipaa_164_312_e_2_i_s3_bucket_logging_enabled" {
  title       = "Logging should be enabled for all S3 buckets"
  description = "Amazon Simple Storage Service (Amazon S3) server access logging provides a method to monitor the network for potential cybersecurity events."
  sql         = query.s3_bucket_logging_enabled.sql

  tags = merge(local.hipaa_164_312_e_2_i_common_tags, {
    service = "s3"
  })
}

control "hipaa_164_312_e_2_i_s3_bucket_enforces_ssl" {
  title       = "S3 bucket should enforce SSL"
  description = "To help protect data in transit, ensure that your Amazon Simple Storage Service (Amazon S3) buckets require requests to use Secure Socket Layer (SSL)."
  sql         = query.s3_bucket_enforces_ssl.sql

  tags = merge(local.hipaa_164_312_e_2_i_common_tags, {
    service = "s3"
  })
}

control "hipaa_164_312_e_2_i_securityhub_enabled" {
  title       = "AWS Security Hub should be enabled for an AWS Account"
  description = "AWS Security Hub helps to monitor unauthorized personnel, connections, devices, and software. AWS Security Hub aggregates, organizes, and prioritizes the security alerts, or findings, from multiple AWS services."
  sql         = query.securityhub_enabled.sql

  tags = merge(local.hipaa_164_312_e_2_i_common_tags, {
    service = "securityhub"
  })
}
