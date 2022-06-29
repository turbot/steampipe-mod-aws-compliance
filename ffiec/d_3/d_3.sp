locals {
  ffiec_d_3_common_tags = merge(local.ffiec_common_tags, {
    ffiec_domain = "3"
  })
}

benchmark "ffiec_d_3" {
  title       = "Cybersecurity Controls (Domain 3)"
  description = "Cybersecurity controls are the practices and processes used to protect assets, infrastructure, and information by strengthening the institution's defensive posture through continuous, automated protection and monitoring."
  children = [
    benchmark.ffiec_d_3_cc,
    benchmark.ffiec_d_3_dc,
    benchmark.ffiec_d_3_pc
  ]

  tags = local.ffiec_d_3_common_tags
}
