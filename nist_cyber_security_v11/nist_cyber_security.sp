locals {
  nist_cyber_security_v11_common_tags = {
    nist_cyber_security         = "true"
    nist_cyber_security_version = "v.1.1"
    plugin                      = "aws"
  }
}

benchmark "nist_cyber_security_v11" {
  title       = "NIST Cyber Security Framework"
  description = "NIST Cybersecurity Framework is a set of best practices, standards, and recommendations that help an organization improve its cybersecurity measures. The optional standards were compiled by NIST after former United States President Barack Obama signed an executive order in 2014."

  children = [
    benchmark.nist_cyber_security_v11_de,
    benchmark.nist_cyber_security_v11_id,
    benchmark.nist_cyber_security_v11_pr,
    benchmark.nist_cyber_security_v11_rs,
  ]

  tags = local.nist_cyber_security_v11_common_tags
}