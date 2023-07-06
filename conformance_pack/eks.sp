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
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
  })
}

control "eks_cluster_endpoint_restrict_public_access" {
  title       = "EKS clusters endpoint should restrict public access"
  description = "Ensure whether Amazon Elastic Kubernetes Service (Amazon EKS) endpoint is not publicly accessible. The rule is compliant if the endpoint is publicly accessible."
  query       = query.eks_cluster_endpoint_restrict_public_access

  tags = merge(local.conformance_pack_eks_common_tags, {
    cis_controls_v8_ig1 = "true"
    nist_800_171_rev_2  = "true"
    nist_csf            = "true"
    pci_dss_v321        = "true"
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

control "eks_cluster_with_latest_kubernetes_version" {
  title       = "EKS clusters should run on a supported Kubernetes version"
  description = "This control checks whether an Amazon EKS cluster is running on a supported Kubernetes version. The control fails if the EKS cluster is running on an unsupported version. If your application doesn't require a specific version of Kubernetes, we recommend that you use the latest available Kubernetes version that's supported by EKS for your clusters."
  query       = query.eks_cluster_with_latest_kubernetes_version

  tags = merge(local.conformance_pack_eks_common_tags, {
    nist_csf     = "true"
    pci_dss_v321 = "true"
  })
}

control "eks_cluster_endpoint_public_access_restricted" {
  title       = "EKS clusters endpoint public access should be restricted"
  description = "EKS clusters endpoint with private access allows communication between your nodes and the API server stays within. This control is non-compliant if clusters endpoint public access is enabled as cluster API server is accessible from the internet."
  query       = query.eks_cluster_endpoint_public_access_restricted

  tags = merge(local.conformance_pack_eks_common_tags, {
    other_checks = "true"
  })
}

query "eks_cluster_secrets_encrypted" {
  sql = <<-EOQ
    with eks_secrets_encrypted as (
      select
        distinct arn as arn
      from
        aws_eks_cluster,
        jsonb_array_elements(encryption_config) as e
      where
        e -> 'Resources'  @> '["secrets"]'
    )
    select
      a.arn as resource,
      case
        when encryption_config is null then 'alarm'
        when b.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when encryption_config is null then a.title || ' encryption not enabled.'
        when b.arn is not null then a.title || ' encrypted with EKS secrets.'
        else a.title || ' not encrypted with EKS secrets.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_eks_cluster as a
      left join eks_secrets_encrypted as b on a.arn = b.arn;
  EOQ
}

query "eks_cluster_endpoint_restrict_public_access" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when resources_vpc_config ->> 'EndpointPublicAccess' = 'true' then 'alarm'
        else 'ok'
      end as status,
      case
        when resources_vpc_config ->> 'EndpointPublicAccess' = 'true' then title || ' endpoint publicly accessible.'
        else title || ' endpoint not publicly accessible.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_eks_cluster;
  EOQ
}

query "eks_cluster_control_plane_audit_logging_enabled" {
  sql = <<-EOQ
    with control_panel_audit_logging as (
      select
        distinct arn,
        log -> 'Types' as log_type
      from
        aws_eks_cluster,
        jsonb_array_elements(logging -> 'ClusterLogging') as log
      where
        log ->> 'Enabled' = 'true'
        and (log -> 'Types') @> '["api", "audit", "authenticator", "controllerManager", "scheduler"]'
    )
    select
      c.arn as resource,
      case
        when l.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when l.arn is not null then c.title || ' control plane audit logging enabled for all log types.'
        else
          case when logging -> 'ClusterLogging' @> '[{"Enabled": true}]' then c.title || ' control plane audit logging not enabled for all log types.'
          else c.title || ' control plane audit logging not enabled.'
          end
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
    from
      aws_eks_cluster as c
      left join control_panel_audit_logging as l on l.arn = c.arn;
  EOQ
}

query "eks_cluster_no_default_vpc" {
  sql = <<-EOQ
    with default_vpc_cluster as (
      select
        distinct c.arn
      from
        aws_eks_cluster as c
        left join aws_vpc as v on v.vpc_id = c.resources_vpc_config ->> 'VpcId'
      where
        v.is_default
    )
    select
      c.arn as resource,
      case
        when v.arn is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when v.arn is not null then title || ' uses default VPC.'
        else title || ' does not use default VPC.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
    from
      aws_eks_cluster as c
      left join default_vpc_cluster as v on v.arn = c.arn;
  EOQ
}

query "eks_cluster_with_latest_kubernetes_version" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        -- eks:oldestVersionSupported (Current oldest supported version is 1.19)
        when (version)::decimal >= 1.19 then 'ok'
        else 'alarm'
      end as status,
      case
        when (version)::decimal >= 1.19 then title || ' runs on a supported kubernetes version.'
        else title || ' does not run on a supported kubernetes version.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_eks_cluster;
  EOQ
}

query "eks_cluster_endpoint_public_access_restricted" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when resources_vpc_config ->> 'EndpointPrivateAccess' = 'true' and resources_vpc_config ->> 'EndpointPublicAccess' = 'false' then 'ok'
        when resources_vpc_config ->> 'EndpointPublicAccess' = 'true' and resources_vpc_config -> 'PublicAccessCidrs' @> '["0.0.0.0/0"]' then 'alarm'
        else 'ok'
      end as status,
      case
        when resources_vpc_config ->> 'EndpointPrivateAccess' = 'true' and resources_vpc_config ->> 'EndpointPublicAccess' = 'false' then title || ' endpoint access is private.'
        when resources_vpc_config ->> 'EndpointPublicAccess' = 'true' and resources_vpc_config -> 'PublicAccessCidrs' @> '["0.0.0.0/0"]' then title || ' endpoint access is public.'
        else title || ' endpoint public access is restricted.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_eks_cluster;
  EOQ
}