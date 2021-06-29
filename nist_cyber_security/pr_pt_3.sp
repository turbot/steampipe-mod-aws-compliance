benchmark "nist_cyber_security_pr_pt_3" {
  title       = "PR.PT-3"
  description = "Access to systems and assets is controlled, incorporating the principle of least functionality."

  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_no_inline_attached_policies,
    control.lambda_function_restrict_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "pr_pt_3"
  })
}
