locals {
  common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_312_c_1"
  })
}

benchmark "hipaa_164_312_c_1" {
  title       = "164.312(c)(1) Integrity"
  description = "Implement policies and procedures to protect electronic protected health information from improper alteration or destruction."
  children = [
    control.cloudtrail_trail_validation_enabled,
    control.s3_bucket_object_lock_enabled,
    control.s3_bucket_versioning_enabled
  ]
  tags = local.common_tags
}