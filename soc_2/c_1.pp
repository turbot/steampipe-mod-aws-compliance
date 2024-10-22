locals {
  soc_2_c_1_common_tags = merge(local.soc_2_common_tags, {
    soc_2_section_id = "c1"
  })
}

benchmark "soc_2_c_1" {
  title       = "C1 Additional Criterial for Confidentiality"
  description = "The Confidentiality category refers that all confidential material and information should be sufficiently protected—this includes private customer data."

  children = [
    benchmark.soc_2_c_1_1,
    benchmark.soc_2_c_1_2
  ]

  tags = local.soc_2_c_1_common_tags
}

benchmark "soc_2_c_1_1" {
  title         = "C1.1 The entity identifies and maintains confidential information to meet the entity’s objectives related to confidentiality"
  documentation = file("./soc_2/docs/c_1_1.md")

  children = [
    control.rds_db_instance_deletion_protection_enabled,
    control.s3_bucket_object_lock_enabled,
    control.s3_bucket_versioning_and_lifecycle_policy_enabled
  ]

  tags = merge(local.soc_2_c_1_common_tags, {
    soc_2_item_id = "c1.1"
    soc_2_type    = "automated"
  })
}

benchmark "soc_2_c_1_2" {
  title         = "C1.2 The entity disposes of confidential information to meet the entity’s objectives related to confidentiality"
  documentation = file("./soc_2/docs/c_1_2.md")

  children = [
    control.s3_bucket_lifecycle_policy_enabled,
    control.s3_bucket_versioning_enabled
  ]

  tags = merge(local.soc_2_c_1_common_tags, {
    service       = "AWS/S3"
    soc_2_item_id = "c1.2"
    soc_2_type    = "automated"
  })
}
