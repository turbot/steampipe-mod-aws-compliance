locals {
  hipaa_final_omnibus_security_rule_2013_common_tags = merge(local.aws_compliance_common_tags, {
    hipaa_final_omnibus_security_rule_2013 = "true"
    type                                   = "Benchmark"
  })
}

benchmark "hipaa_final_omnibus_security_rule_2013" {
  title         = "HIPAA Security Rule 2003"
  description   = "The HIPAA Security Rule establishes national standards to protect individuals' electronic personal health information that is created, received, used, or maintained by a covered entity. The Security Rule requires appropriate administrative, physical and technical safeguards to ensure the confidentiality, integrity, and security of electronic protected health information."
  documentation = file("./hipaa_final_omnibus_security_rule_2013/docs/hipaa_final_omnibus_security_rule_2013_overview.md")
  children = [
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_310,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_312,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_314
  ]

  tags = local.hipaa_final_omnibus_security_rule_2013_common_tags
}
