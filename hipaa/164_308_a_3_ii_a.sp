locals {
  hipaa_164_308_a_3_ii_a_common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_308_a_3_ii_a"
  })
}

benchmark "hipaa_164_308_a_3_ii_a" {
  title         = "164.308(a)(3)(ii)(A) Authorization and/or supervision"
  description   = "Implement procedures for the authorization and/or supervision of workforce members who work with electronic protected health information or in locations where it might be accessed."
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a.md")
  children = [
    control.hipaa_164_308_a_3_ii_a_apigateway_stage_logging_enabled,
    control.hipaa_164_308_a_3_ii_a_cloudtrail_s3_data_events_enabled,
    control.hipaa_164_308_a_3_ii_a_elb_application_classic_logging_enabled,
    control.hipaa_164_308_a_3_ii_a_emr_cluster_kerberos_enabled,
    control.hipaa_164_308_a_3_ii_a_guardduty_enabled,
    control.hipaa_164_308_a_3_ii_a_iam_console_access_mfa_enabled,
    control.hipaa_164_308_a_3_ii_a_iam_root_user_hardware_mfa,
    control.hipaa_164_308_a_3_ii_a_iam_root_user_mfa,
    control.hipaa_164_308_a_3_ii_a_iam_user_mfa_enabled,
    control.hipaa_164_308_a_3_ii_a_redshift_cluster_encryption_logging_enabled,
    control.hipaa_164_308_a_3_ii_a_s3_bucket_logging_enabled,
    control.hipaa_164_308_a_3_ii_a_securityhub_enabled,
    control.hipaa_164_308_a_3_ii_a_vpc_flow_log_enabled
  ]
  tags          = local.hipaa_164_308_a_3_ii_a_common_tags
}

control "hipaa_164_308_a_3_ii_a_apigateway_stage_logging_enabled" {
  title         = "Logging should be enabled for API Gateway stage"
  description   = "API Gateway logging displays detailed views of users who accessed the API and the way they accessed the API."
  sql           = query.apigateway_stage_logging_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a_apigateway_stage_logging_enabled.md")

  tags = merge(local.hipaa_164_308_a_3_ii_a_common_tags, {
    service  = "apigateway"
  })
}

control "hipaa_164_308_a_3_ii_a_cloudtrail_s3_data_events_enabled" {
  title         = "CloudTrail trail should exist for logging Amazon S3 data events for all S3 buckets"
  description   = "The collection of Simple Storage Service (Amazon S3) data events helps in detecting any anomalous activity."
  sql           = query.cloudtrail_s3_data_events_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a_cloudtrail_s3_data_events_enabled.md")

  tags = merge(local.hipaa_164_308_a_3_ii_a_common_tags, {
    service  = "cloudtrail"
  })
}

control "hipaa_164_308_a_3_ii_a_elb_application_classic_logging_enabled" {
  title         = "ELB application classic LB logging should be enabled"
  description   = "Elastic Load Balancing activity is a central point of communication within an environment."
  sql           = query.elb_application_classic_logging_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a_elb_application_classic_logging_enabled.md")

  tags = merge(local.hipaa_164_308_a_3_ii_a_common_tags, {
    service  = "elb"
  })
}

control "hipaa_164_308_a_3_ii_a_emr_cluster_kerberos_enabled" {
  title         = "EMR cluster kerberos should be enabled"
  description   = "The access permissions and authorizations can be managed and incorporated with the principles of least privilege and separation of duties, by enabling Kerberos for Amazon EMR clusters."
  sql           = query.emr_cluster_kerberos_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a_emr_cluster_kerberos_enabled.md")

  tags = merge(local.hipaa_164_308_a_3_ii_a_common_tags, {
    service  = "emr"
  })
}

control "hipaa_164_308_a_3_ii_a_guardduty_enabled" {
  title         = "GuardDuty should be enabled"
  description   = "Amazon GuardDuty can help to monitor and detect potential cybersecurity events by using threat intelligence feeds."
  sql           = query.guardduty_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a_guardduty_enabled.md")

  tags = merge(local.hipaa_164_308_a_3_ii_a_common_tags, {
    service  = "guardduty"
  })
}

