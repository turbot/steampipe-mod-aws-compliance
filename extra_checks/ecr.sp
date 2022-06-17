locals {
  extra_checks_ecr_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_ecr" {
  title       = "ECR Extra Checks"
  description = "TODO"
  children = [
    control.ecr_image_scan_on_push_enabled,
    control.ecr_repository_prohibit_public_access
  ]

  tags = local.extra_checks_ecr_common_tags
}
