locals {
  nist_sp_800_53_rev4_common_tags = {
    nist_sp_800_53_rev4 = "true"
    plugin              = "aws"
  }
}

benchmark "nist_sp_800_53_rev4" {
  title       = "NIST 800-53 Revision 4"
  description = "NIST 800-53 is a regulatory standard that defines the minimum baseline of security controls for all U.S. federal information systems except those related to national security. It defines the minimum baseline of security controls required by the Federal Information Processing Standard (FIPS)."

  children = [
    benchmark.nist_sp_800_53_rev4_ac_2_1,
    benchmark.nist_sp_800_53_rev4_ac_2_3,
    benchmark.nist_sp_800_53_rev4_ac_2_4,
    benchmark.nist_sp_800_53_rev4_ac_2_12_a
  ]

  tags = local.nist_sp_800_53_rev4_common_tags
}
