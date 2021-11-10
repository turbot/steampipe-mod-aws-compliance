locals {
  conformance_pack_eks_common_tags = {
    service = "eks"
  }
}

control "eks_cluster_secrets_encrypted" {
  title       = "EKS clusters should be configured to have kubernetes secrets encrypted using KMS"
  description = "Ensure if Amazon Elastic Kubernetes Service clusters are configured to have Kubernetes secrets encrypted using AWS Key Management Service (KMS) keys."
  sql         = query.eks_cluster_secrets_encrypted.sql

  tags = merge(local.conformance_pack_eks_common_tags, {
    hipaa = "true"
  })
}