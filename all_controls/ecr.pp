locals {
  all_controls_ecr_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/ECR"
  })
}

benchmark "all_controls_ecr" {
  title       = "ECR"
  description = "This section contains recommendations for configuring ECR resources."
  children = [
    control.ecr_repository_image_scan_on_push_enabled,
    control.ecr_repository_lifecycle_policy_configured,
    control.ecr_repository_prohibit_public_access,
    control.ecr_repository_tag_immutability_enabled
  ]

  tags = merge(local.all_controls_ecr_common_tags, {
    type = "Benchmark"
  })
}
