locals {
  all_controls_acm_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/ACM"
  })
}

benchmark "all_controls_acm" {
  title       = "ACM"
  description = "This section contains recommendations for configuring ACM resources."
  children = [
    control.acm_certificate_expires_30_days,
    control.acm_certificate_no_failed_certificate,
    control.acm_certificate_no_pending_validation_certificate,
    control.acm_certificate_no_wildcard_domain_name,
    control.acm_certificate_not_expired,
    control.acm_certificate_rsa_key_length_2048_bits_or_greater,
    control.acm_certificate_transparency_logging_enabled
  ]

  tags = merge(local.all_controls_acm_common_tags, {
    type = "Benchmark"
  })
}
