locals {
  all_controls_common_tags = merge(local.azure_compliance_common_tags, {
    type = "Benchmark"
  })
}
benchmark "all_controls" {
  title       = "All Controls"
  description = "This benchmark contains all controls grouped by service to help you detect resource configurations that do not meet best practices."
  children = [
  ]

  tags = local.other_common_tags
}
