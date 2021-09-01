locals {
  gdpr_common_tags = {
    gdpr   = "true"
    plugin = "aws"
  }
}

benchmark "gdpr" {
  title         = "AWS General Data Protection Regulation"
  description   = "The General Data Protection Regulation (GDPR) is a new European privacy law that became enforceable on May 25, 2018. The GDPR replaces the EU Data Protection Directive, also known as Directive 95/46/EC. It's intended to harmonize data protection laws throughout the European Union (EU) by applying a single data protection law that is binding throughout each member state."
  documentation = file("./gdpr/docs/gdpr.md")
  children = [
    benchmark.article_25_data_protection_by_design_and_by_default,
  ]
  tags = local.gdpr_common_tags
}
