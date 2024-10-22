locals {
  foundational_security_acm_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/ACM"
  })
}

benchmark "foundational_security_acm" {
  title         = "ACM"
  documentation = file("./foundational_security/docs/foundational_security_acm.md")
  children = [
    control.foundational_security_acm_1,
    control.foundational_security_acm_2
  ]

  tags = merge(local.foundational_security_acm_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_acm_1" {
  title         = "1 Imported ACM certificates should be renewed after a specified time period"
  description   = "This control checks whether ACM certificates in your account are marked for expiration within 30 days. It checks both imported certificates and certificates provided by AWS Certificate Manager."
  severity      = "medium"
  query         = query.acm_certificate_expires_30_days
  documentation = file("./foundational_security/docs/foundational_security_acm_1.md")

  tags = merge(local.foundational_security_acm_common_tags, {
    foundational_security_item_id  = "acm_1"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}

control "foundational_security_acm_2" {
  title         = "2 RSA certificates managed by ACM should use a key length of at least 2,048 bits"
  description   = "This control checks whether RSA certificates managed by AWS Certificate Manager use a key length of at least 2,048 bits. The control fails if the key length is smaller than 2,048 bits."
  severity      = "high"
  query         = query.acm_certificate_rsa_key_length_2048_bits_or_greater
  documentation = file("./foundational_security/docs/foundational_security_acm_2.md")

  tags = merge(local.foundational_security_acm_common_tags, {
    foundational_security_item_id  = "acm_2"
    foundational_security_category = "inventory_services"
  })
}
