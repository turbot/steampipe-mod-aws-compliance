benchmark "nist_cyber_security_pr_ds_5" {
  title       = "PR.DS-5"
  description = "Protections against data leaks are implemented."

  children = [
    control.cloudtrail_multi_region_trail_enabled.sql,
    control.cloudtrail_s3_data_events_enabled.sql,
    control.cloudtrail_trail_enabled.sql,
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values.sql,
    control.dms_replication_instance_not_publicly_accessible.sql,
    control.ebs_snapshot_not_publicly_restorable.sql,
    control.elb_application_classic_lb_logging_enabled.sql,
    control.guardduty_enabled.sql,
    control.lambda_function_restrict_public_access.sql,
    control.rds_db_instance_prohibit_public_access.sql,
    control.rds_db_snapshot_prohibit_public_access.sql,
    control.redshift_cluster_prohibit_public_access.sql,
    control.s3_bucket_logging_enabled.sql,
    control.s3_public_access_block_account.sql,
    control.s3_bucket_restrict_public_read_access.sql,
    control.s3_bucket_restrict_public_write_access.sql,
    control.sagemaker_notebook_instance_direct_internet_access_disabled.sql,
    control.securityhub_enabled.sql,
    control.vpc_flow_logs_enabled.sql,
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "pr_ds_5"
  })
}