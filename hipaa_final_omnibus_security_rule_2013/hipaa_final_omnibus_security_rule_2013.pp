locals {
  hipaa_final_omnibus_security_rule_2013_common_tags = merge(local.aws_compliance_common_tags, {
    hipaa_final_omnibus_security_rule_2013 = "true"
    type                                   = "Benchmark"
  })
}

benchmark "hipaa_final_omnibus_security_rule_2013" {
  title         = "AWS HIPAA Final Omnibus Security Rule 2013"
  description   = "The HIPAA Security Rule establishes national standards to protect individuals electronic personal health information that is created, received, used, or maintained by a business associate and covered entity. The Final Omnibus Rule provides additional guidance to the 2003 Security Rule and implements a number of provisions of the HITECH Act to strengthen the privacy and security protections for health information established under HIPAA."
  documentation = file("./hipaa_final_omnibus_security_rule_2013/docs/hipaa_final_omnibus_security_rule_2013_overview.md")
  children = [
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_310,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_312,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_314
  ]

  tags = local.hipaa_final_omnibus_security_rule_2013_common_tags
}
