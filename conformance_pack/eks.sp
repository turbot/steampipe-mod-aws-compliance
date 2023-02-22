locals {
  conformance_pack_eks_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/EKS"
  })
}

control "eks_cluster_secrets_encrypted" {
  title       = "EKS clusters should be configured to have kubernetes secrets encrypted using KMS"
  description = "Ensure if Amazon Elastic Kubernetes Service clusters are configured to have Kubernetes secrets encrypted using AWS Key Management Service (KMS) keys."
  query       = query.eks_cluster_secrets_encrypted

  tags = merge(local.conformance_pack_eks_common_tags, {
    gxp_eu_annex_11 = "true"
    hipaa           = "true"
  })
}

control "eks_cluster_endpoint_restrict_public_access" {
  title       = "EKS clusters endpoint should restrict public access"
  description = "Ensure whether Amazon Elastic Kubernetes Service (Amazon EKS) endpoint is not publicly accessible. The rule is compliant if the endpoint is publicly accessible."
  query       = query.eks_cluster_endpoint_restrict_public_access

  tags = merge(local.conformance_pack_eks_common_tags, {
    cis                = "true"
    nist_800_171_rev_2 = "true"
    nist_csf           = "true"
  })
}

control "eks_cluster_control_plane_audit_logging_enabled" {
  title       = "EKS clusters should have control plane audit logging enabled"
  description = "Amazon EKS clusters should have control plane audit logging enabled. These logs make it easy to secure and run clusters."
  query       = query.eks_cluster_control_plane_audit_logging_enabled

  tags = merge(local.conformance_pack_eks_common_tags, {
    other_checks = "true"
  })
}

control "eks_cluster_no_default_vpc" {
  title       = "EKS clusters should not be configured within a default VPC"
  description = "Ensure to configure a new VPC for your EKS cluster as default VPC comes with a default configuration that lacks the proper security controls. Your network should be well configured and should follow the least privilege principle, meaning only the necessary privileges are granted."
  query       = query.eks_cluster_no_default_vpc

  tags = merge(local.conformance_pack_eks_common_tags, {
    other_checks = "true"
  })
}
