benchmark "nist_800_53_rev_5_mp" {
  title       = "Media Protection (MP)"
  description = "The Media Protection control family includes controls specific to access, marking, storage, transport policies, sanitization, and defined organizational media use."
  children = [
    benchmark.nist_800_53_rev_5_mp_2
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_mp_2" {
  title       = "Media Access (MP-2)"
  description = "Restrict access to [Assignment: organization-defined types of digital and/or non-digital media] to [Assignment: organization-defined personnel or roles]."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.ec2_instance_uses_imdsv2,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}