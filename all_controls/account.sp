locals {
  all_controls_account_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/Account"
  })
}

benchmark "all_controls_account" {
  title       = "Account"
  description = "This section contains recommendations for configuring Account resources."
  children = [
    control.account_alternate_contact_security_registered,
    control.account_part_of_organizations
  ]

  tags = merge(local.all_controls_account_common_tags, {
    type = "Benchmark"
  })
}
