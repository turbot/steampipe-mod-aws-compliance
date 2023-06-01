locals {
  conformance_pack_es_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/ES"
  })
}

control "es_domain_encryption_at_rest_enabled" {
  title       = "ES domain encryption at rest should be enabled"
  description = "Because sensitive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elasticsearch Service (Amazon ES) domains"
  query       = query.es_domain_encryption_at_rest_enabled

  tags = merge(local.conformance_pack_es_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "es_domain_in_vpc" {
  title       = "ES domains should be in a VPC"
  description = "Manage access to the AWS Cloud by ensuring Amazon Elasticsearch Service (Amazon ES) Domains are within an Amazon Virtual Private Cloud (Amazon VPC)."
  query       = query.es_domain_in_vpc

  tags = merge(local.conformance_pack_es_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "es_domain_node_to_node_encryption_enabled" {
  title       = "Elasticsearch domain node-to-node encryption should be enabled"
  description = "Ensure node-to-node encryption for Amazon Elasticsearch Service is enabled. Node-to-node encryption enables TLS 1.2 encryption for all communications within the Amazon Virtual Private Cloud (Amazon VPC)."
  query       = query.es_domain_node_to_node_encryption_enabled

  tags = merge(local.conformance_pack_es_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "es_domain_logs_to_cloudwatch" {
  title       = "Elasticsearch domain should send logs to CloudWatch"
  description = "Ensure if Amazon OpenSearch Service (OpenSearch Service) domains are configured to send logs to Amazon CloudWatch Logs. The rule is compliant if a log is enabled for an OpenSearch Service domain. This rule is non compliant if logging is not configured."
  query       = query.es_domain_logs_to_cloudwatch

  tags = merge(local.conformance_pack_es_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "es_domain_cognito_authentication_enabled" {
  title       = "Elasticsearch domains should have cognito authentication enabled"
  description = "Amazon Elasticsearch service uses Amazon Cognito to offer user name and password protection for Kibana. This control is non compliant if Amazon Cognito authentication is not enabled."
  query       = query.es_domain_cognito_authentication_enabled

  tags = merge(local.conformance_pack_es_common_tags, {
    other_checks = "true"
  })
}

control "es_domain_internal_user_database_enabled" {
  title       = "Elasticsearch domains should have internal user database enabled"
  description = "Ensure Elasticsearch domains have internal user database enabled. This control is non compliant if a domain's internal user database is not enabled."
  query       = query.es_domain_internal_user_database_enabled

  tags = merge(local.conformance_pack_es_common_tags, {
    other_checks = "true"
  })
}

query "es_domain_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when encryption_at_rest_options ->> 'Enabled' = 'false' then 'alarm'
        else 'ok'
      end status,
      case
        when encryption_at_rest_options ->> 'Enabled' = 'false' then title || ' encryption at rest not enabled.'
        else title || ' encryption at rest enabled.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_elasticsearch_domain;
  EOQ
}

query "es_domain_in_vpc" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when vpc_options ->> 'VPCId' is null then 'alarm'
        else 'ok'
      end status,
      case
        when vpc_options ->> 'VPCId' is null then title || ' not in VPC.'
        else title || ' in VPC ' || (vpc_options ->> 'VPCId') || '.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_elasticsearch_domain;
  EOQ
}

query "es_domain_node_to_node_encryption_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when region = any(array['af-south-1', 'eu-south-1', 'cn-north-1', 'cn-northwest-1']) then 'skip'
        when not enabled then 'alarm'
        else 'ok'
      end as status,
      case
        when region = any(array['af-south-1', 'eu-south-1', 'cn-north-1', 'cn-northwest-1']) then title || ' node-to-node encryption not supported in ' || region || '.'
        when not enabled then title || ' node-to-node encryption disabled.'
        else title || ' node-to-node encryption enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_elasticsearch_domain;
  EOQ
}

query "es_domain_logs_to_cloudwatch" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when
          ( log_publishing_options -> 'ES_APPLICATION_LOGS' -> 'Enabled' = 'true'
            and log_publishing_options -> 'ES_APPLICATION_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null
          )
          and
          ( log_publishing_options -> 'SEARCH_SLOW_LOGS' -> 'Enabled' = 'true'
            and log_publishing_options -> 'SEARCH_SLOW_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null
          )
          and
          ( log_publishing_options -> 'INDEX_SLOW_LOGS' -> 'Enabled' = 'true'
            and log_publishing_options -> 'INDEX_SLOW_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null
          )
          then 'ok'
        else 'alarm'
      end as status,
      case
        when
          ( log_publishing_options -> 'ES_APPLICATION_LOGS' -> 'Enabled' = 'true'
            and log_publishing_options -> 'ES_APPLICATION_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null
          )
          and
          ( log_publishing_options -> 'SEARCH_SLOW_LOGS' -> 'Enabled' = 'true'
            and log_publishing_options -> 'SEARCH_SLOW_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null
          )
          and
          ( log_publishing_options -> 'INDEX_SLOW_LOGS' -> 'Enabled' = 'true'
            and log_publishing_options -> 'INDEX_SLOW_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null
          ) then title || ' logging enabled for search , index and error.'
        else title || ' logging not enabled for all search, index and error.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_elasticsearch_domain;
  EOQ
}

query "es_domain_cognito_authentication_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when cognito_options ->> 'Enabled' = 'true' then 'ok'
        else 'alarm'
      end as status,
      case
        when cognito_options ->> 'Enabled' = 'true' then title || ' Amazon Cognito authentication for Kibana enabled.'
        else title || ' Amazon Cognito authentication for Kibana disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_elasticsearch_domain;
  EOQ
}

query "es_domain_internal_user_database_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when advanced_security_options ->> 'InternalUserDatabaseEnabled' = 'true' then 'ok'
        else 'alarm'
      end as status,
      case
        when advanced_security_options ->> 'InternalUserDatabaseEnabled' = 'true' then title || ' internal user database enabled.'
        else title || ' internal user database disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_elasticsearch_domain;
  EOQ
}

# Non-Config rule query

query "es_domain_audit_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when
          log_publishing_options -> 'AUDIT_LOGS' -> 'Enabled' = 'true'
          and log_publishing_options -> 'AUDIT_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when
          log_publishing_options -> 'AUDIT_LOGS' -> 'Enabled' = 'true'
          and log_publishing_options -> 'AUDIT_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null then title || ' audit logging enabled.'
        else title || ' audit logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_elasticsearch_domain;
  EOQ
}

query "es_domain_data_nodes_min_3" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when elasticsearch_cluster_config ->> 'ZoneAwarenessEnabled' = 'false' then 'alarm'
        when
          elasticsearch_cluster_config ->> 'ZoneAwarenessEnabled' = 'true'
          and (elasticsearch_cluster_config ->> 'InstanceCount')::integer >= 3 then 'ok'
        else 'alarm'
      end status,
      case
        when elasticsearch_cluster_config ->> 'ZoneAwarenessEnabled' = 'false' then title || ' zone awareness disabled.'
        else title || ' has ' || (elasticsearch_cluster_config ->> 'InstanceCount') || ' data node(s).'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_elasticsearch_domain;
  EOQ
}

