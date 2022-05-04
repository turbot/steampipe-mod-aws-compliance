benchmark "fedramp_sc" {
  title       = "System and Communications Protection(SC)"
  description = "to do"
  children = [
    benchmark.fedramp_sc_12
  ]

  tags = local.fedramp_common_tags
}

benchmark "fedramp_sc_12" {
  title       = "Cryptographic Key Establishment And Management(SC-12)"
  description = "The organization establishes and manages cryptographic keys for required cryptography employed within the information system in accordance with [Assignment: organization-defined requirements for key generation, distribution, storage, access, and destruction]."
  children = [
    control.acm_certificate_expires_30_days,
    control.kms_key_not_pending_deletion,
    control.kms_cmk_rotation_enabled
  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "medium"
  })
}
