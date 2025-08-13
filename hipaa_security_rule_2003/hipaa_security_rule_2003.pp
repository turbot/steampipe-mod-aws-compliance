locals {
  hipaa_security_rule_2003_common_tags = merge(local.aws_compliance_common_tags, {
    hipaa_security_rule_2003 = "true"
    type                     = "Benchmark"
  })
}

benchmark "hipaa_security_rule_2003" {
  title       = "AWS HIPAA Security Rule 2003"
  description = "The HIPAA Security Rule establishes national standards to protect individuals’ electronic personal health information that is created, received, used, or maintained by a covered entity. The Security Rule requires appropriate administrative, physical and technical safeguards to ensure the confidentiality, integrity, and security of electronic protected health information."
  documentation = file("./hipaa_security_rule_2003/docs/hipaa_security_rule_2003_overview.md")
  children = [
    benchmark.hipaa_security_rule_2003_164_308,
    benchmark.hipaa_security_rule_2003_164_310,
    benchmark.hipaa_security_rule_2003_164_312,
    benchmark.hipaa_security_rule_2003_164_314
  ]

  tags = local.hipaa_security_rule_2003_common_tags
}
