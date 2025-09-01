locals {
  foundational_security_s3_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/S3"
  })
}

benchmark "foundational_security_s3" {
  title         = "S3"
  documentation = file("./foundational_security/docs/foundational_security_s3.md")
  children = [
    control.foundational_security_s3_1,
    control.foundational_security_s3_2,
    control.foundational_security_s3_3,
    control.foundational_security_s3_5,
    control.foundational_security_s3_6,
    control.foundational_security_s3_8,
    control.foundational_security_s3_9,
    control.foundational_security_s3_10,
    control.foundational_security_s3_11,
    control.foundational_security_s3_12,
    control.foundational_security_s3_13,
    control.foundational_security_s3_19,
    control.foundational_security_s3_24,
    control.foundational_security_s3_25
  ]

  tags = merge(local.foundational_security_s3_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_s3_1" {
  title         = "1 S3 Block Public Access setting should be enabled"
  description   = "This control checks whether the following Amazon S3 public access block settings are configured at the account level"
  severity      = "medium"
  query         = query.s3_public_access_block_account
  documentation = file("./foundational_security/docs/foundational_security_s3_1.md")

  tags = merge(local.foundational_security_s3_common_tags, {
    foundational_security_item_id  = "s3_1"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_s3_2" {
  title         = "2 S3 buckets should prohibit public read access"
  description   = "This control checks whether your S3 buckets allow public read access. It evaluates the Block Public Access settings, the bucket policy, and the bucket access control list (ACL)."
  severity      = "critical"
  query         = query.s3_bucket_restrict_public_read_access
  documentation = file("./foundational_security/docs/foundational_security_s3_2.md")

  tags = merge(local.foundational_security_s3_common_tags, {
    foundational_security_item_id  = "s3_2"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_s3_3" {
  title         = "3 S3 buckets should prohibit public write access"
  description   = "This control checks whether your S3 buckets allow public write access. It evaluates the block public access settings, the bucket policy, and the bucket access control list (ACL)."
  severity      = "critical"
  query         = query.s3_bucket_restrict_public_write_access
  documentation = file("./foundational_security/docs/foundational_security_s3_3.md")

  tags = merge(local.foundational_security_s3_common_tags, {
    foundational_security_item_id  = "s3_3"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_s3_5" {
  title         = "5 S3 buckets should require requests to use Secure Socket Layer"
  description   = "This control checks whether S3 buckets have policies that require requests to use Secure Socket Layer (SSL). S3 buckets should have policies that require all requests (Action: S3:*)to only accept transmission of data over HTTPS in the S3 resource policy, indicated by the condition key aws:SecureTransport."
  severity      = "medium"
  query         = query.s3_bucket_enforces_ssl
  documentation = file("./foundational_security/docs/foundational_security_s3_5.md")

  tags = merge(local.foundational_security_s3_common_tags, {
    foundational_security_item_id  = "s3_5"
    foundational_security_category = "secure_access_management"
  })
}

control "foundational_security_s3_6" {
  title         = "6 Amazon S3 permissions granted to other AWS accounts in bucket policies should be restricted"
  description   = "This control checks whether the S3 bucket policy prevents principals from other AWS accounts from performing denied actions on resources in the S3 bucket."
  severity      = "high"
  query         = query.s3_bucket_policy_restricts_cross_account_permission_changes
  documentation = file("./foundational_security/docs/foundational_security_s3_6.md")

  tags = merge(local.foundational_security_s3_common_tags, {
    foundational_security_item_id  = "s3_6"
    foundational_security_category = "sensitive_api_operations_actions_restricted"
  })
}

control "foundational_security_s3_8" {
  title         = "8 S3 Block Public Access setting should be enabled at the bucket level"
  description   = "This control checks whether S3 buckets have bucket-level public access blocks applied."
  severity      = "high"
  query         = query.s3_public_access_block_bucket
  documentation = file("./foundational_security/docs/foundational_security_s3_8.md")

  tags = merge(local.foundational_security_s3_common_tags, {
    foundational_security_item_id  = "s3_8"
    foundational_security_category = "access_control"
  })
}

control "foundational_security_s3_9" {
  title         = "9 S3 bucket server access logging should be enabled"
  description   = "When logging is enabled, Amazon S3 delivers access logs for a source bucket to a chosen target bucket. The target bucket must be in the same AWS Region as the source bucket and must not have a default retention period configuration."
  severity      = "medium"
  query         = query.s3_bucket_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_s3_9.md")

  tags = merge(local.foundational_security_s3_common_tags, {
    foundational_security_item_id  = "s3_9"
    foundational_security_category = "logging"
  })
}

control "foundational_security_s3_10" {
  title         = "10 S3 buckets with versioning enabled should have lifecycle policies configured"
  description   = "This control checks if Amazon Simple Storage Service (Amazon S3) version enabled buckets have lifecycle policy configured. This rule fails if Amazon S3 lifecycle policy is not enabled."
  severity      = "medium"
  query         = query.s3_bucket_versioning_and_lifecycle_policy_enabled
  documentation = file("./foundational_security/docs/foundational_security_s3_10.md")

  tags = merge(local.foundational_security_s3_common_tags, {
    foundational_security_item_id  = "s3_10"
    foundational_security_category = "logging"
  })
}

control "foundational_security_s3_11" {
  title         = "11 S3 buckets should have event notifications enabled"
  description   = "This control checks whether S3 Event Notifications are enabled on an Amazon S3 bucket. This control fails if S3 Event Notifications are not enabled on a bucket."
  severity      = "medium"
  query         = query.s3_bucket_event_notifications_enabled
  documentation = file("./foundational_security/docs/foundational_security_s3_11.md")

  tags = merge(local.foundational_security_s3_common_tags, {
    foundational_security_item_id  = "s3_11"
    foundational_security_category = "logging"
  })
}

control "foundational_security_s3_12" {
  title         = "12 S3 access control lists (ACLs) should not be used to manage user access to buckets"
  description   = "This control checks whether Amazon S3 buckets provide user permissions via ACLs. The control fails if ACLs are configured for managing user access on S3 buckets."
  severity      = "medium"
  query         = query.s3_bucket_acls_should_prohibit_user_access
  documentation = file("./foundational_security/docs/foundational_security_s3_12.md")

  tags = merge(local.foundational_security_s3_common_tags, {
    foundational_security_item_id  = "s3_12"
    foundational_security_category = "access_control"
  })
}

control "foundational_security_s3_13" {
  title         = "13 S3 buckets should have lifecycle policies configured"
  description   = "This control checks if a lifecycle policy is configured for an Amazon S3 bucket. This control fails if a lifecycle policy is not configured for an S3 bucket."
  severity      = "low"
  query         = query.s3_bucket_lifecycle_policy_enabled
  documentation = file("./foundational_security/docs/foundational_security_s3_13.md")

  tags = merge(local.foundational_security_s3_common_tags, {
    foundational_security_item_id  = "s3_13"
    foundational_security_category = "data_protection"
  })
}

control "foundational_security_s3_19" {
  title         = "19 S3 access points should have block public access settings enabled"
  description   = "This control checks whether an Amazon S3 access point has block public access settings enabled. The control fails if block public access settings aren't enabled for the access point."
  severity      = "critical"
  query         = query.s3_access_point_restrict_public_access
  documentation = file("./foundational_security/docs/foundational_security_s3_19.md")

  tags = merge(local.foundational_security_s3_common_tags, {
    foundational_security_item_id  = "s3_19"
    foundational_security_category = "resource_not_publicly_accessible"
  })
}

control "foundational_security_s3_24" {
  title         = "24 S3 Multi-Region Access Points should have block public access settings enabled"
  description   = "This control checks whether an Amazon S3 Multi-Region Access Point has block public access settings enabled. The control fails when the Multi-Region Access Point doesn't have block public access settings enabled."
  severity      = "high"
  query         = query.s3_multi_region_access_point_public_access_blocked
  documentation = file("./foundational_security/docs/foundational_security_s3_24.md")

  tags = merge(local.foundational_security_s3_common_tags, {
    foundational_security_item_id  = "s3_24"
    foundational_security_category = "resources_not_publicly_accessible"
  })
}

control "foundational_security_s3_25" {
  title         = "25 S3 directory buckets should have lifecycle configurations"
  description   = "This control checks whether lifecycle rules are configured for an S3 directory bucket. The control fails if lifecycle rules aren't configured for the directory bucket, or a lifecycle rule for the bucket specifies expiration settings that don't match the parameter value that you optionally specify."
  severity      = "low"
  query         = query.s3_directory_bucket_lifecycle_policy_configured
  documentation = file("./foundational_security/docs/foundational_security_s3_25.md")

  tags = merge(local.foundational_security_s3_common_tags, {
    foundational_security_item_id  = "s3_25"
    foundational_security_category = "data_protection"
  })
}
