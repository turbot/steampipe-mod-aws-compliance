locals {
  all_controls_eks_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/EKS"
  })
}

benchmark "all_controls_eks" {
  title       = "EKS"
  description = "This section contains recommendations for configuring EKS resources."
  children = [
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.eks_cluster_endpoint_public_access_restricted,
    control.eks_cluster_endpoint_restrict_public_access,
    control.eks_cluster_no_default_vpc,
    control.eks_cluster_no_multiple_security_groups,
    control.eks_cluster_secrets_encrypted,
    control.eks_cluster_with_latest_kubernetes_version
  ]

  tags = merge(local.all_controls_eks_common_tags, {
    type = "Benchmark"
  })
}
