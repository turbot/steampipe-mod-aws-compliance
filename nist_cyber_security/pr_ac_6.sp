benchmark "nist_cyber_security_pr_ac_6" {
  title       = "PR.AC-6"
  description = "Identities are proofed and bound to credentials and asserted in interactions."

  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.emr_cluster_kerberos_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "pr_ac_6"
  })
}
