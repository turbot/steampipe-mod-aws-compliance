benchmark "nist_cyber_security_pr_ds_5" {
  title       = "PR.DS-5"
  description = "Protections against data leaks are implemented."

  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.elb_application_classic_lb_logging_enabled,
    control.guardduty_enabled,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_logging_enabled,
    control.s3_public_access_block_account,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.securityhub_enabled,
    control.vpc_flow_logs_enabled,
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "pr_ds_5"
  })
}