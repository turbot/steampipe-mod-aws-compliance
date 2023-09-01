locals {
  all_controls_account_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/Account"
  })
}

benchmark "all_controls_account" {
  title       = "Account"
  description = "This section contains recommendations for configuring Account resources."
  children = [
    # TO DO
  ]

  tags = merge(local.all_controls_account_common_tags, {
    type = "Benchmark"
  })
}
