locals {
  conformance_pack_acm_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/ACM"
  })
}

control "acm_certificate_expires_30_days" {
  title       = "ACM certificates should be set to expire within 30 days"
  description = "Ensure network integrity is protected by ensuring X509 certificates are issued by AWS ACM."
  query       = query.acm_certificate_expires_30_days

  tags = merge(local.conformance_pack_acm_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
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

control "acm_certificate_transparency_logging_enabled" {
  title       = "ACM certificates should have transparency logging enabled"
  description = "Ensure ACM certificates transparency logging is enabled as certificate transparency logging guards against SSL/TLS certificates issued by mistake or by a compromised certificate authority."
  query       = query.acm_certificate_transparency_logging_enabled

  tags = merge(local.conformance_pack_acm_common_tags, {
    other_checks = "true"
  })
}

control "acm_certificate_no_wildcard_domain_name" {
  title       = "ACM certificates should not use wildcard certificates"
  description = "Ensure that ACM single domain name certificates are used instead of wildcard certificates within your AWS account in order to follow security best practices and protect each domain/subdomain with its own unique private key."
  query       = query.acm_certificate_no_wildcard_domain_name

  tags = merge(local.conformance_pack_acm_common_tags, {
    other_checks = "true"
  })
}

query "acm_certificate_expires_30_days" {
  sql = <<-EOQ
    select
      certificate_arn as resource,
      case
        when renewal_eligibility = 'INELIGIBLE' then 'skip'
        when date(not_after) - date(current_date) >= 30 then 'ok'
        else 'alarm'
      end as status,
      case
        when renewal_eligibility = 'INELIGIBLE' then title || ' not eligible for renewal.'
        else title || ' expires ' || to_char(not_after, 'DD-Mon-YYYY') ||
        ' (' || extract(day from not_after - current_date) || ' days).'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_acm_certificate;
  EOQ
}

query "acm_certificate_transparency_logging_enabled" {
  sql = <<-EOQ
    select
      certificate_arn as resource,
      case
        when type = 'IMPORTED' then 'skip'
        when certificate_transparency_logging_preference = 'ENABLED' then 'ok'
        else 'alarm'
      end as status,
      case
        when type = 'IMPORTED' then title || ' is imported.'
        when certificate_transparency_logging_preference = 'ENABLED' then title || ' transparency logging enabled.'
        else title || ' transparency logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_acm_certificate;
  EOQ
}

query "acm_certificate_no_wildcard_domain_name" {
  sql = <<-EOQ
    select
      certificate_arn as resource,
      case
        when domain_name like '*%' then 'alarm'
        else 'ok'
      end as status,
      case
        when domain_name like '*%' then title || ' uses wildcard domain name.'
        else title || ' does not use wildcard domain name.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_acm_certificate;
  EOQ
}
