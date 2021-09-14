locals {
  gdpr_common_tags = {
    gdpr   = "true"
    plugin = "aws"
  }
}

benchmark "gdpr" {
  title         = "AWS General Data Protection Regulation (GDPR)"
  description   = "The European Union’s General Data Protection Regulation (GDPR) protects European Union (EU) individuals’ fundamental right to privacy and the protection of personal data. The GDPR includes robust requirements that raise and harmonize standards for data protection, security, and compliance."
  documentation = file("./gdpr/docs/gdpr_overview.md")
  children = [
    benchmark.article_25_data_protection_by_design_and_by_default,
    benchmark.article_30_records_of_processing_activities,
    benchmark.article_32_security_of_processing
  ]
  tags = local.gdpr_common_tags
}
