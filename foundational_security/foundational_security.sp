locals {
  foundational_security_common_tags = {
    benchmark = "foundational_security"
    plugin    = "aws"
  }
}

benchmark "foundational_security" {
  title         = "Foundational Security Best Practices"
  description   = "The AWS Foundational Security Best Practices standard is a set of controls that detect when your deployed accounts and resources deviate from security best practices."
  documentation = file("./foundational_security/docs/foundational_security_overview.md")
  children = [
    benchmark.foundational_security_acm,
    benchmark.foundational_security_es,
    benchmark.foundational_security_sagemaker
  ]
  tags = local.foundational_security_common_tags
}
