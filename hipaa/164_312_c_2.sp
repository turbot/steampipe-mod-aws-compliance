locals {
  common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_312_c_2"
  })
}

benchmark "hipaa_164_312_c_2" {
  title       = "164.312(c)(2) Mechanism to authenticate electronic protected health information"
  description = "Implement electronic mechanisms to corroborate that electronic protected health information has not been altered or destroyed in an unauthorized manner."
  children = [
    control.cloudtrail_trail_validation_enabled,
    control.s3_bucket_object_lock_enabled,
    control.s3_bucket_versioning_enabled
  ]
  tags = local.common_tags
}