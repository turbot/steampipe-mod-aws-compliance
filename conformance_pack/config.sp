locals {
  conformance_pack_config_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Config"
  })
}

control "config_enabled_all_regions" {
  title       = "AWS Config should be enabled"
  description = "This control checks whether AWS Config is enabled in the account for the local Region and is recording all resources."
  sql         = query.config_enabled_all_regions.sql

  tags = merge(local.conformance_pack_config_common_tags, {
    gdpr     = "true"
    hipaa    = "true"
    nist_csf = "true"
    soc_2    = "true"
  })
}
