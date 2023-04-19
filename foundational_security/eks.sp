locals {
  foundational_security_eks_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/EKS"
  })
}

benchmark "foundational_security_eks" {
  title         = "EKS"
  documentation = file("./foundational_security/docs/foundational_security_eks.md")
  children = [
    control.foundational_security_eks_1,
    control.foundational_security_eks_2
  ]

  tags = merge(local.foundational_security_eks_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_eks_1" {
  title         = "1 EKS cluster endpoints should not be publicly accessible"
  description   = "This control checks whether an Amazon EKS cluster endpoint is publicly accessible. The control fails if an EKS cluster has an endpoint that is publicly accessible."
  severity      = "high"
  query         = query.eks_cluster_endpoint_restrict_public_access
  documentation = file("./foundational_security/docs/foundational_security_eks_1.md")

  tags = merge(local.foundational_security_eks_common_tags, {
    foundational_security_item_id  = "eks_1"
    foundational_security_category = "secure_access_management"
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
