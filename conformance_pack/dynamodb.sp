locals {
  conformance_pack_dynamodb_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/DynamoDB"
  })
}

control "dynamodb_table_auto_scaling_enabled" {
  title       = "DynamoDB table auto scaling should be enabled"
  description = "Amazon DynamoDB auto scaling uses the AWS Application Auto Scaling service to adjust provisioned throughput capacity that automatically responds to actual traffic patterns."
  sql         = query.dynamodb_table_auto_scaling_enabled.sql

  tags = merge(local.conformance_pack_dynamodb_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
  })
}

control "dynamodb_table_point_in_time_recovery_enabled" {
  title       = "DynamoDB table point-in-time recovery should be enabled"
  description = "Enable this rule to check that information has been backed up. It also maintains the backups by ensuring that point-in-time recovery is enabled in Amazon DynamoDB."
  sql         = query.dynamodb_table_point_in_time_recovery_enabled.sql

  tags = merge(local.conformance_pack_dynamodb_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
    soc_2                  = "true"
  })
}

control "dynamodb_table_encrypted_with_kms" {
  title       = "DynamoDB table should be encrypted with AWS KMS"
  description = "Ensure that encryption is enabled for your Amazon DynamoDB tables. Because sensitive data can exist at rest in these tables, enable encryption at rest to help protect that data."
  sql         = query.dynamodb_table_encrypted_with_kms.sql

  tags = merge(local.conformance_pack_dynamodb_common_tags, {
    cisa_cyber_essentials = "true"
    gdpr                  = "true"
    gxp_21_cfr_part_11    = "true"
    hipaa                 = "true"
    nist_800_171_rev_2    = "true"
    nist_800_53_rev_4     = "true"
    nist_800_53_rev_5     = "true"
    rbi_cyber_security    = "true"
  })
}

control "dynamodb_table_in_backup_plan" {
  title       = "DynamoDB tables should be in a backup plan"
  description = "To help with data back-up processes, ensure your Amazon DynamoDB tables are a part of an AWS Backup plan."
  sql         = query.dynamodb_table_in_backup_plan.sql

  tags = merge(local.conformance_pack_dynamodb_common_tags, {
    cisa_cyber_essentials = "true"
    ffiec                 = "true"
    gxp_21_cfr_part_11    = "true"
    hipaa                 = "true"
    nist_800_171_rev_2    = "true"
    nist_800_53_rev_4     = "true"
    nist_800_53_rev_5     = "true"
    nist_csf              = "true"
    rbi_cyber_security    = "true"
    soc_2                 = "true"
  })
}

control "dynamodb_table_encryption_enabled" {
  title       = "DynamoDB table should have encryption enabled"
  description = "Ensure that encryption is enabled for your Amazon DynamoDB tables. Because sensitive data can exist at rest in these tables, enable encryption at rest to help protect that data."
  sql         = query.dynamodb_table_encryption_enabled.sql

  tags = merge(local.conformance_pack_dynamodb_common_tags, {
    gdpr  = "true"
    hipaa = "true"
  })
}

control "dynamodb_table_protected_by_backup_plan" {
  title       = "DynamoDB table should be protected by backup plan"
  description = "Ensure if Amazon DynamoDB tables are protected by a backup plan. The rule is non complaint if the DynamoDB Table is not covered by a backup plan."
  sql         = query.dynamodb_table_protected_by_backup_plan.sql

  tags = merge(local.conformance_pack_dynamodb_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    hipaa                  = "true"
    nist_800_171_rev_2     = "true"
    nist_csf               = "true"
    soc_2                  = "true"
  })
}
