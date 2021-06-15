locals {
  conformance_pack_acm_common_tags = {
    service = "acm"
  }
}

control "acm_certificate_expires_30_days" {
  title       = "Imported ACM certificates should be renewed after a specified time period"
  description = "Ensure network integrity is protected by ensuring X509 certificates are issued by AWS ACM."
  sql         = query.acm_certificate_expires_30_days.sql
  tags        = local.conformance_pack_acm_common_tags
}
