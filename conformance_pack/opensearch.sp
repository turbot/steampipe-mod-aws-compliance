locals {
  conformance_pack_opensearch_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/OpenSearch"
  })
}

control "opensearch_domain_encryption_at_rest_enabled" {
  title       = "OpenSearch domains should have encryption at rest enabled"
  description = "This control checks whether Amazon OpenSearch domains have encryption-at-rest configuration enabled. The check fails if encryption at rest is not enabled."
  query       = query.opensearch_domain_encryption_at_rest_enabled

  tags = merge(local.conformance_pack_opensearch_common_tags, {
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
  })
}

control "opensearch_domain_fine_grained_access_enabled" {
  title       = "OpenSearch domains should have fine-grained access control enabled"
  description = "This control checks whether OpenSearch domains have fine-grained access control enabled. The control fails if the fine-grained access control is not enabled. Fine-grained access control requires advanced-security-optionsin the OpenSearch parameter update-domain-config to be enabled."
  query       = query.opensearch_domain_fine_grained_access_enabled

  tags = merge(local.conformance_pack_opensearch_common_tags, {
    nist_csf     = "true"
    pci_dss_v321 = "true"
  })
}

control "opensearch_domain_https_required" {
  title       = "OpenSearch domains should use HTTPS"
  description = "This control checks whether connections to OpenSearch domains are using HTTPS. The rule is non compliant if the OpenSearch domain 'EnforceHTTPS' is not 'true' or is 'true' and 'TLSSecurityPolicy' is not in 'tlsPolicies'."
  query       = query.opensearch_domain_https_required

  tags = merge(local.conformance_pack_opensearch_common_tags, {
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
  })
}

control "opensearch_domain_audit_logging_enabled" {
  title       = "OpenSearch domains should have audit logging enabled."
  description = "This control checks whether OpenSearch service domains have audit logging enabled. The rule is non compliant if an OpenSearch service domain does not have audit logging enabled."
  query       = query.opensearch_domain_audit_logging_enabled

  tags = merge(local.conformance_pack_opensearch_common_tags, {
    gxp_21_cfr_part_11 = "true"
    nist_csf           = "true"
    pci_dss_v321       = "true"
    soc_2              = "true"
  })
}

control "opensearch_domain_logs_to_cloudwatch" {
  title       = "OpenSearch domains logs to Amazon CloudWatch Logs"
  description = "This control checks whether Amazon OpenSearch Service domains are configured to send logs to CloudWatch logs. The rule is non compliant if logging is not configured."
  query       = query.opensearch_domain_logs_to_cloudwatch

  tags = merge(local.conformance_pack_opensearch_common_tags, {
    gxp_21_cfr_part_11 = "true"
    nist_csf           = "true"
    pci_dss_v321       = "true"
    soc_2              = "true"
  })
}

control "opensearch_domain_node_to_node_encryption_enabled" {
  title       = "OpenSearch domains node-to-node encryption should be enabled"
  description = "This control checks if Amazon OpenSearch Service nodes are encrypted end to end. The rule is non compliant if the node-to-node encryption is not enabled on the domain."
  query       = query.opensearch_domain_node_to_node_encryption_enabled

  tags = merge(local.conformance_pack_opensearch_common_tags, {
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_csf                               = "true"
  })
}

control "opensearch_domain_in_vpc" {
  title       = "OpenSearch domains should be in a VPC"
  description = "This control checks whether Amazon OpenSearch domains are in a VPC. It does not evaluate the VPC subnet routing configuration to determine public access."
  query       = query.opensearch_domain_in_vpc

  tags = merge(local.conformance_pack_opensearch_common_tags, {
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_csf                               = "true"
  })
}

control "opensearch_domain_cognito_authentication_enabled_for_kibana" {
  title       = "OpenSearch domains cognito authentication should be enabled for kibana"
  description = "This control checks whether Amazon OpenSearch domain has Amazon Cognito authentication for Kibana enabled. Amazon Cognito lets you easily add user sign-up and authentication to your mobile and web apps."
  query       = query.opensearch_domain_cognito_authentication_enabled_for_kibana

  tags = merge(local.conformance_pack_opensearch_common_tags, {
    other_checks = "true"
  })
}

control "opensearch_domain_internal_user_database_disabled" {
  title       = "OpenSearch domains internal user database should be disabled"
  description = "Ensure that Amazon OpenSearch domain has internal user database disabled. This control is non compliant if the OpenSearch domain internal user database is enabled."
  query       = query.opensearch_domain_internal_user_database_disabled

  tags = merge(local.conformance_pack_opensearch_common_tags, {
    other_checks = "true"
  })
}

