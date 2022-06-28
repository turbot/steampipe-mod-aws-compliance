locals {
  extra_checks_eks_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_eks" {
  title       = "EKS"
  description = "This benchmark contains additional checks for AWS EKS service, these checks are out of the scope of any predefined benchmarks for AWS."
  children = [
    control.eks_cluster_control_plane_audit_logging_enabled
  ]

  tags = local.extra_checks_eks_common_tags
}

