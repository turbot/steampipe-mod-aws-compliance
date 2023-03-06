locals {
  conformance_pack_apigateway_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/APIGateway"
  })
}

control "apigateway_stage_cache_encryption_at_rest_enabled" {
  title       = "API Gateway stage cache encryption at rest should be enabled"
  description = "To help protect data at rest, ensure encryption is enabled for your API Gateway stage's cache."
  query       = query.apigateway_stage_cache_encryption_at_rest_enabled

  tags = merge(local.conformance_pack_apigateway_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_moderate_rev_4 = "true"
    gdpr                   = "true"
    gxp_21_cfr_part_11     = "true"
    gxp_eu_annex_11        = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
  })
}

control "apigateway_stage_logging_enabled" {
  title       = "API Gateway stage logging should be enabled"
  description = "API Gateway logging displays detailed views of users who accessed the API and the way they accessed the API."
  query       = query.apigateway_stage_logging_enabled

  tags = merge(local.conformance_pack_apigateway_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
    soc_2                  = "true"
  })
}

control "apigateway_rest_api_stage_use_ssl_certificate" {
  title       = "API Gateway stage should uses SSL certificate"
  description = "Ensure if a REST API stage uses a Secure Sockets Layer (SSL) certificate. This rule is compliant if the REST API stage does not have an associated SSL certificate."
  query       = query.apigateway_rest_api_stage_use_ssl_certificate

  tags = merge(local.conformance_pack_apigateway_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_5      = "true"
    rbi_cyber_security     = "true"
  })
}

control "apigateway_stage_use_waf_web_acl" {
  title       = "API Gateway stage should be associated with waf"
  description = "Ensure if an Amazon API Gateway API stage is using a WAF Web ACL. This rule is non compliant if an AWS WAF Web ACL is not used."
  query       = query.apigateway_stage_use_waf_web_acl

  tags = merge(local.conformance_pack_apigateway_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    nist_800_53_rev_5      = "true"
    rbi_cyber_security     = "true"
  })
}

control "apigateway_rest_api_authorizers_configured" {
  title       = "API Gateway stages should have authorizers configured"
  description = "Ensure API Gateway stages have authorizers configured."
  query       = query.apigateway_rest_api_authorizers_configured

  tags = merge(local.conformance_pack_apigateway_common_tags, {
    other_checks = "true"
  })
}

query "apigateway_stage_cache_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
      -- Required Columns
      'arn:' || partition || ':apigateway:' || region || '::/apis/' || rest_api_id || '/stages/' || name as resource,
      case
        when method_settings -> '*/*' ->> 'CachingEnabled' = 'true'
        and method_settings -> '*/*' ->> 'CacheDataEncrypted' = 'true' then 'ok'
        else 'alarm'
      end as status,
      case
        when method_settings -> '*/*' ->> 'CachingEnabled' = 'true'
        and method_settings -> '*/*' ->> 'CacheDataEncrypted' = 'true'
          then title || ' API cache and encryption enabled.'
        else title || ' API cache and encryption not enabled.'
      end as reason
      -- Additional Dimensions
        ${local.tag_dimensions_sql}
        ${local.common_dimensions_sql}
    from
      aws_api_gateway_stage;
  EOQ
}

query "apigateway_stage_logging_enabled" {
  sql = <<-EOQ
    with all_stages as (
      select
        name as stage_name,
        'arn:' || partition || ':apigateway:' || region || '::/apis/' || rest_api_id || '/stages/' || name as arn,
        method_settings -> '*/*' ->> 'LoggingLevel' as log_level,
        title,
        region,
        account_id
      from
        aws_api_gateway_stage
      union
      select
        stage_name,
        'arn:' || partition || ':apigateway:' || region || '::/apis/' || api_id || '/stages/' || stage_name as arn,
        default_route_logging_level as log_level,
        title,
        region,
        account_id
      from
        aws_api_gatewayv2_stage
    )
    select
      -- Required Columns
      arn as resource,
      case
        when log_level is null or log_level = '' or log_level = 'OFF' then 'alarm'
        else 'ok'
      end as status,
      case
        when log_level is null or log_level = '' or log_level = 'OFF' then title || ' logging not enabled.'
        else title || ' logging enabled.'
      end as reason
      -- Additional Dimensions
        ${local.tag_dimensions_sql}
        ${local.common_dimensions_sql}
    from
      all_stages;
    EOQ
}

query "apigateway_rest_api_stage_use_ssl_certificate" {
  sql = <<-EOQ
    select
      -- Required Columns
      arn as resource,
      case
        when client_certificate_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when client_certificate_id is null then title || ' does not use SSL certificate.'
        else title || ' uses SSL certificate.'
      end as reason
      -- Additional Dimensions
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_api_gateway_stage;
  EOQ
}

query "apigateway_stage_use_waf_web_acl" {
  sql = <<-EOQ
    select
      -- Required Columns
      arn as resource,
      case
        when web_acl_arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when web_acl_arn is not null then title || ' associated with WAF web ACL.'
        else title || ' not associated with WAF web ACL.'
      end as reason
      -- Additional Dimensions
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_api_gateway_stage;
  EOQ
}

query "apigateway_rest_api_authorizers_configured" {
  sql = <<-EOQ
    select
      -- Required Columns
      p.name as resource,
      case
        when jsonb_array_length(a.provider_arns) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when jsonb_array_length(a.provider_arns) > 0 then p.name || ' authorizers configured.'
        else p.name || ' authorizers not configured.'
      end as reason
      -- Additional Dimensions
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "p.")}
    from
      aws_api_gateway_rest_api as p
      left join aws_api_gateway_authorizer as a on p.api_id = a.rest_api_id;
  EOQ
}
