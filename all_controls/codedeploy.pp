locals {
  all_controls_codedeploy_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/CodeDeploy"
  })
}

benchmark "all_controls_codedeploy" {
  title       = "CodeDeploy"
  description = "This section contains recommendations for configuring CodeDeploy resources."
  children = [
    control.codedeploy_deployment_group_lambda_allatonce_traffic_shift_disabled
  ]

  tags = merge(local.all_controls_codedeploy_common_tags, {
    type = "Benchmark"
  })
}
