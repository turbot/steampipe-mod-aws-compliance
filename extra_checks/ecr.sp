locals {
  extra_checks_ecr_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_ecr" {
  title       = "ECR"
  description = "This benchmark contains additional checks for AWS ECR service, these checks are out of the scope of any predefined benchmarks for AWS."
  children = [
    control.ecr_repository_image_scan_on_push_enabled,
    control.ecr_repository_prohibit_public_access
  ]

  tags = local.extra_checks_ecr_common_tags
}
