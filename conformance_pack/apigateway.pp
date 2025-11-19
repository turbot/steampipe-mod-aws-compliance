locals {
  conformance_pack_apigateway_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/APIGateway"
  })
}

control "api_gatewayv2_route_authorization_type_configured" {
  title       = "API Gateway routes should specify an authorization type"
  description = "This control checks if AWS API Gateway routes have an authorization type. The control fails if the API Gateway route does not specify an authorization type."
  query       = query.api_gatewayv2_route_authorization_type_configured

  tags = merge(local.conformance_pack_apigateway_common_tags, {
    pci_dss_v40 = "true"
  })
}

control "gatewayv2_stage_access_logging_enabled" {
  title       = "Access logging should be configured for API Gateway V2 Stages"
  description = "This control checks if AWS API Gateway V2 stages have access logging configured. This control fails if access log settings aren't defined."
  query       = query.gatewayv2_stage_access_logging_enabled

  tags = merge(local.conformance_pack_apigateway_common_tags, {
    acsc_essential_eight = "true"
    pci_dss_v40          = "true"
  })
}

control "apigateway_stage_cache_encryption_at_rest_enabled" {
  title       = "API Gateway stage cache encryption at rest should be enabled"
  description = "To help protect data at rest, ensure encryption is enabled for your API Gateway stage's cache."
  query       = query.apigateway_stage_cache_encryption_at_rest_enabled

  tags = merge(local.conformance_pack_apigateway_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_moderate_rev_4                 = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "apigateway_stage_logging_enabled" {
  title       = "API Gateway stage logging should be enabled"
  description = "API Gateway logging displays detailed views of users who accessed the API and the way they accessed the API."
  query       = query.apigateway_stage_logging_enabled

  tags = merge(local.conformance_pack_apigateway_common_tags, {
    acsc_essential_eight                   = "true"
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
    nist_csf_v2                            = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "apigateway_rest_api_stage_use_ssl_certificate" {
  title       = "API Gateway stage should uses SSL certificate"
  description = "Ensure that a REST API stage uses a Secure Sockets Layer (SSL) certificate. This rule is compliant if the REST API stage does not have an associated SSL certificate."
  query       = query.apigateway_rest_api_stage_use_ssl_certificate

  tags = merge(local.conformance_pack_apigateway_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nydfs_23                               = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
  })
}

control "apigateway_rest_api_stage_xray_tracing_enabled" {
  title       = "API Gateway REST API stages should have AWS X-Ray tracing enabled"
  description = "This control checks whether AWS X-Ray active tracing is enabled for your AWS API Gateway REST API stages."
  query       = query.apigateway_rest_api_stage_xray_tracing_enabled

  tags = merge(local.conformance_pack_apigateway_common_tags, {
    acsc_essential_eight                   = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_csf                               = "true"
    pci_dss_v40                            = "true"
  })
}

control "apigateway_stage_use_waf_web_acl" {
  title       = "API Gateway stage should be associated with WAF"
  description = "Ensure that an AWS API Gateway API stage is using a WAF Web ACL. This rule is non-compliant if an AWS WAF Web ACL is not used."
  query       = query.apigateway_stage_use_waf_web_acl

  tags = merge(local.conformance_pack_apigateway_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    nydfs_23               = "true"
    pci_dss_v321           = "true"
    pci_dss_v40            = "true"
    rbi_cyber_security     = "true"
  })
}

control "apigateway_rest_api_authorizers_configured" {
  title       = "API Gateway stages should have authorizers configured"
  description = "Ensure API Gateway stages have authorizers configured."
  query       = query.apigateway_rest_api_authorizers_configured

  tags = local.conformance_pack_apigateway_common_tags
}

control "apigateway_rest_api_endpoint_restrict_public_access" {
  title       = "API Gateway REST API endpoint type should be configured to private"
  description = "This control checks whether API Gateway endpoint is public or private. This rule is non-compliant if API Gateway endpoint is public."
  query       = query.apigateway_rest_api_endpoint_restrict_public_access

  tags = local.conformance_pack_apigateway_common_tags
}

control "api_gatewayv2_route_authorizer_configured" {
  title       = "API Gateway V2 authorizer should be configured"
  description = "This control checks whether API Gateway V2 has an authorizer configured. This rule is non-compliant if API Gateway V2 has no authorizers configured."
  query       = query.api_gatewayv2_route_authorizer_configured

  tags = local.conformance_pack_apigateway_common_tags
}

control "api_gateway_rest_api_public_endpoint_with_authorizer" {
  title       = "API Gateway REST API public endpoints should be configured with authorizer"
  description = "Ensure API Gateway REST API public endpoint is configured with authorizer. This rule is non-compliant if API Gateway REST API public endpoint has no authorizer configured."
  query       = query.api_gateway_rest_api_public_endpoint_with_authorizer

  tags = local.conformance_pack_apigateway_common_tags
}

control "api_gateway_method_authorization_type_configured" {
  title       = "API Gateway methods authorizer should be configured"
  description = "This control checks whether API Gateway method has an authorizer configured. This rule is non-compliant if API Gateway method has no authorizers configured."
  query       = query.api_gateway_method_authorization_type_configured

  tags = local.conformance_pack_apigateway_common_tags
}

control "api_gateway_method_request_parameter_validated" {
  title       = "API Gateway methods request parameter should be validated"
  description = "This control checks whether API Gateway method request parameter is validated. This rule is non-compliant if API Gateway method request parameter is not validated."
  query       = query.api_gateway_method_request_parameter_validated

  tags = local.conformance_pack_apigateway_common_tags
}

query "apigateway_stage_cache_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
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
        account_id,
        tags,
        _ctx
      from
        aws_api_gateway_stage
      union
      select
        stage_name,
        'arn:' || partition || ':apigateway:' || region || '::/apis/' || api_id || '/stages/' || stage_name as arn,
        default_route_logging_level as log_level,
        title,
        region,
        account_id,
        tags,
        _ctx
      from
        aws_api_gatewayv2_stage
    )
    select
      arn as resource,
      case
        when log_level is null or log_level = '' or log_level = 'OFF' then 'alarm'
        else 'ok'
      end as status,
      case
        when log_level is null or log_level = '' or log_level = 'OFF' then title || ' logging not enabled.'
        else title || ' logging enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      all_stages;
    EOQ
}

query "apigateway_rest_api_stage_use_ssl_certificate" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when client_certificate_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when client_certificate_id is null then title || ' does not use SSL certificate.'
        else title || ' uses SSL certificate.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_api_gateway_stage;
  EOQ
}

