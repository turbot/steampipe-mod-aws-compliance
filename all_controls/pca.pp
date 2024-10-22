locals {
  all_controls_pca_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/PrivateCertificateAuthority"
  })
}

benchmark "all_controls_pca" {
  title       = "Private Certificate Authority"
  description = "This section contains recommendations for configuring Private Certificate Authority resources."
  children = [
    control.acmpca_root_certificate_authority_disabled
  ]

  tags = merge(local.all_controls_pca_common_tags, {
    type = "Benchmark"
  })
}
