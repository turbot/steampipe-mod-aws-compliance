benchmark "hipaa_164_312_a_1" {
  title       = "164.312(a)(1) Access control"
  description = "Implement technical policies and procedures for electronic information systems that maintain electronic protected health information to allow access only to those persons or software programs that have been granted access rights as specified in 164.308(a)(4)."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_kerberos_enabled,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.iam_group_not_empty,
    control.iam_policy_no_star_star,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_bucket_account,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.ec2_instance_uses_imdsv2,
    control.iam_group_user_role_no_inline_policies,
    control.iam_root_user_no_access_keys,
    control.iam_user_unused_credentials_90,
    control.iam_custom_policy_no_service_wild_card,
    control.vpc_subnet_auto_assign_public_ip_disabled,
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_source_repo_oauth_configured,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all
  ]

  tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_312_a_1"
  })
}