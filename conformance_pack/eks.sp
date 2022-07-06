locals {
  conformance_pack_eks_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/EKS"
  })
}

control "eks_cluster_secrets_encrypted" {
  title       = "EKS clusters should be configured to have kubernetes secrets encrypted using KMS"
  description = "Ensure if Amazon Elastic Kubernetes Service clusters are configured to have Kubernetes secrets encrypted using AWS Key Management Service (KMS) keys."
  sql         = query.eks_cluster_secrets_encrypted.sql

  tags = merge(local.conformance_pack_eks_common_tags, {
    hipaa = "true"
  })
}

control "eks_cluster_endpoint_restrict_public_access" {
  title       = "EKS clusters endpoint should restrict public access"
  description = "Ensure whether Amazon Elastic Kubernetes Service (Amazon EKS) endpoint is not publicly accessible. The rule is complaint if the endpoint is publicly accessible."
  sql         = query.eks_cluster_endpoint_restrict_public_access.sql

  tags = merge(local.conformance_pack_eks_common_tags, {
    nist_csf = "true"
  })
}

control "eks_cluster_control_plane_audit_logging_enabled" {
  title       = "EKS clusters should have control plane audit logging enabled"
  description = "Amazon EKS clusters should have control plane audit logging enabled. These logs make it easy to secure and run clusters."
  sql         = query.eks_cluster_control_plane_audit_logging_enabled.sql

  tags = merge(local.conformance_pack_eks_common_tags, {
    other_checks = "true"
  })
}

control "eks_cluster_no_default_vpc" {
  title       = "EKS clusters should not be configured within a default VPC"
  description = "Ensure to configure a new VPC for your EKS cluster as default VPC comes with a default configuration that lacks the proper security controls. Your network should be well configured and should follow the least privilege principle, meaning only the necessary privileges are granted."
  sql         = query.eks_cluster_no_default_vpc.sql

  tags = merge(local.conformance_pack_eks_common_tags, {
    other_checks = "true"
  })
}
