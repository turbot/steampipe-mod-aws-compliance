benchmark "cis_controls_v8_ig1_3" {
  title       = "Data Protection"
  description = "."
  children = [
    benchmark.cis_controls_v8_ig1_3_3,
    benchmark.cis_controls_v8_ig1_3_4
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}


benchmark "cis_controls_v8_ig1_3_3" {
  title       = "3.3 - Configure Data Access Control Lists"
  description = "Configure data access control lists based on a user’s need to know. Apply data access control lists, also known as access permissions, to local and remote file systems, databases, and applications."
  children = [
    control.cloudwatch_log_group_retention_period_365,
    control.autoscaling_launch_config_public_ip_disabled,
    control.ecs_task_definition_user_for_host_mode_check,
    control.vpc_subnet_auto_assign_public_ip_disabled,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.s3_bucket_restrict_public_write_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_public_access_block_account,
    control.s3_bucket_policy_restricts_cross_account_permission_changes,
    control.s3_public_access_block_bucket,
    control.redshift_cluster_prohibit_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.iam_root_user_no_access_keys,
    control.iam_user_no_inline_attached_policies,
    control.iam_policy_no_star_star,
    control.emr_cluster_master_nodes_no_public_ip,
    control.iam_user_in_group,
    control.es_domain_in_vpc,
    control.iam_all_policy_no_service_wild_card,
    control.ec2_instance_not_publicly_accessible,
    control.iam_group_user_role_no_inline_policies,
    control.iam_group_not_empty,
    control.emr_cluster_kerberos_enabled,
    control.ebs_snapshot_not_publicly_restorable,
    control.dms_replication_instance_not_publicly_accessible,
    control.ec2_instance_iam_profile_attached,
    control.ec2_instance_uses_imdsv2,
    # control.EBS_SNAPSHOT_SHARED_WITH_APPROVED_ACCOUNTS,
    control.eks_cluster_endpoint_restrict_public_access,
    # control.IAM_POLICY_IN_USE
    # control.IAM_ROLE_MANAGED_POLICY_CHECK
    control.ec2_instance_in_vpc,
    # control.PUBLIC_SUBNET_CHECK
    # control.SSM_DOCUMENT_NOT_PUBLIC
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_3_4" {
  title       = "3.4 - Enforce Data Retention"
  description = "Retain data according to the enterprise’s data management process. Data retention must include both minimum and maximum timelines."
  children = [
    control.cloudwatch_log_group_retention_period_365
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}