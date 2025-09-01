locals {
  foundational_security_glue_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/Glue"
  })
}

benchmark "foundational_security_glue" {
  title         = "Glue"
  documentation = file("./foundational_security/docs/foundational_security_glue.md")
  children = [
    control.foundational_security_glue_3,
    control.foundational_security_glue_4
  ]

  tags = merge(local.foundational_security_glue_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_glue_3" {
  title         = "3 AWS Glue machine learning transforms should be encrypted at rest"
  description   = "This control checks whether an AWS Glue machine learning transform is encrypted at rest. The control fails if the machine learning transform isn't encrypted at rest."
  severity      = "medium"
  query         = query.glue_ml_transform_encryption_at_rest_enabled
  documentation = file("./foundational_security/docs/foundational_security_glue_3.md")

  tags = merge(local.foundational_security_glue_common_tags, {
    foundational_security_item_id  = "glue_3"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

control "foundational_security_glue_4" {
  title         = "4 AWS Glue Spark jobs should run on supported versions of AWS Glue"
  description   = "This control checks whether an AWS Glue for Spark job is configured to run on a supported version of AWS Glue. The control fails if the Spark job is configured to run on a version of AWS Glue that's earlier than the minimum supported version."
  severity      = "medium"
  query         = query.glue_spark_job_runs_on_version_3_or_higher
  documentation = file("./foundational_security/docs/foundational_security_glue_4.md")

  tags = merge(local.foundational_security_glue_common_tags, {
    foundational_security_item_id  = "glue_4"
    foundational_security_category = "vulnerability_patch_and_version_management"
  })
}