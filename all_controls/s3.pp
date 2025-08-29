locals {
  all_controls_s3_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/S3"
  })
}

benchmark "all_controls_s3" {
  title       = "S3"
  description = "This section contains recommendations for configuring S3 resources."
  children = [
    control.s3_access_point_restrict_public_access,
    control.s3_bucket_acls_should_prohibit_user_access,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_enforces_ssl,
    control.s3_bucket_event_notifications_enabled,
    control.s3_bucket_lifecycle_policy_enabled,
    control.s3_bucket_logging_enabled,
    control.s3_bucket_mfa_delete_enabled,
    control.s3_bucket_not_accessible_to_all_authenticated_user,
    control.s3_bucket_object_lock_enabled,
    control.s3_bucket_object_logging_enabled,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_policy_restricts_cross_account_permission_changes,
    control.s3_bucket_protected_by_macie,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_bucket_static_website_hosting_disabled,
    control.s3_bucket_versioning_and_lifecycle_policy_enabled,
    control.s3_bucket_versioning_enabled,
    control.s3_directory_bucket_lifecycle_policy_configured,
    control.s3_multi_region_access_point_public_access_blocked,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket_account,
    control.s3_public_access_block_bucket
  ]

  tags = merge(local.all_controls_s3_common_tags, {
    type = "Benchmark"
  })
}