query "es_domain_dedicated_master_nodes_min_3" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when elasticsearch_cluster_config ->> 'DedicatedMasterEnabled' = 'false' then 'alarm'
        when
          elasticsearch_cluster_config ->> 'DedicatedMasterEnabled' = 'true'
          and (elasticsearch_cluster_config ->> 'DedicatedMasterCount')::integer >= 3 then 'ok'
        else 'alarm'
      end status,
      case
        when elasticsearch_cluster_config ->> 'DedicatedMasterEnabled' = 'false' then title || ' dedicated master nodes disabled.'
        else title || ' has ' || (elasticsearch_cluster_config ->> 'DedicatedMasterCount') || ' dedicated master node(s).'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_elasticsearch_domain;
  EOQ
}

query "es_domain_encrypted_using_tls_1_2" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when domain_endpoint_options ->> 'TLSSecurityPolicy' = 'Policy-Min-TLS-1-2-2019-07' then 'ok'
        else 'alarm'
      end status,
      case
        when domain_endpoint_options ->> 'TLSSecurityPolicy' = 'Policy-Min-TLS-1-2-2019-07' then title || ' encrypted using TLS 1.2.'
        else title || ' not encrypted using TLS 1.2.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_elasticsearch_domain;
  EOQ
}

query "es_domain_error_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when
          log_publishing_options -> 'ES_APPLICATION_LOGS' -> 'Enabled' = 'true'
          and log_publishing_options -> 'ES_APPLICATION_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when
          log_publishing_options -> 'ES_APPLICATION_LOGS' -> 'Enabled' = 'true'
          and log_publishing_options -> 'ES_APPLICATION_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null then title || ' error logging enabled.'
        else title || ' error logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_elasticsearch_domain;
  EOQ
}
