locals {
  hipaa_164_312_c_2_common_tags = merge(local.hipaa_common_tags, {
    hipaa_control_id = "hipaa_164_312_c_2"
  })
}

benchmark "hipaa_164_312_c_2" {
  title         = "164.312(c)(1)"
  #documentation = file("./hipaa/docs/hipaa_164_312_c_2.md")
  children = [
    control.hipaa_164_312_c_2_cloudtrail_log_file_validation_enabled,
    control.hipaa_164_312_c_2_s3_bucket_object_lock_enabled,
    control.hipaa_164_312_c_2_s3_bucket_versioning_enabled
  ]
  tags = local.hipaa_164_312_c_2_common_tags
}

control "hipaa_164_312_c_2_cloudtrail_log_file_validation_enabled" {
  title         = "CloudTrail log file validation should be enabled"
  description   = "Utilize AWS CloudTrail log file validation to check the integrity of CloudTrail logs."
  sql           = query.cloudtrail_validation_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_c_2_cloudtrail_log_file_validation_enabled.md")

  tags = merge(local.hipaa_164_312_c_2_common_tags, {
    hipaa_item_id = "hipaa_164_312_c_2_cloudtrail_log_file_validation_enabled"
  })
}

control "hipaa_164_312_c_2_s3_bucket_object_lock_enabled" {
  title         = "CloudTrail log file validation should be enabled"
  description   = "Utilize AWS CloudTrail log file validation to check the integrity of CloudTrail logs."
  sql           = query.s3_bucket_object_lock_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_c_2_s3_bucket_object_lock_enabled.md")

  tags = merge(local.hipaa_164_312_c_2_common_tags, {
    hipaa_item_id = "hipaa_164_312_c_2_s3_bucket_object_lock_enabled"
  })
}

control "hipaa_164_312_c_2_s3_bucket_versioning_enabled" {
  title         = "S3 bucket versioning should be enabled"
  description   = "Amazon Simple Storage Service (Amazon S3) bucket versioning helps keep multiple variants of an object in the same Amazon S3 bucket."
  sql           = query.s3_bucket_versioning_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_c_2_s3_bucket_versioning_enabled.md")

  tags = merge(local.hipaa_164_312_c_2_common_tags, {
    hipaa_item_id = "hipaa_164_312_c_2_s3_bucket_versioning_enabled"
  })
}