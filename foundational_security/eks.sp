locals {
  foundational_security_eks_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/EKS"
  })
}

benchmark "foundational_security_eks" {
  title         = "EKS"
  documentation = file("./foundational_security/docs/foundational_security_eks.md")
  children = [
    control.foundational_security_eks_2
  ]

  tags = merge(local.foundational_security_eks_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_eks_2" {
  title         = "2 EKS clusters should run on a supported Kubernetes version"
  description   = "This control checks whether an Amazon EKS cluster is running on a supported Kubernetes version. The control fails if the EKS cluster is running on an unsupported version. If your application doesn't require a specific version of Kubernetes, we recommend that you use the latest available Kubernetes version that's supported by EKS for your clusters."
  severity      = "high"
  query         = query.eks_cluster_with_latest_kubernetes_version
  documentation = file("./foundational_security/docs/foundational_security_eks_2.md")

  tags = merge(local.foundational_security_eks_common_tags, {
    foundational_security_item_id  = "eks_2"
    foundational_security_category = "vulnerability_patch_and_version_management"
  })
}
