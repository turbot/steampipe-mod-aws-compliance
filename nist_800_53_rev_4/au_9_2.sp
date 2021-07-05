benchmark "nist_800_53_rev_4_au_9_2" {
  title       = "AU-9(2) Audit Backup On Separate Physical Systems / Components"
  description = "The information system backs up audit records [Assignment: organization-defined frequency] onto a physically different system or system component than the system or component being audited."
  children = [
    control.s3_bucket_cross_region_replication_enabled,
  ]

  tags = local.nist_800_53_rev_4_common_tags
}