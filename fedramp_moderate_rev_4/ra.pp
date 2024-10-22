benchmark "fedramp_moderate_rev_4_ra" {
  title       = benchmark.nist_800_53_rev_4_ra.title
  description = benchmark.nist_800_53_rev_4_ra.description
  children = [
    benchmark.fedramp_moderate_rev_4_ra_5
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ra_5" {
  title       = benchmark.nist_800_53_rev_4_ra_5.title
  description = benchmark.nist_800_53_rev_4_ra_5.description
  children = [
    control.guardduty_enabled,
    control.guardduty_finding_archived
  ]

  tags = merge(local.fedramp_moderate_rev_4_common_tags, {
    service  = "AWS/GuardDuty"
  })
}