control "opensearch_domain_updated_with_latest_service_software_version" {
  title       = "OpenSearch domains should be updated to the latest service software version"
  description = "This control checks whether Amazon OpenSearch domain has any updates available. This control is non compliant if the OpenSearch domain has any updates available."
  query       = query.opensearch_domain_updated_with_latest_service_software_version

  tags = merge(local.conformance_pack_opensearch_common_tags, {
    other_checks = "true"
  })
}

query "opensearch_domain_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when encryption_at_rest_options ->> 'Enabled' = 'false' then 'alarm'
        else 'ok'
      end status,
      case
        when encryption_at_rest_options ->> 'Enabled' = 'false' then title || ' encryption at rest disabled.'
        else title || ' encryption at rest enabled.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_opensearch_domain;
  EOQ
}

query "opensearch_domain_fine_grained_access_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when advanced_security_options is null or not (advanced_security_options -> 'Enabled')::boolean then 'alarm'
        else 'ok'
      end as status,
      case
        when advanced_security_options is null or not (advanced_security_options -> 'Enabled')::boolean then title || ' has fine-grained access control disabled.'
        else title || ' has fine-grained access control enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_opensearch_domain;
  EOQ
}

query "opensearch_domain_https_required" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when (domain_endpoint_options ->> 'EnforceHTTPS' = 'false') or (domain_endpoint_options ->> 'EnforceHTTPS' = 'true' and domain_endpoint_options ->> 'TLSSecurityPolicy' not in ('tlsPolicies')) then 'alarm'
        else 'ok'
      end status,
      case
        when (domain_endpoint_options ->> 'EnforceHTTPS' = 'false') or (domain_endpoint_options ->> 'EnforceHTTPS' = 'true' and domain_endpoint_options ->> 'TLSSecurityPolicy' not in ('tlsPolicies')) then title || ' does not use HTTPS.'
        else title || ' uses HTTPS.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_opensearch_domain;
  EOQ
}

query "opensearch_domain_audit_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when log_publishing_options -> 'AUDIT_LOGS' ->> 'Enabled' = 'true' then 'ok'
        else 'ok'
      end as status,
      case
        when log_publishing_options -> 'AUDIT_LOGS' ->> 'Enabled' = 'true' then title || ' audit logging enabled.'
        else title || ' audit logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_opensearch_domain;
  EOQ
}

