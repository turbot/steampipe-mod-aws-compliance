locals {
  conformance_pack_acm_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/ACM"
  })
}

control "acm_certificate_expires_30_days" {
  title       = "ACM certificates should not expire within 30 days"
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
    nist_csf_v2                            = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "acm_certificate_transparency_logging_enabled" {
  title       = "ACM certificates should have transparency logging enabled"
  description = "Ensure ACM certificates transparency logging is enabled as certificate transparency logging guards against SSL/TLS certificates issued by mistake or by a compromised certificate authority."
  query       = query.acm_certificate_transparency_logging_enabled

  tags = merge(local.conformance_pack_acm_common_tags, {
    nist_csf_v2 = "true"
  })
}

control "acm_certificate_no_wildcard_domain_name" {
  title       = "ACM certificates should not use wildcard certificates"
  description = "Ensure that ACM single domain name certificates are used instead of wildcard certificates within your AWS account in order to follow security best practices and protect each domain/subdomain with its own unique private key."
  query       = query.acm_certificate_no_wildcard_domain_name

  tags = local.conformance_pack_acm_common_tags
}

control "acm_certificate_not_expired" {
  title       = "Ensure that all the expired ACM certificates are removed"
  description = "This control ensures that all expired ACM certificates are removed from AWS account."
  query       = query.acm_certificate_not_expired

  tags = merge(local.conformance_pack_acm_common_tags, {
    nist_csf_v2 = "true"
  })
}

control "acm_certificate_no_failed_certificate" {
  title       = "Ensure that ACM certificates are not in failed state"
  description = "This control ensures that ACM certificates are not in failed state."
  query       = query.acm_certificate_no_failed_certificate

  tags = merge(local.conformance_pack_acm_common_tags, {
    nist_csf_v2 = "true"
  })
}

control "acm_certificate_no_pending_validation_certificate" {
  title       = "Ensure that ACM certificates are not in pending validation state"
  description = "This control ensures that ACM certificates are not in pending validation state. When certificates are not validated within 72 hours after the request is made, those certificates become invalid."
  query       = query.acm_certificate_no_pending_validation_certificate

  tags = merge(local.conformance_pack_acm_common_tags, {
    nist_csf_v2 = "true"
  })
}

control "acm_certificate_rsa_key_length_2048_bits_or_greater" {
  title       = "RSA certificates managed by ACM should use a key length of at least 2,048 bits"
  description = "This control checks whether RSA certificates managed by AWS Certificate Manager use a key length of at least 2,048 bits. The control fails if the key length is smaller than 2,048 bits."
  query       = query.acm_certificate_rsa_key_length_2048_bits_or_greater

  tags = merge(local.conformance_pack_acm_common_tags, {
    nist_csf_v2 = "true"
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

query "acm_certificate_not_expired" {
  sql = <<-EOQ
    select
      certificate_arn as resource,
      case
        when renewal_eligibility = 'INELIGIBLE' then 'skip'
        when date(not_after) < (current_date - interval '1' minute) then 'alarm'
        else 'ok'
      end as status,
      case
        when renewal_eligibility = 'INELIGIBLE' then title || ' not eligible for renewal.'
        when date(not_after) < (current_date - interval '1' minute) then title || ' expired ' || to_char(not_after, 'DD-Mon-YYYY') ||
        ' (' || extract(day from not_after - current_date) || ' days ago).'
        else title || ' expires ' || to_char(not_after, 'DD-Mon-YYYY') ||
        ' (' || extract(day from not_after - current_date) || ' days).'
       end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_acm_certificate;
  EOQ
}

query "acm_certificate_no_failed_certificate" {
  sql = <<-EOQ
    select
      certificate_arn as resource,
      case
        when status in ('VALIDATION_TIMED_OUT', 'FAILED') then 'alarm'
        else 'ok'
      end as status,
      title || ' status is ' || status || '.'  as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_acm_certificate;
  EOQ
}

query "acm_certificate_no_pending_validation_certificate" {
  sql = <<-EOQ
    select
      certificate_arn as resource,
      case
        when status = 'PENDING_VALIDATION' then 'info'
        else 'ok'
      end as status,
      title || ' status is ' || status || '.'  as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_acm_certificate;
  EOQ
}

query "acm_certificate_rsa_key_length_2048_bits_or_greater" {
  sql = <<-EOQ
    select
      certificate_arn as resource,
      case
        when not key_algorithm like 'RSA-%' then 'skip'
        when key_algorithm = 'RSA_1024' then 'alarm'
        else 'ok'
      end as status,
      case
        when not key_algorithm like 'RSA-%' then title || ' is not a RSA certificate.'
        when key_algorithm = 'RSA_1024' then title || ' is using 1024 bits key length.'
        else title || ' is using ' || split_part(key_algorithm, '-', 2) || ' bits key length.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_acm_certificate;
  EOQ
}