query "apigateway_rest_api_stage_xray_tracing_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when tracing_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when tracing_enabled then title || ' X-Ray tracing enabled.'
        else title || ' X-Ray tracing disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_api_gateway_stage;
  EOQ
}

query "apigateway_stage_use_waf_web_acl" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when web_acl_arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when web_acl_arn is not null then title || ' associated with WAF web ACL.'
        else title || ' not associated with WAF web ACL.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_api_gateway_stage;
  EOQ
}

query "apigateway_rest_api_authorizers_configured" {
  sql = <<-EOQ
    select
      p.name as resource,
      case
        when jsonb_array_length(a.provider_arns) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when jsonb_array_length(a.provider_arns) > 0 then p.name || ' authorizers configured.'
        else p.name || ' authorizers not configured.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "p.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "p.")}
    from
      aws_api_gateway_rest_api as p
      left join aws_api_gateway_authorizer as a on p.api_id = a.rest_api_id;
  EOQ
}

query "apigateway_rest_api_endpoint_restrict_public_access" {
  sql = <<-EOQ
    select
      'arn:' || partition || ':apigateway:' || region || '::/apis/' || api_id as resource,
      case
        when endpoint_configuration_types ? 'PRIVATE' then 'ok'
        else 'alarm'
      end as status,
      case
        when endpoint_configuration_types ? 'PRIVATE' then name || ' not publicly accessible.'
        else name || ' publicly accessible.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_api_gateway_rest_api;
  EOQ
}

query "api_gatewayv2_route_authorizer_configured" {
  sql = <<-EOQ
    select
      'arn:' || partition || ':apigateway:' || region || '::/apis/' || api_id || '/routes/' || route_id as resource,
      case
        when authorizer_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when authorizer_id is null then route_id || ' authorizer not configured.'
        else route_id || ' authorizer ' || authorizer_id || ' configured.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_api_gatewayv2_route;
  EOQ
}

query "api_gatewayv2_route_authorization_type_configured" {
  sql = <<-EOQ
    select
      'arn:' || partition || ':apigateway:' || region || '::/apis/' || api_id || '/routes/' || route_id as resource,
      case
        when authorization_type is null then 'alarm'
        else 'ok'
      end as status,
      case
        when authorization_type is null then route_id || ' authorization type not configured.'
        else route_id || ' authorization type ' || authorization_type || ' configured.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_api_gatewayv2_route;
  EOQ
}

query "gatewayv2_stage_access_logging_enabled" {
  sql = <<-EOQ
    select
      'arn:' || partition || ':apigateway:' || region || '::/apis/' || api_id || '/stages/' || stage_name as resource,
      case
        when access_log_settings is null then 'alarm'
        else 'ok'
      end as status,
      case
        when access_log_settings is null then title || ' access logging disabled.'
        else title || ' access logging enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_api_gatewayv2_stage;
  EOQ
}

query "api_gateway_rest_api_public_endpoint_with_authorizer" {
  sql = <<-EOQ
    select
      'arn:' || p.partition || ':apigateway:' || p.region || '::/apis/' || p.api_id as resource,
      case
        when not (endpoint_configuration_types ? 'PRIVATE') and (a.provider_arns is not null and jsonb_array_length(a.provider_arns) > 0 ) then 'ok'
        when not (endpoint_configuration_types ? 'PRIVATE') and ( a.provider_arns is null or jsonb_array_length(a.provider_arns) = 0 ) then 'alarm'
        else 'ok'
      end as status,
      case
        when not (endpoint_configuration_types ? 'PRIVATE') and (a.provider_arns is not null and jsonb_array_length(a.provider_arns) > 0 ) then p.name || ' has public endpoint with authorizer.'
        when not (endpoint_configuration_types ? 'PRIVATE') and ( a.provider_arns is null or jsonb_array_length(a.provider_arns) = 0 ) then p.name || ' has public endpoint without authorizer.'
        else p.name || ' has private endpoint.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "p.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "p.")}
    from
      aws_api_gateway_rest_api as p
      left join aws_api_gateway_authorizer as a on p.api_id = a.rest_api_id;
  EOQ
}

query "api_gateway_method_authorization_type_configured" {
  sql = <<-EOQ
    select
      resource_id as resource,
      case
        when authorization_type = 'NONE' then 'alarm'
        else 'ok'
      end as status,
      case
        when authorization_type = 'NONE' then title || ' authorization type not configured.'
        else title || ' authorization type ' || authorization_type || ' configured.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_api_gateway_method;
  EOQ
}

query "api_gateway_method_request_parameter_validated" {
  sql = <<-EOQ
    select
      resource_id as resource,
      case
        when request_validator_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when request_validator_id is null then title || ' request parameter not validated.'
        else title || ' request parameter validated.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_api_gateway_method;
  EOQ
}