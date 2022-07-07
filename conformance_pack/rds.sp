locals {
  conformance_pack_rds_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/RDS"
  })
}

control "rds_db_instance_backup_enabled" {
  title       = "RDS DB instance backup should be enabled"
  description = "The backup feature of Amazon RDS creates backups of your databases and transaction logs."
  sql         = query.rds_db_instance_backup_enabled.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
    soc_2                  = "true"
  })
}

control "rds_db_instance_encryption_at_rest_enabled" {
  title       = "RDS DB instance encryption at rest should be enabled"
  description = "To help protect data at rest, ensure that encryption is enabled for your Amazon Relational Database Service (Amazon RDS) instances."
  sql         = query.rds_db_instance_encryption_at_rest_enabled.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gdpr                   = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
  })
}

control "rds_db_instance_multiple_az_enabled" {
  title       = "RDS DB instance multiple az should be enabled"
  description = "Multi-AZ support in Amazon Relational Database Service (Amazon RDS) provides enhanced availability and durability for database instances."
  sql         = query.rds_db_instance_multiple_az_enabled.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
  })
}

control "rds_db_instance_prohibit_public_access" {
  title       = "RDS DB instances should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon Relational Database Service (Amazon RDS) instances are not public."
  sql         = query.rds_db_instance_prohibit_public_access.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    audit_manager_control_tower = "true"
    fedramp_low_rev_4           = "true"
    fedramp_moderate_rev_4      = "true"
    ffiec                       = "true"
    gxp_21_cfr_part_11          = "true"
    hipaa                       = "true"
    nist_800_53_rev_4           = "true"
    nist_800_53_rev_5           = "true"
    nist_csf                    = "true"
    rbi_cyber_security          = "true"
    soc_2                       = "true"
  })
}

control "rds_db_snapshot_encrypted_at_rest" {
  title       = "RDS DB snapshots should be encrypted at rest"
  description = "Ensure that encryption is enabled for your Amazon Relational Database Service (Amazon RDS) snapshots."
  sql         = query.rds_db_snapshot_encrypted_at_rest.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    audit_manager_control_tower = "true"
    fedramp_moderate_rev_4      = "true"
    gdpr                        = "true"
    gxp_21_cfr_part_11          = "true"
    hipaa                       = "true"
    nist_800_53_rev_4           = "true"
    nist_800_53_rev_5           = "true"
    rbi_cyber_security          = "true"
  })
}

control "rds_db_snapshot_prohibit_public_access" {
  title       = "RDS snapshots should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon Relational Database Service (Amazon RDS) instances are not public."
  sql         = query.rds_db_snapshot_prohibit_public_access.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    audit_manager_control_tower = "true"
    fedramp_low_rev_4           = "true"
    fedramp_moderate_rev_4      = "true"
    ffiec                       = "true"
    gxp_21_cfr_part_11          = "true"
    hipaa                       = "true"
    nist_800_53_rev_4           = "true"
    nist_800_53_rev_5           = "true"
    nist_csf                    = "true"
    rbi_cyber_security          = "true"
  })
}

control "rds_db_instance_logging_enabled" {
  title       = "Database logging should be enabled"
  description = "To help with logging and monitoring within your environment, ensure Amazon Relational Database Service (Amazon RDS) logging is enabled."
  sql         = query.rds_db_instance_logging_enabled.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gdpr                   = "true"
    gxp_21_cfr_part_11     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    rbi_cyber_security     = "true"
    soc_2                  = "true"
  })
}

control "rds_db_instance_in_backup_plan" {
  title       = "RDS DB instances should be in a backup plan"
  description = "To help with data back-up processes, ensure your Amazon Relational Database Service (Amazon RDS) instances are a part of an AWS Backup plan."
  sql         = query.rds_db_instance_in_backup_plan.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    ffiec              = "true"
    gdpr               = "true"
    gxp_21_cfr_part_11 = "true"
    hipaa              = "true"
    nist_800_53_rev_4  = "true"
    nist_800_53_rev_5  = "true"
    nist_csf           = "true"
    rbi_cyber_security = "true"
    soc_2              = "true"
  })
}

control "rds_db_instance_and_cluster_enhanced_monitoring_enabled" {
  title       = "RDS DB instance and cluster enhanced monitoring should be enabled"
  description = "Enable Amazon Relational Database Service (Amazon RDS) to help monitor Amazon RDS availability. This provides detailed visibility into the health of your Amazon RDS database instances."
  sql         = query.rds_db_instance_and_cluster_enhanced_monitoring_enabled.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
  })
}

control "rds_db_instance_deletion_protection_enabled" {
  title       = "RDS DB instances should have deletion protection enabled"
  description = "Ensure Amazon Relational Database Service (Amazon RDS) instances have deletion protection enabled."
  sql         = query.rds_db_instance_deletion_protection_enabled.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    soc_2                  = "true"
  })
}

control "rds_db_instance_iam_authentication_enabled" {
  title       = "RDS DB instances should have iam authentication enabled"
  description = "Checks if an Amazon Relational Database Service (Amazon RDS) instance has AWS Identity and Access Management (IAM) authentication enabled."
  sql         = query.rds_db_instance_iam_authentication_enabled.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    soc_2 = "true"
  })
}

control "rds_db_cluster_aurora_protected_by_backup_plan" {
  title       = "RDS Aurora clusters should be protected by backup plan"
  description = "Checks if Amazon Aurora DB clusters are protected by a backup plan. The rule is non complaint if the Amazon Relational Database Service (Amazon RDS) Database Cluster is not protected by a backup plan."
  sql         = query.rds_db_cluster_aurora_protected_by_backup_plan.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    hipaa                  = "true"
    nist_csf               = "true"
    soc_2                  = "true"
  })
}

control "rds_db_instance_protected_by_backup_plan" {
  title       = "RDS DB instance should be protected by backup plan"
  description = "Ensure if Amazon Relational Database Service (Amazon RDS) instances are protected by a backup plan. The rule is non complaint if the Amazon RDS Database instance is not covered by a backup plan."
  sql         = query.rds_db_instance_protected_by_backup_plan.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    hipaa                  = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    soc_2                  = "true"
  })
}

control "rds_db_instance_automatic_minor_version_upgrade_enabled" {
  title       = "RDS DB instance automatic minor version upgrade should be enabled"
  description = "Ensure if Amazon Relational Database Service (RDS) database instances are configured for automatic minor version upgrades. The rule is NON_COMPLIANT if the value of 'autoMinorVersionUpgrade' is false."
  sql         = query.rds_db_instance_automatic_minor_version_upgrade_enabled.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    ffiec              = "true"
    rbi_cyber_security = "true"
  })
}

control "rds_db_instance_cloudwatch_logs_enabled" {
  title       = "RDS DB instances should be integrated with CloudWatch logs"
  description = "Use Amazon CloudWatch to centrally collect and manage RDS DB instance activity."
  sql         = query.rds_db_instance_cloudwatch_logs_enabled.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    other_checks = "true"
  })
}

control "rds_db_instance_ca_certificate_expires_7_days" {
  title       = "RDS DB instances CA certificates should not expire within next 7 days"
  description = "Ensure RDS DB instances CA certificates are not getting expired within the next 7 days."
  sql         = query.rds_db_instance_ca_certificate_expires_7_days.sql

  tags = merge(local.conformance_pack_rds_common_tags, {
    other_checks = "true"
  })
}
