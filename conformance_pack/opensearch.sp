locals {
  conformance_pack_opensearch_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/OPENSEARCH"
  })
}

control "opensearch_domain_encryption_at_rest_enabled" {
  title       = "OpenSearch domains should have encryption at rest enabled"
  description = "This control checks whether Amazon OpenSearch domains have encryption-at-rest configuration enabled. The check fails if encryption at rest is not enabled."
  query       = query.opensearch_domain_encryption_at_rest_enabled

  tags = merge(local.conformance_pack_opensearch_common_tags, {
    pci_dss_v321 = "true"
  })
}

control "opensearch_domain_fine_grained_access_enabled" {
  title       = "OpenSearch domains should have fine-grained access control enabled"
  description = "This control checks whether OpenSearch domains have fine-grained access control enabled. The control fails if the fine-grained access control is not enabled. Fine-grained access control requires advanced-security-optionsin the OpenSearch parameter update-domain-config to be enabled."
  query       = query.opensearch_domain_fine_grained_access_enabled

  tags = merge(local.conformance_pack_opensearch_common_tags, {
    pci_dss_v321 = "true"
  })
}

control "opensearch_domain_https_required" {
  title       = "OpenSearch domains should use HTTPS"
  description = "This control checks whether connections to OpenSearch domains are using HTTPS. The rule is NON_COMPLIANT if the Amazon OpenSearch domain 'EnforceHTTPS' is not 'true' or is 'true' and 'TLSSecurityPolicy' is not in 'tlsPolicies'."
  query       = query.opensearch_domain_https_required

  tags = merge(local.conformance_pack_opensearch_common_tags, {
    pci_dss_v321 = "true"
  })
}

control "opensearch_domain_audit_logging_enabled" {
  title       = "OpenSearch domains should have audit logging enabled"
  description = "This control checks whether Amazon OpenSearch Service domains have audit logging enabled. The rule is NON_COMPLIANT if an OpenSearch Service domain does not have audit logging enabled."
  query       = query.opensearch_domain_audit_logging_enabled

  tags = merge(local.conformance_pack_opensearch_common_tags, {
    pci_dss_v321 = "true"
    soc_2        = "true"
  })
}

control "opensearch_domain_logs_to_cloudwatch" {
  title       = "OpenSearch domains logs to Amazon CloudWatch Logs"
  description = "This control checks whether Amazon OpenSearch Service domains are configured to send logs to Amazon CloudWatch Logs. The rule is NON_COMPLIANT if logging is not configured."
  query       = query.opensearch_domain_logs_to_cloudwatch


  tags = merge(local.conformance_pack_opensearch_common_tags, {
    pci_dss_v321 = "true"
    soc_2        = "true"
  })
}

query "opensearch_domain_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when encryption_at_rest_options ->> 'Enabled' = 'false' then 'alarm'
        else 'ok'
      end as status,
      case
        when encryption_at_rest_options ->> 'Enabled' = 'false' then title || ' encryption at rest not enabled.'
        else title || ' encryption at rest enabled.'
      end as reason
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
        when advanced_security_options is null or not (advanced_security_options -> 'Enabled')::boolean then title || ' having fine-grained access control disabled.'
        else title || ' having fine-grained access control enabled.'
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
        when (domain_endpoint_options ->> 'EnforceHTTPS' = 'false') or (domain_endpoint_options ->> 'EnforceHTTPS' = 'true' and domain_endpoint_options ->> 'TLSSecurityPolicy' not in ('tlsPolicies')) then title || ' not using HTTPS.'
        else title || ' using HTTPS.'
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

# Non-Config rule query

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
      aws_opensearch_domain as d left join opensearch_domain_with_public_subnet as p
      on d.arn = p.arn;
  EOQ
}
