locals {
  conformance_pack_eks_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/EKS"
  })
}

control "eks_cluster_secrets_encrypted" {
  title       = "EKS clusters should be configured to have kubernetes secrets encrypted using KMS"
  description = "Ensure that AWS Elastic Kubernetes Service clusters are configured to have Kubernetes secrets encrypted using AWS Key Management Service (KMS) keys."
  query       = query.eks_cluster_secrets_encrypted

  tags = merge(local.conformance_pack_eks_common_tags, {
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
  })
}

control "eks_cluster_endpoint_restrict_public_access" {
  title       = "EKS clusters endpoint should restrict public access"
  description = "Ensure whether AWS Elastic Kubernetes Service (AWS EKS) endpoint is not publicly accessible. The rule is compliant if the endpoint is publicly accessible."
  query       = query.eks_cluster_endpoint_restrict_public_access

  tags = merge(local.conformance_pack_eks_common_tags, {
    cis_controls_v8_ig1 = "true"
    nist_800_171_rev_2  = "true"
    nist_csf            = "true"
    pci_dss_v321        = "true"
    pci_dss_v40         = "true"
  })
}

control "eks_cluster_control_plane_audit_logging_enabled" {
  title       = "EKS clusters should have control plane audit logging enabled"
  description = "AWS EKS clusters should have control plane audit logging enabled. These logs make it easy to secure and run clusters."
  query       = query.eks_cluster_control_plane_audit_logging_enabled

  tags = merge(local.conformance_pack_eks_common_tags, {
    acsc_essential_eight = "true"
    pci_dss_v40          = "true"
  })
}

control "eks_cluster_no_default_vpc" {
  title       = "EKS clusters should not be configured within a default VPC"
  description = "Ensure to configure a new VPC for your EKS cluster as default VPC comes with a default configuration that lacks the proper security controls. Your network should be well configured and should follow the least privilege principle, meaning only the necessary privileges are granted."
  query       = query.eks_cluster_no_default_vpc

  tags = local.conformance_pack_eks_common_tags
}

control "eks_cluster_with_latest_kubernetes_version" {
  title       = "EKS clusters should run on a supported Kubernetes version"
  description = "This control checks whether an AWS EKS cluster is running on a supported Kubernetes version. The control fails if the EKS cluster is running on an unsupported version. If your application doesn't require a specific version of Kubernetes, we recommend that you use the latest available Kubernetes version that's supported by EKS for your clusters."
  query       = query.eks_cluster_with_latest_kubernetes_version

  tags = merge(local.conformance_pack_eks_common_tags, {
    acsc_essential_eight = "true"
    nist_csf             = "true"
    pci_dss_v321         = "true"
    pci_dss_v40          = "true"
  })
}

control "eks_cluster_endpoint_public_access_restricted" {
  title       = "EKS clusters endpoint public access should be restricted"
  description = "EKS clusters endpoint with private access allows communication between your nodes and the API server stays within. This control is non-compliant if clusters endpoint public access is enabled as cluster API server is accessible from the internet."
  query       = query.eks_cluster_endpoint_public_access_restricted

  tags = local.conformance_pack_eks_common_tags
}

control "eks_cluster_no_multiple_security_groups" {
  title       = "EKS clusters should not use multiple security groups"
  description = "This controls ensures that EKS clusters is not using multiple security groups."
  query       = query.eks_cluster_no_multiple_security_groups

  tags = local.conformance_pack_eks_common_tags
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
        e -> 'Resources' @> '["secrets"]'
    ),
    eks_encryption_status as (
      select
        a.arn,
        a.title,
        a.encryption_config,
        a.version,
        a.tags,
        a.region,
        a.account_id,
        a._ctx,
        cast(split_part(a.version, '.', 1) as integer) as major_version,
        cast(split_part(a.version, '.', 2) as integer) as minor_version,
        b.arn as encrypted
      from
        aws_eks_cluster as a
        left join eks_secrets_encrypted as b on a.arn = b.arn
    )
    select
      arn as resource,
      case
        when major_version > 1 then 'ok'
        when major_version = 1 and minor_version >= 28 then 'ok'
        when encryption_config is null then 'alarm'
        when encrypted is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when major_version > 1 then title || ' uses Kubernetes version ' || version || ' with default envelope encryption.'
        when major_version = 1 and minor_version >= 28 then title || ' uses Kubernetes version ' || version || ' with default envelope encryption.'
        when encryption_config is null then title || ' encryption not enabled.'
        when encrypted is not null then title || ' encrypted with EKS secrets.'
        else title || ' not encrypted with EKS secrets.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      eks_encryption_status;
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
        and (log -> 'Types') @> '["audit"]'
    )
    select
      c.arn as resource,
      case
        when l.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when l.arn is not null then title || ' control plane audit logging enabled.'
        else title || ' control plane audit logging disabled.'
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

query "eks_cluster_no_multiple_security_groups" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when jsonb_array_length(resources_vpc_config -> 'SecurityGroupIds') > 1 then 'alarm'
        else 'ok'
      end as status,
        title || ' has '|| jsonb_array_length(resources_vpc_config -> 'SecurityGroupIds') || ' security group(s).' as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_eks_cluster;
  EOQ
}
