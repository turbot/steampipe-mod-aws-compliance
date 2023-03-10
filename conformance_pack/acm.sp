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
    audit_manager_pci_v321 = "true"
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gdpr                   = "true"
    hipaa                  = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
    soc_2                  = "true"
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
