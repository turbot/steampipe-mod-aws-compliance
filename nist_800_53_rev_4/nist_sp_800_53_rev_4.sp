locals {
  nist_800_53_rev_4_common_tags = {
    nist_800_53_rev_4 = "true"
    plugin            = "aws"
  }
}

benchmark "nist_800_53_rev_4" {
  title       = "NIST 800-53 Revision 4"
  description = "NIST 800-53 is a regulatory standard that defines the minimum baseline of security controls for all U.S. federal information systems except those related to national security. It defines the minimum baseline of security controls required by the Federal Information Processing Standard (FIPS)."

  children = [
    benchmark.nist_800_53_rev_4_ac,
    benchmark.nist_800_53_rev_4_au_2_a_d,
    benchmark.nist_800_53_rev_4_au_3,
    benchmark.nist_800_53_rev_4_au_6_1_3,
    benchmark.nist_800_53_rev_4_au_7_1,
    benchmark.nist_800_53_rev_4_au_9,
    benchmark.nist_800_53_rev_4_au_9_2
  ]

  tags = local.nist_800_53_rev_4_common_tags
}
