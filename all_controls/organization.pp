locals {
  all_controls_organization_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/Organizations"
  })
}

benchmark "all_controls_organization" {
  title       = "Organization"
  description = "This section contains recommendations for configuring Organization resources."
  children = [
    control.organizational_tag_policies_enabled
  ]

  tags = merge(local.all_controls_organization_common_tags, {
    type = "Benchmark"
  })
}
