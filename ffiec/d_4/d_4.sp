locals {
  ffiec_d_4_common_tags = merge(local.ffiec_common_tags, {
    ffiec_domain = "4"
  })
}

benchmark "ffiec_d_4" {
  title       = "External Dependency Management (Domain 4)"
  description = "External dependency management involves establishing and maintaining a comprehensive program to oversee and manage external connections and third-party relationships with access to the institution's technology assets and information."
  children = [
    benchmark.ffiec_d_4_c
  ]

  tags = local.ffiec_d_4_common_tags
}