query "opensearch_domain_logs_to_cloudwatch" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when log_publishing_options is null then 'alarm'
        when
          ( log_publishing_options -> 'AUDIT_LOGS' is null
            or log_publishing_options -> 'AUDIT_LOGS' -> 'Enabled' = 'false'
            or (log_publishing_options -> 'AUDIT_LOGS' -> 'Enabled' = 'true' and log_publishing_options -> 'AUDIT_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null)
          )
          and
          ( log_publishing_options -> 'INDEX_SLOW_LOGS' is null
            or log_publishing_options -> 'INDEX_SLOW_LOGS' -> 'Enabled' = 'false'
            or (log_publishing_options -> 'INDEX_SLOW_LOGS' -> 'Enabled' = 'true' and log_publishing_options -> 'INDEX_SLOW_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null)
          )
          and
          ( log_publishing_options -> 'SEARCH_SLOW_LOGS' is null
            or log_publishing_options -> 'SEARCH_SLOW_LOGS' -> 'Enabled' = 'false'
            or (log_publishing_options -> 'SEARCH_SLOW_LOGS' -> 'Enabled' = 'true' and log_publishing_options -> 'SEARCH_SLOW_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null)
          )
          and
          ( log_publishing_options -> 'ES_APPLICATION_LOGS' is null
            or log_publishing_options -> 'ES_APPLICATION_LOGS' -> 'Enabled' = 'false'
            or (log_publishing_options -> 'ES_APPLICATION_LOGS' -> 'Enabled' = 'true' and log_publishing_options -> 'ES_APPLICATION_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null)
          )
          then 'ok'
        else 'alarm'
      end as status,
      case
        when log_publishing_options is null then title || ' logging not enabled.'
        when
          ( log_publishing_options -> 'AUDIT_LOGS' is null
            or log_publishing_options -> 'AUDIT_LOGS' -> 'Enabled' = 'false'
            or (log_publishing_options -> 'AUDIT_LOGS' -> 'Enabled' = 'true' and log_publishing_options -> 'AUDIT_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null)
          )
          and
          ( log_publishing_options -> 'INDEX_SLOW_LOGS' is null
            or log_publishing_options -> 'INDEX_SLOW_LOGS' -> 'Enabled' = 'false'
            or (log_publishing_options -> 'INDEX_SLOW_LOGS' -> 'Enabled' = 'true' and log_publishing_options -> 'INDEX_SLOW_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null)
          )
          and
          ( log_publishing_options -> 'SEARCH_SLOW_LOGS' is null
            or log_publishing_options -> 'SEARCH_SLOW_LOGS' -> 'Enabled' = 'false'
            or (log_publishing_options -> 'SEARCH_SLOW_LOGS' -> 'Enabled' = 'true' and log_publishing_options -> 'SEARCH_SLOW_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null)
          )
          and
          ( log_publishing_options -> 'ES_APPLICATION_LOGS' is null
            or log_publishing_options -> 'ES_APPLICATION_LOGS' -> 'Enabled' = 'false'
            or (log_publishing_options -> 'ES_APPLICATION_LOGS' -> 'Enabled' = 'true' and log_publishing_options -> 'ES_APPLICATION_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null)
          ) then title || ' send logs to Amazon CloudWatch.'
        else title || ' does not send logs to Amazon CloudWatch.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_opensearch_domain;
  EOQ
}

query "opensearch_domain_node_to_node_encryption_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when region = any(array['af-south-1', 'eu-south-1', 'cn-north-1', 'cn-northwest-1']) then 'skip'
        when node_to_node_encryption_options_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when region = any(array['af-south-1', 'eu-south-1', 'cn-north-1', 'cn-northwest-1']) then title || ' node-to-node encryption not supported in ' || region || '.'
        when node_to_node_encryption_options_enabled then title || ' node-to-node encryption enabled.'
        else title || ' node-to-node encryption disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_opensearch_domain;
  EOQ
}

query "opensearch_domain_in_vpc" {
  sql = <<-EOQ
    with public_subnets as (
      select
        distinct a -> 'SubnetId' as SubnetId
      from
        aws_vpc_route_table as t,
        jsonb_array_elements(associations) as a,
        jsonb_array_elements(routes) as r
      where
        r ->> 'DestinationCidrBlock' = '0.0.0.0/0'
        and  r ->>  'GatewayId' like 'igw-%'
    ), opensearch_domain_with_public_subnet as (
      select
        arn
      from
        aws_opensearch_domain ,
        jsonb_array_elements(vpc_options -> 'SubnetIds') as s
      where
        s in (select SubnetId from public_subnets)
    )
    select
      d.arn as resource,
      case
        when d.vpc_options ->> 'VPCId' is null then 'alarm'
        when d.vpc_options ->> 'VPCId' is not null and p.arn is not null then 'alarm'
        else 'ok'
      end status,
      case
        when vpc_options ->> 'VPCId' is null then title || ' not in VPC.'
        when d.vpc_options ->> 'VPCId' is not null and p.arn is not null then title || ' attached to public subnet.'
        else title || ' in VPC ' || (vpc_options ->> 'VPCId') || '.'
      end reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "d.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "d.")}
    from
      aws_opensearch_domain as d
      left join opensearch_domain_with_public_subnet as p on d.arn = p.arn;
  EOQ
}

query "opensearch_domain_cognito_authentication_enabled_for_kibana" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when cognito_options ->> 'Enabled' = 'true' then 'ok'
        else 'alarm'
      end status,
      case
        when cognito_options ->> 'Enabled' = 'true' then title || ' cognito authentication enabled for kibana.'
        else title || ' cognito authentication disabled for kibana.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_opensearch_domain;
  EOQ
}

query "opensearch_domain_internal_user_database_disabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when advanced_security_options ->> 'InternalUserDatabaseEnabled' = 'true' then 'alarm'
        else 'ok'
      end status,
      case
        when advanced_security_options ->> 'InternalUserDatabaseEnabled' = 'true' then title || ' internal user database enabled.'
        else title || ' internal user database disabled.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_opensearch_domain;
  EOQ
}

query "opensearch_domain_updated_with_latest_service_software_version" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when service_software_options ->> 'UpdateAvailable' = 'false' then 'ok'
        else 'alarm'
      end status,
      case
        when service_software_options ->> 'UpdateAvailable' = 'false' then title || ' updated with latest service software version.'
        else title || ' not updated with latest service software version.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_opensearch_domain;
  EOQ
}

# Non-Config rule query

query "opensearch_domain_data_node_fault_tolerance" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when cluster_config ->> 'ZoneAwarenessEnabled' = 'true' and cluster_config ->> 'InstanceCount' > '2' then 'ok'
        else 'alarm'
      end as status,
      case
        when cluster_config ->> 'ZoneAwarenessEnabled' = 'true' and cluster_config ->> 'InstanceCount' > '2' then title || ' zone awareness is '
        || case when cluster_config ->> 'ZoneAwarenessEnabled' = 'true' then 'enabled' else 'disabled' end || ' with ' || (cluster_config ->> 'InstanceCount') || ' data node(s) configued.'
        else title || ' zone awareness is ' || case when cluster_config ->> 'ZoneAwarenessEnabled' = 'true' then 'enabled' else 'disabled' end || ' with ' || (cluster_config ->> 'InstanceCount') || ' data node(s) configued.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_opensearch_domain;
  EOQ
}

