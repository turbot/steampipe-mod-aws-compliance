locals {
  all_controls_glue_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/Glue"
  })
}

benchmark "all_controls_glue" {
  title       = "Glue"
  description = "This section contains recommendations for configuring Glue resources."
  children = [
    control.glue_connection_ssl_enabled,
    control.glue_data_catalog_encryption_settings_metadata_encryption_enabled,
    control.glue_data_catalog_encryption_settings_password_encryption_enabled,
    control.glue_dev_endpoint_cloudwatch_logs_encryption_enabled,
    control.glue_dev_endpoint_job_bookmarks_encryption_enabled,
    control.glue_dev_endpoint_s3_encryption_enabled,
    control.glue_job_bookmarks_encryption_enabled,
    control.glue_job_cloudwatch_logs_encryption_enabled,
    control.glue_job_s3_encryption_enabled,
    control.glue_ml_transform_encryption_at_rest_enabled,
    control.glue_spark_job_runs_on_version_3_or_higher,
  ]

  tags = merge(local.all_controls_glue_common_tags, {
    type = "Benchmark"
  })
}
