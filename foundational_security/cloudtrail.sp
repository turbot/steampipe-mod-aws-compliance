locals {
  foundational_security_cloudtrail_common_tags = merge(local.foundational_security_common_tags, {
    service = "cloudtrail"
  })
}

benchmark "foundational_security_cloudtrail" {
  title         = "CloudTrail"
  #documentation = file("./foundational_security/docs/foundational_security_cloudtrail.md")
  children = [
    control.foundational_security_cloudtrail_1,
    control.foundational_security_cloudtrail_2
  ]
  tags          = local.foundational_security_cloudtrail_common_tags
}

control "foundational_security_cloudtrail_1" {
  title         = "1 CloudTrail should be enabled and configured with at least one multi-Region trail"
  description   = "This control checks that there is at least one multi-Region CloudTrail trail."
  severity      = "high"
  sql           = query.cloudtrail_atleast_one_multi_regional_trail.sql
  #documentation = file("./foundational_security/docs/foundational_security_cloudtrail_1.md")

  tags = merge(local.foundational_security_cloudtrail_common_tags, {
    foundational_security_item_id  = "cloudtrail_1"
    #foundational_security_category = "logging"
  })
}

control "foundational_security_cloudtrail_2" {
  title         = "2 CloudTrail should have encryption at rest enabled"
  description   = "This control checks whether CloudTrail is configured to use the server-side encryption (SSE) AWS Key Management Service customer master key (CMK) encryption. The check passes if the KmsKeyId is defined."
  severity      = "medium"
  sql           = query.cloudtrail_logs_encrypted_with_kms_cmk.sql
  #documentation = file("./foundational_security/docs/foundational_security_cloudtrail_2.md")

  tags = merge(local.foundational_security_cloudtrail_common_tags, {
    foundational_security_item_id  = "cloudtrail_2"
    #foundational_security_category = "encryption_of_data_at_rest"
  })
}