control "hipaa_164_308_a_3_ii_a_iam_user_mfa_enabled" {
  title         = "IAM user MFA should be enabled"
  description   = "Enable this rule to restrict access to resources in the AWS Cloud."
  sql           = query.iam_user_mfa.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a_iam_user_mfa_enabled.md")

  tags = merge(local.hipaa_164_308_a_3_ii_a_common_tags, {
    service  = "iam"
  })
}

control "hipaa_164_308_a_3_ii_a_iam_console_access_mfa_enabled" {
  title         = "IAM console access user MFA should be enabled"
  description   = "Manage access to resources in the AWS Cloud by ensuring that MFA is enabled for all AWS Identity and Access Management (IAM) users that have a console password."
  sql           = query.iam_user_mfa.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a_iam_console_access_mfa_enabled.md")

  tags = merge(local.hipaa_164_308_a_3_ii_a_common_tags, {
    service  = "iam"
  })
}

control "hipaa_164_308_a_3_ii_a_redshift_cluster_encryption_logging_enabled" {
  title         = "Audit logging and encryption should be enabled for Redshift cluster"
  description   = "To protect data at rest, ensure that encryption is enabled for your Amazon Redshift clusters. You must also ensure that required configurations are deployed on Amazon Redshift clusters. The audit logging should be enabled to provide information about connections and user activities in the database."
  sql           = query.redshift_cluster_encryption_logging_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a_redshift_cluster_encryption_logging_enabled.md")

  tags = merge(local.hipaa_164_308_a_3_ii_a_common_tags, {
    service  = "redshift"
  })
}

control "hipaa_164_308_a_3_ii_a_iam_root_user_hardware_mfa" {
  title         = "IAM root user hardware MFA should be enabled"
  description   = "Manage access to resources in the AWS Cloud by ensuring hardware MFA is enabled for the root user."
  sql           = query.iam_root_user_hardware_mfa.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a_iam_root_user_hardware_mfa.md")

  tags = merge(local.hipaa_164_308_a_3_ii_a_common_tags, {
    service  = "iam"
  })
}

control "hipaa_164_308_a_3_ii_a_iam_root_user_mfa" {
  title         = "IAM root user MFA should be enabled"
  description   = "Manage access to resources in the AWS Cloud by ensuring MFA is enabled for the root user."
  sql           = query.iam_root_user_mfa.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a_iam_root_user_mfa.md")

  tags = merge(local.hipaa_164_308_a_3_ii_a_common_tags, {
    service  = "iam"
  })
}

control "hipaa_164_308_a_3_ii_a_s3_bucket_logging_enabled" {
  title         = "Logging should be enabled for all S3 buckets"
  description   = "Amazon Simple Storage Service (Amazon S3) server access logging provides a method to monitor the network for potential cybersecurity events."
  sql           = query.s3_bucket_logging_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a_s3_bucket_logging_enabled.md")

  tags = merge(local.hipaa_164_308_a_3_ii_a_common_tags, {
    service  = "s3"
  })
}

control "hipaa_164_308_a_3_ii_a_securityhub_enabled" {
  title         = "AWS Security Hub should be enabled for an AWS Account"
  description   = "AWS Security Hub helps to monitor unauthorized personnel, connections, devices, and software. AWS Security Hub aggregates, organizes, and prioritizes the security alerts, or findings, from multiple AWS services."
  sql           = query.securityhub_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a_securityhub_enabled.md")

  tags = merge(local.hipaa_164_308_a_3_ii_a_common_tags, {
    service = "securityhub"
  })
}

control "hipaa_164_308_a_3_ii_a_vpc_flow_log_enabled" {
  title         = "VPC flow log should be enabled"
  description   = "The VPC flow logs provide detailed records for information about the IP traffic going to and from network interfaces in your Amazon Virtual Private Cloud (Amazon VPC)."
  sql           = query.vpc_flow_log_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a_vpc_flow_log_enabled.md")

  tags = merge(local.hipaa_164_308_a_3_ii_a_common_tags, {
    service  = "vpc"
  })
}
