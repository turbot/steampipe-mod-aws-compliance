locals {
  foundational_security_pca_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/PrivateCertificateAuthority"
  })
}

benchmark "foundational_security_pca" {
  title         = "Private Certificate Authority"
  documentation = file("./foundational_security/docs/foundational_security_pca.md")
  children = [
    control.foundational_security_pca_1
  ]

  tags = merge(local.foundational_security_pca_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_pca_1" {
  title         = "1 AWS Private CA root certificate authority should be disabled"
  description   = "This control checks if AWS Private CA has a root certificate authority (CA) that is disabled. The control fails if the root CA is enabled."
  severity      = "low"
  query         = query.acmpca_root_certificate_authority_disabled
  documentation = file("./foundational_security/docs/foundational_security_pca_1.md")

  tags = merge(local.foundational_security_pca_common_tags, {
    foundational_security_item_id  = "pca_1"
    foundational_security_category = "secure_network_configuration"
  })
}
