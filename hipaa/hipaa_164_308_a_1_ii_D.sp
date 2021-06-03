locals {
  hipaa_164_308_a_1_ii_D_common_tags = merge(local.hipaa_common_tags, {
    hipaa_control_id = "hipaa_164_308_a_1_ii_D"
  })
}

benchmark "hipaa_164_308_a_1_ii_D" {
  title         = "164.308(a)(1)(ii)(D)"
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_D.md")
  children = [
    #control.hipaa_164_308_a_1_ii_D_apigateway_stage_logging_enabled,
    control.hipaa_164_308_a_1_ii_D_cloudtrail_cloudwatch_logs_enabled,
    control.hipaa_164_308_a_1_ii_D_cloudtrail_s3_data_events_enabled,
    #control.hipaa_164_308_a_1_ii_D_elb_logging_enabled,
    control.hipaa_164_308_a_1_ii_D_guardduty_enabled,
    control.hipaa_164_308_a_1_ii_D_redshift_cluster_encryption_logging_enabled,
    control.hipaa_164_308_a_1_ii_D_s3_bucket_logging_enabled
  ]
  tags = local.hipaa_164_308_a_1_ii_D_common_tags
}

control "hipaa_164_308_a_1_ii_D_apigateway_stage_logging_enabled" {
  title         = "Ensure logging is enabled for API Gateway stage"
  description   = "Implement procedures to regularly review records of information system activity, such as audit logs, access reports, and security incident tracking reports."
  #sql           = query.apigateway_stage_logging_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_D_apigateway_stage_logging_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_D_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_1_ii_D_apigateway_stage_logging_enabled"
  })
}

control "hipaa_164_308_a_1_ii_D_cloudtrail_cloudwatch_logs_enabled" {
  title         = "CloudTrail trails should be integrated with CloudWatch Logs"
  description   = "Implement procedures to regularly review records of information system activity, such as audit logs, access reports, and security incident tracking reports."
  sql           = query.cloudtrail_integrated_with_logs.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_D_cloudtrail_cloudwatch_logs_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_D_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_1_ii_D_cloudtrail_cloudwatch_logs_enabled"
  })
}

control "hipaa_164_308_a_1_ii_D_cloudtrail_s3_data_events_enabled" {
  title         = "Ensure a CloudTrail trail exist for logging Amazon S3 data events for all S3 buckets"
  description   = "Implement procedures to regularly review records of information system activity, such as audit logs, access reports, and security incident tracking reports."
  sql           = query.cloudtrail_s3_data_events_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_D_cloudtrail_s3_data_events_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_D_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_1_ii_D_cloudtrail_s3_data_events_enabled"
  })
}

control "hipaa_164_308_a_1_ii_D_elb_logging_enabled" {
  title         = "Ensure Application Load Balancer and Classic Load Balancer have logging enabled"
  description   = "Implement procedures to regularly review records of information system activity, such as audit logs, access reports, and security incident tracking reports."
  #sql           = query.elb_application_classic_logging_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_D_elb_logging_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_D_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_1_ii_D_elb_logging_enabled"
  })
}

control "hipaa_164_308_a_1_ii_D_guardduty_enabled" {
  title         = "Ensure GuardDuty should be enabled in your AWS account and region"
  description   = "Implement procedures to regularly review records of information system activity, such as audit logs, access reports, and security incident tracking reports."
  sql           = query.guardduty_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_D_guardduty_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_D_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_1_ii_D_guardduty_enabled"
  })
}

control "hipaa_164_308_a_1_ii_D_redshift_cluster_encryption_logging_enabled" {
  title         = "Ensure audit logging and encryption enabled for Redshift cluster"
  description   = "Implement procedures to regularly review records of information system activity, such as audit logs, access reports, and security incident tracking reports."
  sql           = query.redshift_cluster_encryption_logging_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_D_redshift_cluster_encryption_logging_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_D_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_1_ii_D_redshift_cluster_encryption_logging_enabled"
  })
}

control "hipaa_164_308_a_1_ii_D_s3_bucket_logging_enabled" {
  title         = "Ensure logging is enabled for all S3 buckets"
  description   = "Implement procedures to regularly review records of information system activity, such as audit logs, access reports, and security incident tracking reports."
  sql           = query.s3_bucket_logging_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_D_s3_bucket_logging_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_D_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_1_ii_D_s3_bucket_logging_enabled"
  })
}