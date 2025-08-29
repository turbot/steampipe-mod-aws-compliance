locals {
  all_controls_inspector_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/Inspector"
  })
}

benchmark "all_controls_inspector" {
  title       = "Inspector"
  description = "This section contains recommendations for configuring Inspector resources."
  children = [
    control.inspector_ec2_scanning_enabled,
    control.inspector_ecr_scanning_enabled,
    control.inspector_lambda_code_scanning_enabled,
    control.inspector_lambda_scanning_enabled
  ]

  tags = merge(local.all_controls_inspector_common_tags, {
    type = "Benchmark"
  })
}
