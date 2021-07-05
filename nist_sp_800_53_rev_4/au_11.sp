benchmark "nist_sp_800_53_rev4_au_11" {
  title       = "AU-11 Audit Record Retention"
  description = "The organization retains audit records for [Assignment: organization-defined time period consistent with records retention policy] to provide support for after-the-fact investigations of security incidents and to meet regulatory and organizational information retention requirements."
  children = [
    control.cloudwatch_log_group_retention_period_365,
  ]

  tags = local.nist_sp_800_53_rev4_common_tags
}