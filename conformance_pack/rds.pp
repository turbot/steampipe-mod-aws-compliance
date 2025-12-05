locals {
  conformance_pack_rds_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/RDS"
  })
}

control "rds_db_cluster_copy_tags_to_snapshot_enabled" {
  title       = "RDS DB clusters should be configured to copy tags to snapshots"
  description = "This control checks whether RDS DB clusters are configured to copy all tags to snapshots when the snapshots are created."
  query       = query.rds_db_cluster_copy_tags_to_snapshot_enabled

  tags = local.conformance_pack_rds_common_tags
}

control "rds_db_instance_copy_tags_to_snapshot_enabled" {
  title       = "RDS DB instances should be configured to copy tags to snapshots"
  description = "This control checks whether RDS DB instances are configured to copy all tags to snapshots when the snapshots are created."
  query       = query.rds_db_instance_copy_tags_to_snapshot_enabled

  tags = local.conformance_pack_rds_common_tags
}

control "rds_db_instance_in_vpc" {
  title       = "RDS instances should be deployed in a VPC"
  description = "This control checks whether an RDS instance is deployed in a VPC (EC2-VPC)."
  query       = query.rds_db_instance_in_vpc

  tags = local.conformance_pack_rds_common_tags
}

control "rds_db_cluster_events_subscription" {
  title       = "An RDS event notifications subscription should be configured for critical cluster events"
  description = "This control checks whether an AWS RDS event subscription exists that has notifications enabled for the following source type, event category key-value pairs."
  query       = query.rds_db_cluster_events_subscription

  tags = merge(local.conformance_pack_rds_common_tags, {
    acsc_essential_eight = "true"
    pci_dss_v40          = "true"
  })
}

control "rds_db_instance_events_subscription" {
  title       = "An RDS event notifications subscription should be configured for critical database instance events"
  description = "This control checks whether an AWS RDS event subscription exists with notifications enabled for the following source type, event category key-value pairs."
  query       = query.rds_db_instance_events_subscription

  tags = merge(local.conformance_pack_rds_common_tags, {
    acsc_essential_eight = "true"
    pci_dss_v40          = "true"
  })
}

control "rds_db_parameter_group_events_subscription" {
  title       = "An RDS event notifications subscription should be configured for critical database parameter group events"
  description = "This control checks whether an AWS RDS event subscription exists with notifications enabled for the following source type, event category key-value pairs."
  query       = query.rds_db_parameter_group_events_subscription

  tags = merge(local.conformance_pack_rds_common_tags, {
    acsc_essential_eight = "true"
    pci_dss_v40          = "true"
  })
}

control "rds_db_security_group_events_subscription" {
  title       = "An RDS event notifications subscription should be configured for critical database security group events"
  description = "This control checks whether an AWS RDS event subscription exists with notifications enabled for the following source type, event category key-value pairs."
  query       = query.rds_db_security_group_events_subscription

  tags = merge(local.conformance_pack_rds_common_tags, {
    acsc_essential_eight = "true"
    pci_dss_v40          = "true"
  })
}

control "rds_db_instance_and_cluster_no_default_port" {
  title       = "RDS databases and clusters should not use a database engine default port"
  description = "This control checks whether the RDS cluster or instance uses a port other than the default port of the database engine."
  query       = query.rds_db_instance_and_cluster_no_default_port

  tags = local.conformance_pack_rds_common_tags
}

control "rds_db_cluster_encryption_at_rest_enabled" {
  title       = "RDS DB clusters should be encrypted at rest"
  description = "This control checks if an RDS DB cluster is encrypted at rest. The control fails if an RDS DB cluster isn't encrypted at rest."
  query       = query.rds_db_cluster_encryption_at_rest_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
    nist_csf_v2 = "true"
  })
}

control "rds_db_instance_backup_enabled" {
  title       = "RDS DB instance backup should be enabled"
  description = "The backup feature of AWS RDS creates backups of your databases and transaction logs."
  query       = query.rds_db_instance_backup_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
    acsc_essential_eight                   = "true"
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "rds_db_instance_encryption_at_rest_enabled" {
  title       = "RDS DB instance encryption at rest should be enabled"
  description = "To help protect data at rest, ensure that encryption is enabled for your AWS Relational Database Service (AWS RDS) instances."
  query       = query.rds_db_instance_encryption_at_rest_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
    audit_manager_control_tower            = "true"
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "rds_db_instance_multiple_az_enabled" {
  title       = "RDS DB instance multiple az should be enabled"
  description = "Multi-AZ support in AWS Relational Database Service (AWS RDS) provides enhanced availability and durability for database instances."
  query       = query.rds_db_instance_multiple_az_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    nydfs_23                               = "true"
    rbi_itf_nbfc                           = "true"
  })
}

control "rds_db_instance_prohibit_public_access" {
  title       = "RDS DB instances should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring that AWS Relational Database Service (AWS RDS) instances are not public."
  query       = query.rds_db_instance_prohibit_public_access

  tags = merge(local.conformance_pack_rds_common_tags, {
    acsc_essential_eight                   = "true"
    audit_manager_control_tower            = "true"
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "rds_db_snapshot_encrypted_at_rest" {
  title       = "RDS DB snapshots should be encrypted at rest"
  description = "Ensure that encryption is enabled for your AWS Relational Database Service (AWS RDS) snapshots."
  query       = query.rds_db_snapshot_encrypted_at_rest

  tags = merge(local.conformance_pack_rds_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_moderate_rev_4                 = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "rds_db_snapshot_prohibit_public_access" {
  title       = "RDS snapshots should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring that AWS Relational Database Service (AWS RDS) instances are not public."
  query       = query.rds_db_snapshot_prohibit_public_access

  tags = merge(local.conformance_pack_rds_common_tags, {
    acsc_essential_eight                   = "true"
    audit_manager_control_tower            = "true"
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "rds_db_instance_logging_enabled" {
  title       = "Database logging should be enabled"
  description = "To help with logging and monitoring within your environment, ensure AWS Relational Database Service (AWS RDS) logging is enabled."
  query       = query.rds_db_instance_logging_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
    acsc_essential_eight                   = "true"
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "rds_db_instance_in_backup_plan" {
  title       = "RDS DB instances should be in a backup plan"
  description = "To help with data back-up processes, ensure your AWS Relational Database Service (AWS RDS) instances are a part of an AWS Backup plan."
  query       = query.rds_db_instance_in_backup_plan

  tags = merge(local.conformance_pack_rds_common_tags, {
    acsc_essential_eight                   = "true"
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "rds_db_instance_and_cluster_enhanced_monitoring_enabled" {
  title       = "RDS DB instance and cluster enhanced monitoring should be enabled"
  description = "Enable AWS Relational Database Service (AWS RDS) to help monitor AWS RDS availability. This provides detailed visibility into the health of your AWS RDS database instances."
  query       = query.rds_db_instance_and_cluster_enhanced_monitoring_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    nydfs_23                               = "true"
    rbi_itf_nbfc                           = "true"
  })
}

control "rds_db_instance_deletion_protection_enabled" {
  title       = "RDS DB instances should have deletion protection enabled"
  description = "Ensure AWS Relational Database Service (AWS RDS) instances have deletion protection enabled."
  query       = query.rds_db_instance_deletion_protection_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    nydfs_23                               = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "rds_db_instance_iam_authentication_enabled" {
  title       = "RDS DB instances should have iam authentication enabled"
  description = "Checks if an AWS Relational Database Service (AWS RDS) instance has AWS Identity and Access Management (IAM) authentication enabled."
  query       = query.rds_db_instance_iam_authentication_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
    acsc_essential_eight                   = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    soc_2                                  = "true"
  })
}

control "rds_db_cluster_iam_authentication_enabled" {
  title       = "IAM authentication should be configured for RDS clusters"
  description = "Checks if an AWS RDS Cluster has AWS Identity and Access Management (IAM) authentication enabled. The rule is non-compliant if an RDS Cluster does not have IAM authentication enabled."
  query       = query.rds_db_cluster_iam_authentication_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
    acsc_essential_eight = "true"
    nist_800_171_rev_2   = "true"
    nist_csf             = "true"
    pci_dss_v40          = "true"
  })
}

control "rds_db_cluster_aurora_protected_by_backup_plan" {
  title       = "RDS Aurora clusters should be protected by backup plan"
  description = "Checks if AWS Aurora DB clusters are protected by a backup plan. The rule is non-compliant if the AWS Relational Database Service (AWS RDS) Database Cluster is not protected by a backup plan."
  query       = query.rds_db_cluster_aurora_protected_by_backup_plan

  tags = merge(local.conformance_pack_rds_common_tags, {
    acsc_essential_eight                   = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "rds_db_instance_protected_by_backup_plan" {
  title       = "RDS DB instance should be protected by backup plan"
  description = "Ensure that AWS Relational Database Service (AWS RDS) instances are protected by a backup plan. The rule is non-compliant if the AWS RDS Database instance is not covered by a backup plan."
  query       = query.rds_db_instance_protected_by_backup_plan

  tags = merge(local.conformance_pack_rds_common_tags, {
    acsc_essential_eight                   = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    soc_2                                  = "true"
  })
}

control "rds_db_instance_automatic_minor_version_upgrade_enabled" {
  title       = "RDS DB instance automatic minor version upgrade should be enabled"
  description = "Ensure that AWS Relational Database Service (RDS) database instances are configured for automatic minor version upgrades. The rule is non-compliant if the value of 'autoMinorVersionUpgrade' is false."
  query       = query.rds_db_instance_automatic_minor_version_upgrade_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
    acsc_essential_eight  = "true"
    cisa_cyber_essentials = "true"
    ffiec                 = "true"
    nist_csf              = "true"
    pci_dss_v321          = "true"
    pci_dss_v40           = "true"
    rbi_cyber_security    = "true"
    rbi_itf_nbfc          = "true"
  })
}

control "rds_db_cluster_deletion_protection_enabled" {
  title       = "RDS clusters should have deletion protection enabled"
  description = "This control checks whether RDS clusters have deletion protection enabled. This control is intended for RDS DB instances. However, it can also generate findings for Aurora DB instances, Neptune DB instances, and AWS DocumentDB clusters. If these findings are not useful,then you can suppress them."
  query       = query.rds_db_cluster_deletion_protection_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
    nist_csf    = "true"
    nist_csf_v2 = "true"
  })
}

control "rds_db_instance_cloudwatch_logs_enabled" {
  title       = "RDS DB instances should be integrated with CloudWatch logs"
  description = "Use AWS CloudWatch to centrally collect and manage RDS DB instance activity."
  query       = query.rds_db_instance_cloudwatch_logs_enabled

  tags = local.conformance_pack_rds_common_tags
}

control "rds_db_instance_ca_certificate_expires_7_days" {
  title       = "RDS DB instances CA certificates should not expire within next 7 days"
  description = "Ensure RDS DB instances CA certificates are not getting expired within the next 7 days."
  query       = query.rds_db_instance_ca_certificate_expires_7_days

  tags = local.conformance_pack_rds_common_tags
}

control "rds_db_instance_no_default_admin_name" {
  title       = "RDS database instances should use a custom administrator username"
  description = "This control checks whether you've changed the administrative username for AWS Relational Database Service (AWS RDS) database instances from the default value. The control fails if the administrative username is set to the default value."
  query       = query.rds_db_instance_no_default_admin_name

  tags = merge(local.conformance_pack_rds_common_tags, {
    nist_csf     = "true"
    pci_dss_v321 = "true"
  })
}

control "rds_db_cluster_no_default_admin_name" {
  title       = "RDS database clusters should use a custom administrator username"
  description = "This control checks whether an AWS RDS database cluster has changed the admin username from its default value. This rule will fail if the admin username is set to the default value."
  query       = query.rds_db_cluster_no_default_admin_name

  tags = merge(local.conformance_pack_rds_common_tags, {
    nist_csf     = "true"
    pci_dss_v321 = "true"
  })
}

control "rds_db_cluster_aurora_backtracking_enabled" {
  title       = "RDS Aurora clusters should have backtracking enabled"
  description = "This control checks whether AWS Aurora clusters have backtracking enabled. Backups help you to recover more quickly from a security incident. They also strengthen the resilience of your systems. Aurora backtracking reduces the time to recover a database to a point in time. It does not require a database restore to so."
  query       = query.rds_db_cluster_aurora_backtracking_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
    acsc_essential_eight = "true"
    nist_csf             = "true"
  })
}

control "rds_db_cluster_multiple_az_enabled" {
  title       = "RDS DB clusters should be configured for multiple Availability Zones"
  description = "This control checks whether high availability is enabled for your RDS DB clusters. RDS DB clusters should be configured for multiple Availability Zones to ensure availability of the data that is stored."
  query       = query.rds_db_cluster_multiple_az_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
    nist_csf    = "true"
    nist_csf_v2 = "true"
  })
}

control "rds_db_instance_connections_encryption_enabled" {
  title       = "RDS DB instances connections should be encrypted"
  description = "This control checks if RDS DB instance connections are encrypted. Secure Sockets Layer (SSL) is used to encrypt between client applications and AWS RDS DB instances running Microsoft SQL Server or PostgreSQL."
  query       = query.rds_db_instance_connections_encryption_enabled

  tags = local.conformance_pack_rds_common_tags
}

control "rds_db_cluster_aurora_postgres_not_exposed_to_local_file_read_vulnerability" {
  title       = "RDS Aurora PostgreSQL clusters should not be exposed to local file read vulnerability"
  description = "This control checks whether AWS Aurora PostgreSQL clusters are exposed to local file read vulnerability by ensuring that AWS RDS PostgreSQL instances use a non-vulnerable version of the log_fdw."
  query       = query.rds_db_cluster_aurora_postgres_not_exposed_to_local_file_read_vulnerability

  tags = local.conformance_pack_rds_common_tags
}

control "rds_db_cluster_encrypted_with_cmk" {
  title       = "RDS DB clusters should be encrypted with CMK"
  description = "Ensure RDS DB cluster is encrypted using CMK. The rule is non-compliant if the RDS DB cluster is not encrypted using CMK."
  query       = query.rds_db_cluster_encrypted_with_cmk

  tags = local.conformance_pack_rds_common_tags
}

control "rds_db_instance_backup_retention_period_less_than_7" {
  title       = "RDS DB instances backup retention period should be greater than or equal to 7"
  description = "Ensure RDS DB instance backup retention period is greater than or equal to 7."
  query       = query.rds_db_instance_backup_retention_period_less_than_7

  tags = local.conformance_pack_rds_common_tags
}

control "rds_db_instance_no_public_subnet" {
  title       = "RDS DB instances should not use public subnet"
  description = "This control checks if RDS DB instance is configured with public subnet as there is a risk of exposing sensitive data."
  query       = query.rds_db_instance_no_public_subnet

  tags = local.conformance_pack_rds_common_tags
}

control "rds_db_instance_postgres_not_exposed_to_local_file_read_vulnerability" {
  title       = "RDS PostgreSQL DB instances should not be exposed to local file read vulnerability"
  description = "This control checks whether AWS PostgreSQL DB isntance are exposed to local file read vulnerability by ensuring that AWS RDS PostgreSQL instances use a non-vulnerable version of the log_fdw."
  query       = query.rds_db_instance_postgres_not_exposed_to_local_file_read_vulnerability

  tags = local.conformance_pack_rds_common_tags
}

control "rds_db_cluster_automatic_minor_version_upgrade_enabled" {
  title       = "RDS DB clusters should have automatic minor version upgrade enabled"
  description = "This control checks if automatic minor version upgrade is enabled for an Amazon RDS database cluster. The control fails if automatic minor version upgrade isn't enabled for an RDS cluster."
  query       = query.rds_db_cluster_automatic_minor_version_upgrade_enabled

  tags = local.conformance_pack_rds_common_tags
}

control "rds_db_cluster_aurora_mysql_audit_logging_enabled" {
  title       = "Aurora MySQL DB clusters should have audit logging enabled"
  description = "This control checks whether an Amazon Aurora MySQL DB cluster has audit logging enabled. The control fails if an Aurora MySQL DB cluster doesn't have audit logging enabled."
  query       = query.rds_db_cluster_aurora_mysql_audit_logging_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
    acsc_essential_eight = "true"
    pci_dss_v40          = "true"
  })
}

control "rds_db_instance_postgres_logging_enabled" {
  title         = "RDS for PostgreSQL DB instances should publish logs to CloudWatch Logs"
  description   = "This control checks whether an Amazon RDS for PostgreSQL DB instance is configured to publish logs to Amazon CloudWatch Logs. The control fails if the PostgreSQL DB instance isn't configured to publish the log types mentioned in the logTypes parameter to CloudWatch Logs."
  query         = query.rds_db_instance_postgres_logging_enabled

  tags = local.conformance_pack_rds_common_tags
}

control "rds_db_cluster_aurora_postgres_logging_enabled" {
  title         = "Aurora PostgreSQL DB clusters should publish logs to CloudWatch Logs"
  description   = "This control checks whether an Amazon Aurora PostgreSQL DB cluster is configured to publish logs to Amazon CloudWatch Logs. The control fails if the Aurora PostgreSQL DB cluster isn't configured to publish PostgreSQL logs to CloudWatch Logs."
  query         = query.rds_db_cluster_aurora_postgres_logging_enabled

  tags = local.conformance_pack_rds_common_tags
}

control "rds_db_instance_sql_server_encryption_in_transit_enabled" {
  title         = "RDS for SQL Server DB instances should be encrypted in transit"
  description   = "This control checks whether a connection to an Amazon RDS for Microsoft SQL Server DB instance is encrypted in transit. The control fails if the rds.force_ssl parameter of the parameter group associated with the DB instance is set to 0 (off)."
  query         = query.rds_db_instance_sql_server_encryption_in_transit_enabled

  tags = local.conformance_pack_rds_common_tags
}

control "rds_db_instance_sql_server_logging_enabled" {
  title         = "RDS for SQL Server DB instances should publish logs to CloudWatch Logs"
  description   = "This control checks whether an Amazon RDS for Microsoft SQL Server DB instance is configured to publish logs to Amazon CloudWatch Logs. The control fails if the RDS for SQL Server DB instance isn't configured to publish logs to CloudWatch Logs. You can optionally specify the types of logs that a DB instance should be configured to publish."
  query         = query.rds_db_instance_sql_server_logging_enabled

  tags = local.conformance_pack_rds_common_tags
}

control "rds_db_instance_mariadb_logging_enabled" {
  title         = "RDS for MariaDB DB instances should publish logs to CloudWatch Logs"
  description   = "This control checks whether an Amazon RDS for MariaDB DB instance is configured to publish certain types of logs to Amazon CloudWatch Logs. The control fails if the MariaDB DB instance isn't configured to publish the logs to CloudWatch Logs. You can optionally specify which types of logs a MariaDB DB instance should be configured to publish."
  query         = query.rds_db_instance_mariadb_logging_enabled

  tags = local.conformance_pack_rds_common_tags
}

control "rds_db_instance_mariadb_encryption_in_transit_enabled" {
  title         = "RDS for MariaDB DB instances should be encrypted in transit"
  description   = "This control checks whether connections to an Amazon RDS for MariaDB DB instance are encrypted in transit. The control fails if the DB parameter group associated with the DB instance is not in sync, or the require_secure_transport parameter of the parameter group is not set to ON."
  query         = query.rds_db_instance_mariadb_encryption_in_transit_enabled

  tags = local.conformance_pack_rds_common_tags
}

control "rds_db_cluster_aurora_mysql_copy_tags_to_snapshot_enabled" {
  title         = "RDS for MySQL DB clusters should be configured to copy tags to DB snapshots"
  description   = "This control checks whether an Amazon RDS for MySQL DB cluster is configured to automatically copy tags to snapshots of the DB cluster when the snapshots are created. The control fails if the CopyTagsToSnapshot parameter is set to false for the RDS for MySQL DB cluster."
  query         = query.rds_db_cluster_aurora_mysql_copy_tags_to_snapshot_enabled

  tags = local.conformance_pack_rds_common_tags
}

control "rds_db_proxy_tls_encryption_enabled" {
  title       = "RDS DB proxy should require TLS for all connections"
  description = "This control checks whether an Amazon RDS DB proxy requires TLS for all connections between the proxy and the underlying RDS DB instance. The control fails if the proxy doesn't require TLS for all connections between the proxy and the RDS DB instance."
  query       = query.rds_db_proxy_tls_encryption_enabled

  tags = local.conformance_pack_rds_common_tags
}

control "rds_db_cluster_aurora_postgres_copy_tags_to_snapshot_enabled" {
  title         = "RDS for PostgreSQL DB clusters should be configured to copy tags to DB snapshots"
  description   = "This control checks whether an Amazon RDS for PostgreSQL DB cluster is configured to automatically copy tags to snapshots of the DB cluster when the snapshots are created. The control fails if the CopyTagsToSnapshot parameter is set to false for the RDS for PostgreSQL DB cluster."
  query         = query.rds_db_cluster_aurora_postgres_copy_tags_to_snapshot_enabled

  tags = local.conformance_pack_rds_common_tags
}

query "rds_db_instance_backup_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when backup_retention_period < 1 then 'alarm'
        else 'ok'
      end as status,
      case
        when backup_retention_period < 1 then title || ' backups not enabled.'
        else title || ' backups enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_instance;
  EOQ
}

query "rds_db_instance_backup_retention_period_less_than_7" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when backup_retention_period < 7 then 'alarm'
        else 'ok'
      end as status,
      title || ' backup retention period set to ' || backup_retention_period || '.'  as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_instance;
  EOQ
}

query "rds_db_instance_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when storage_encrypted then 'ok'
        else 'alarm'
      end as status,
      case
        when storage_encrypted then title || ' encrypted at rest.'
        else title || ' not encrypted at rest.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_instance;
  EOQ
}

query "rds_db_instance_multiple_az_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when engine ilike any (array ['%aurora-mysql%', '%aurora-postgres%']) then 'skip'
        when multi_az then 'ok'
        else 'alarm'
      end as status,
      case
        when engine ilike any (array ['%aurora-mysql%', '%aurora-postgres%']) then title || ' cluster instance.'
        when multi_az then title || ' Multi-AZ enabled.'
        else title || ' Multi-AZ disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_instance;
  EOQ
}

query "rds_db_instance_prohibit_public_access" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when publicly_accessible then 'alarm'
        else 'ok'
      end status,
      case
        when publicly_accessible then title || ' publicly accessible.'
        else title || ' not publicly accessible.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_instance;
  EOQ
}

query "rds_db_snapshot_encrypted_at_rest" {
  sql = <<-EOQ
    (
    select
      arn as resource,
      case
        when storage_encrypted then 'ok'
        else 'alarm'
      end as status,
      case
        when storage_encrypted then title || ' encrypted at rest.'
        else title || ' not encrypted at rest.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_cluster_snapshot
    )
    union
    (
    select
      arn as resource,
      case
        when encrypted then 'ok'
        else 'alarm'
      end as status,
      case
        when encrypted then title || ' encrypted at rest.'
        else title || ' not encrypted at rest.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_snapshot
    );
  EOQ
}

query "rds_db_snapshot_prohibit_public_access" {
  sql = <<-EOQ
    (
    select
      arn as resource,
      case
        when cluster_snapshot -> 'AttributeValues' = '["all"]' then 'alarm'
        else 'ok'
      end status,
      case
        when cluster_snapshot -> 'AttributeValues' = '["all"]' then title || ' publicly restorable.'
        else title || ' not publicly restorable.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_cluster_snapshot,
      jsonb_array_elements(db_cluster_snapshot_attributes) as cluster_snapshot
    )
    union
    (
    select
      arn as resource,
      case
        when database_snapshot -> 'AttributeValues' = '["all"]' then 'alarm'
        else 'ok'
      end status,
      case
        when database_snapshot -> 'AttributeValues' = '["all"]' then title || ' publicly restorable.'
        else title || ' not publicly restorable.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_snapshot,
      jsonb_array_elements(db_snapshot_attributes) as database_snapshot
    );
  EOQ
}

query "rds_db_instance_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when engine = 'docdb' then 'skip'
        when engine like any (array ['mariadb', '%mysql']) and enabled_cloudwatch_logs_exports ?& array ['audit','error','general','slowquery'] then 'ok'
        when engine like any (array['%postgres%']) and enabled_cloudwatch_logs_exports ?& array ['postgresql','upgrade'] then 'ok'
        when engine like 'oracle%' and enabled_cloudwatch_logs_exports ?& array ['alert','audit', 'trace','listener'] then 'ok'
        when engine = 'sqlserver-ex' and enabled_cloudwatch_logs_exports ?& array ['error'] then 'ok'
        when engine like 'sqlserver%' and enabled_cloudwatch_logs_exports ?& array ['error','agent'] then 'ok'
        else 'alarm'
      end as status,
      case
        when engine = 'docdb' then title || ' is docdb instance.'
        when engine like any (array ['mariadb', '%mysql']) and enabled_cloudwatch_logs_exports ?& array ['audit','error','general','slowquery']
        then title || ' ' || engine || ' logging enabled.'
        when engine like any (array['%postgres%']) and enabled_cloudwatch_logs_exports ?& array ['postgresql','upgrade']
        then title || ' ' || engine || ' logging enabled.'
        when engine like 'oracle%' and enabled_cloudwatch_logs_exports ?& array ['alert','audit', 'trace','listener']
        then title || ' ' || engine || ' logging enabled.'
        when engine = 'sqlserver-ex' and enabled_cloudwatch_logs_exports ?& array ['error']
        then title || ' ' || engine || ' logging enabled.'
        when engine like 'sqlserver%' and enabled_cloudwatch_logs_exports ?& array ['error','agent']
        then title || ' ' || engine || ' logging enabled.'
        else title || ' logging not enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_instance;
  EOQ
}

query "rds_db_instance_in_backup_plan" {
  sql = <<-EOQ
    with mapped_with_id as (
      select
        jsonb_agg(elems) as mapped_ids
      from
        aws_backup_selection,
        jsonb_array_elements(resources) as elems
      group by backup_plan_id
    ),
    mapped_with_tags as (
      select
        jsonb_agg(elems ->> 'ConditionKey') as mapped_tags
      from
        aws_backup_selection,
        jsonb_array_elements(list_of_tags) as elems
      group by backup_plan_id
    ),
    backed_up_instance as (
      select
        i.db_instance_identifier
      from
        aws_rds_db_instance as i
        join mapped_with_id as t on t.mapped_ids ?| array[i.arn]
      union
      select
        i.db_instance_identifier
      from
        aws_rds_db_instance as i
        join mapped_with_tags as t on t.mapped_tags ?| array(select jsonb_object_keys(tags))
    )
    select
      i.arn as resource,
      case
        when b.db_instance_identifier is null then 'alarm'
        else 'ok'
      end as status,
      case
        when b.db_instance_identifier is null then i.title || ' not in backup plan.'
        else i.title || ' in backup plan.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
    from
      aws_rds_db_instance as i
      left join backed_up_instance as b on i.db_instance_identifier = b.db_instance_identifier;
  EOQ
}

query "rds_db_instance_and_cluster_enhanced_monitoring_enabled" {
  sql = <<-EOQ
    (
    select
      arn as resource,
      case
        when enabled_cloudwatch_logs_exports is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when enabled_cloudwatch_logs_exports is not null then title || ' enhanced monitoring enabled.'
        else title || ' enhanced monitoring not enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_cluster
    )
    union
    (
    select
      arn as resource,
      case
        when class = 'db.m1.small' then 'skip'
        when enhanced_monitoring_resource_arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when class = 'db.m1.small' then title || ' enhanced monitoring not supported.'
        when enhanced_monitoring_resource_arn is not null then title || ' enhanced monitoring enabled.'
        else title || ' enhanced monitoring not enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_instance
    );
  EOQ
}

query "rds_db_instance_deletion_protection_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when engine like any(array['aurora%', 'docdb', 'neptune']) then 'skip'
        when deletion_protection then 'ok'
        else 'alarm'
      end status,
      case
        when engine like any(array['aurora%', 'docdb', 'neptune']) then title || ' has engine ' || engine || ' cluster, deletion protection is set at cluster level.'
        when deletion_protection then title || ' deletion protection enabled.'
        else title || ' deletion protection not enabled.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_instance;
  EOQ
}

query "rds_db_instance_iam_authentication_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when iam_database_authentication_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when iam_database_authentication_enabled then title || ' IAM authentication enabled.'
        else title || ' IAM authentication not enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_instance;
  EOQ
}

query "rds_db_cluster_iam_authentication_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when iam_database_authentication_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when iam_database_authentication_enabled then title || ' IAM authentication enabled.'
        else title || ' IAM authentication not enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_cluster;
  EOQ
}

query "rds_db_cluster_aurora_protected_by_backup_plan" {
  sql = <<-EOQ
    with backup_protected_cluster as (
      select
        resource_arn as arn
      from
        aws_backup_protected_resource as b
      where
        resource_type = 'Aurora'
    )
    select
      c.arn as resource,
      case
        when c.engine not like '%aurora%' then 'skip'
        when b.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when c.engine not like '%aurora%' then c.title || ' not Aurora resources.'
        when b.arn is not null then c.title || ' is protected by backup plan.'
        else c.title || ' is not protected by backup plan.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
    from
      aws_rds_db_cluster as c
      left join backup_protected_cluster as b on c.arn = b.arn;
  EOQ
}

query "rds_db_instance_protected_by_backup_plan" {
  sql = <<-EOQ
    with backup_protected_rds_isntance as (
      select
        resource_arn as arn
      from
        aws_backup_protected_resource as b
      where
        resource_type = 'RDS'
    )
    select
      r.arn as resource,
      case
        when b.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.arn is not null then r.title || ' is protected by backup plan.'
        else r.title || ' is not protected by backup plan.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "r.")}
    from
      aws_rds_db_instance as r
      left join backup_protected_rds_isntance as b on r.arn = b.arn;
  EOQ
}

query "rds_db_instance_automatic_minor_version_upgrade_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when auto_minor_version_upgrade then 'ok'
        else 'alarm'
      end as status,
      case
        when auto_minor_version_upgrade then title || ' automatic minor version upgrades enabled.'
        else title || ' automatic minor version upgrades not enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_instance;
  EOQ
}

query "rds_db_cluster_deletion_protection_enabled" {
  sql = <<-EOQ
    select
      db_cluster_identifier as resource,
      case
        when deletion_protection then 'ok'
        else 'alarm'
      end as status,
      case
        when deletion_protection then title || ' deletion protection enabled.'
        else title || ' deletion protection not enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_cluster;
  EOQ
}

query "rds_db_instance_cloudwatch_logs_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when enabled_cloudwatch_logs_exports is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when enabled_cloudwatch_logs_exports is not null then title || ' integrated with CloudWatch logs.'
        else title || ' not integrated with CloudWatch logs.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_instance;
  EOQ
}

query "rds_db_instance_ca_certificate_expires_7_days" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when extract(day from (to_timestamp(certificate ->> 'ValidTill','YYYY-MM-DDTHH:MI:SS')) - current_timestamp) <= '7' then 'alarm'
        else 'ok'
      end as status,
        title || ' expires ' || to_char(to_timestamp(certificate ->> 'ValidTill','YYYY-MM-DDTHH:MI:SS'), 'DD-Mon-YYYY') ||
        ' (' || extract(day from (to_timestamp(certificate ->> 'ValidTill','YYYY-MM-DDTHH:MI:SS')) - current_timestamp) || ' days).'
      as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_instance;
  EOQ
}

query "rds_db_instance_no_default_admin_name" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when master_user_name in ('admin','postgres') then 'alarm'
        else 'ok'
      end status,
      case
        when master_user_name in ('admin', 'postgres') then title || ' using default master user name.'
        else title || ' not using default master user name.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_instance;
  EOQ
}

query "rds_db_cluster_no_default_admin_name" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when master_user_name in ('admin', 'postgres') then 'alarm'
        else 'ok'
      end status,
      case
        when master_user_name in ('admin', 'postgres') then title || ' using default master user name.'
        else title || ' not using default master user name.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_cluster;
  EOQ
}

query "rds_db_cluster_aurora_backtracking_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when engine not ilike '%aurora-mysql%' then 'skip'
        when backtrack_window is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when engine not ilike '%aurora-mysql%' then title || ' not Aurora MySQL-compatible edition.'
        when backtrack_window is not null then title || ' backtracking enabled.'
        else title || ' backtracking not enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_cluster;
  EOQ
}

query "rds_db_cluster_multiple_az_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when multi_az then 'ok'
        else 'alarm'
      end as status,
      case
        when multi_az then title || ' Multi-AZ enabled.'
        else title || ' Multi-AZ disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_cluster;
  EOQ
}

query "rds_db_cluster_copy_tags_to_snapshot_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when copy_tags_to_snapshot then 'ok'
        else 'alarm'
      end as status,
      case
        when copy_tags_to_snapshot then title || ' copy tags to snapshot enabled.'
        else title || ' copy tags to snapshot disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_cluster;
  EOQ
}

query "rds_db_cluster_events_subscription" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when source_type <> 'db-cluster' then 'skip'
        when source_type = 'db-cluster' and enabled and event_categories_list @> '["failure", "maintenance"]' then 'ok'
        else 'alarm'
      end as status,
      case
        when source_type <> 'db-cluster' then cust_subscription_id || ' event subscription of ' || source_type || ' type.'
        when source_type = 'db-cluster' and enabled and event_categories_list @> '["failure", "maintenance"]' then cust_subscription_id || ' event subscription enabled for critical db cluster events.'
        else cust_subscription_id || ' event subscription missing critical db cluster events.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_rds_db_event_subscription;
  EOQ
}

query "rds_db_instance_and_cluster_no_default_port" {
  sql = <<-EOQ
    (
    select
      arn as resource,
      case
          when engine similar to '%(aurora|mysql|mariadb)%' and port = '3306' then 'alarm'
          when engine like '%postgres%' and port = '5432' then 'alarm'
          when engine like 'oracle%' and port = '1521' then 'alarm'
          when engine like 'sqlserver%' and port = '1433' then 'alarm'
        else 'ok'
      end as status,
      case
          when engine similar to '%(aurora|mysql|mariadb)%' and port = '3306' then  title || ' ' ||  engine || ' uses a default port.'
          when engine like '%postgres%' and port = '5432' then  title || ' ' ||  engine || ' uses a default port.'
          when engine like 'oracle%' and port = '1521' then  title || ' ' ||  engine || ' uses a default port.'
          when engine like 'sqlserver%' and port = '1433' then  title || ' ' ||  engine || ' uses a default port.'
        else title || ' doesnt use a default port.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_cluster
    )
    union
    (
    select
      arn as resource,
      case
          when engine similar to '%(aurora|mysql|mariadb)%' and port = '3306' then 'alarm'
          when engine like '%postgres%' and port = '5432' then 'alarm'
          when engine like 'oracle%' and port = '1521' then 'alarm'
          when engine like 'sqlserver%' and port = '1433' then 'alarm'
        else 'ok'
      end as status,
      case
          when engine similar to '%(aurora|mysql|mariadb)%' and port = '3306' then  title || ' ' ||  engine || ' uses a default port.'
          when engine like '%postgres%' and port = '5432' then  title || ' ' ||  engine || ' uses a default port.'
          when engine like 'oracle%' and port = '1521' then  title || ' ' ||  engine || ' uses a default port.'
          when engine like 'sqlserver%' and port = '1433' then  title || ' ' ||  engine || ' uses a default port.'
        else title || ' doesnt use a default port.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_instance
    );
  EOQ
}

query "rds_db_instance_copy_tags_to_snapshot_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when copy_tags_to_snapshot then 'ok'
        else 'alarm'
      end as status,
      case
        when copy_tags_to_snapshot then title || ' copy tags to snapshot enabled.'
        else title || ' copy tags to snapshot disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_instance;
  EOQ
}

query "rds_db_instance_events_subscription" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when source_type <> 'db-instance' then 'skip'
        when source_type = 'db-instance' and enabled and event_categories_list @> '["failure", "maintenance", "configuration change"]' then 'ok'
        else 'alarm'
      end as status,
      case
        when source_type <> 'db-instance' then cust_subscription_id || ' event subscription of ' || source_type || ' type.'
        when source_type like 'db-instance' and enabled and event_categories_list @> '["failure", "maintenance", "configuration change"]' then cust_subscription_id || ' event subscription enabled for critical instance events.'
        else cust_subscription_id || ' event subscription missing critical instance events.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_rds_db_event_subscription;
  EOQ
}

query "rds_db_instance_in_vpc" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when vpc_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when vpc_id is null then title || ' is not in VPC.'
        else title || ' is in VPC ' || vpc_id || '.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_instance;
  EOQ
}

query "rds_db_parameter_group_events_subscription" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when source_type <> 'db-parameter-group' then 'skip'
        when source_type = 'db-parameter-group' and enabled and event_categories_list @> '["maintenance", "failure"]' then 'ok'
        else 'alarm'
      end as status,
      case
        when source_type <> 'db-parameter-group' then cust_subscription_id || ' event subscription of ' || source_type || ' type.'
        when source_type = 'db-parameter-group' and enabled and event_categories_list @> '["configuration change"]' then cust_subscription_id || ' event subscription enabled for critical database parameter group events.'
        else cust_subscription_id || ' event subscription missing critical database parameter group events.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_rds_db_event_subscription;
  EOQ
}

query "rds_db_security_group_events_subscription" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when source_type <> 'db-security-group' then 'skip'
        when source_type = 'db-security-group' and enabled and event_categories_list @> '["failure", "configuration change"]' then 'ok'
        else 'alarm'
      end as status,
      case
        when source_type <> 'db-security-group' then cust_subscription_id || ' event subscription of ' || source_type || ' type.'
        when source_type = 'db-security-group' and enabled and event_categories_list @> '["failure", "configuration change"]' then cust_subscription_id || ' event subscription enabled for critical database security group events.'
        else cust_subscription_id || ' event subscription missing critical database security group events.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_rds_db_event_subscription;
  EOQ
}

query "rds_db_instance_connections_encryption_enabled" {
  sql = <<-EOQ
    with instance_pg as (
      select
        g ->> 'DBParameterGroupName' as pg_name,
        i.engine,
        i.title,
        i.arn,
        i.tags,
        i.region,
        i.account_id,
        i._ctx
      from
        aws_rds_db_instance as i,
        jsonb_array_elements(db_parameter_groups) as g
    ), pg_with_ssl_enabled as (
      select
        g.name
      from
        instance_pg as i,
        aws_rds_db_parameter_group as g,
        jsonb_array_elements(parameters) as p
      where
        i.pg_name = g.name
        and g.account_id = i.account_id
        and g.region = i.region
        and p ->> 'ParameterName' = 'rds.force_ssl'
        and p ->> 'ParameterValue' = '1'
    )
    select
      i.arn as resource,
      i.engine,
      case
        when i.engine not in ('sqlserver', 'postgres') then 'skip'
        when p.name is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when i.engine not in ('sqlserver', 'postgres') then title || ' has ' || engine || ' engine type.'
        when p.name is not null then title || ' connections are SSL encrypted.'
        else title || ' connections are not SSL encrypted.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      instance_pg as i
      left join pg_with_ssl_enabled as p on p.name = i.pg_name
  EOQ
}

query "rds_db_cluster_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when storage_encrypted then 'ok'
        else 'alarm'
      end as status,
      case
        when storage_encrypted then title || ' encrypted at rest.'
        else title || ' not encrypted at rest.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_cluster;
  EOQ
}

query "rds_db_cluster_aurora_postgres_not_exposed_to_local_file_read_vulnerability" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when not engine ilike '%aurora-postgres%' then 'skip'
        when engine ilike '%aurora-postgres%' and engine_version like any (array ['10.11', '10.12', '10.13', '11.6', '11.7', '11.8']) then 'alarm'
        else 'ok'
      end as status,
      case
        when not engine ilike '%aurora-postgres%' then title || ' not Aurora PostgreSQL edition.'
        when engine ilike '%aurora-postgres%' and engine_version like any (array ['10.11', '10.12', '10.13', '11.6', '11.7', '11.8']) then title || ' exposed to local file read vulnerability.'
        else title || ' not exposed to local file read vulnerability.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_instance;
  EOQ
}

query "rds_db_cluster_encrypted_with_cmk" {
  sql = <<-EOQ
    with rds_clusters as (
      select
        arn,
        region,
        account_id,
        kms_key_id,
        storage_encrypted,
        title,
        tags,
        _ctx
      from
        aws_rds_db_cluster
    ), kms_keys as (
      select
        k.arn,
        k.key_manager,
        k.enabled
      from
        aws_kms_key as k
    )
    select
      r.arn as resource,
      case
        when not storage_encrypted then 'alarm'
        when storage_encrypted and c.key_manager = 'CUSTOMER' then 'ok'
        else 'alarm'
      end as status,
      case
        when not storage_encrypted then title || ' not encrypted.'
        when storage_encrypted and c.key_manager = 'CUSTOMER' then title || ' encrypted with CMK.'
        else title || ' not encrypted with CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      rds_clusters as r
      left join kms_keys as c on r.kms_key_id = c.arn;
  EOQ
}

query "rds_db_instance_no_public_subnet" {
  sql = <<-EOQ
    with subnets_with_explicit_route as (
      select
        distinct ( a ->> 'SubnetId') as all_sub
      from
        aws_vpc_route_table as t,
        jsonb_array_elements(associations) as a
      where
        a ->> 'SubnetId' is not null
    ), public_subnets_with_explicit_route as (
      select
        distinct a ->> 'SubnetId' as SubnetId
      from
        aws_vpc_route_table as t,
        jsonb_array_elements(associations) as a,
        jsonb_array_elements(routes) as r
      where
        r ->> 'DestinationCidrBlock' = '0.0.0.0/0'
        and
          (
            r ->> 'GatewayId' like 'igw-%'
            or r ->> 'NatGatewayId' like 'nat-%'
          )
        and a ->> 'SubnetId' is not null
    ), public_subnets_with_implicit_route as (
        select
        distinct route_table_id,
        vpc_id,
        region
      from
        aws_vpc_route_table as t,
        jsonb_array_elements(associations) as a,
        jsonb_array_elements(routes) as r
      where
        a ->> 'Main' = 'true'
        and r ->> 'DestinationCidrBlock' = '0.0.0.0/0'
        and (
            r ->> 'GatewayId' like 'igw-%'
            or r ->> 'NatGatewayId' like 'nat-%'
          )
    ), subnet_accessibility as (
      select
        subnet_id,
        vpc_id,
        case
          when s.subnet_id in (select all_sub from subnets_with_explicit_route where all_sub not in (select SubnetId from public_subnets_with_explicit_route )) then 'private'
          when p.SubnetId is not null or s.vpc_id in ( select vpc_id from public_subnets_with_implicit_route) then 'public'
          else 'private'
        end as access
      from
        aws_vpc_subnet as s
        left join public_subnets_with_explicit_route as p on p.SubnetId = s.subnet_id
    ), cluster_public_subnet as (
      select
        distinct arn,
        name as subnet_group_name
      from
        aws_rds_db_subnet_group,
        jsonb_array_elements(subnets) as s
        left join subnet_accessibility as a on a.subnet_id = s ->> 'SubnetIdentifier'
      where
        a.access = 'public'
    )
    select
      c.arn as resource,
      case
        when s.subnet_group_name is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when s.subnet_group_name is not null then c.title || ' has public subnet.'
        else c.title || ' has private subnet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_instance as c
      left join cluster_public_subnet as s on s.subnet_group_name = c.db_subnet_group_name;
  EOQ
}

query "rds_db_instance_postgres_not_exposed_to_local_file_read_vulnerability" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when not engine = 'postgres' then 'skip'
        when engine = 'postgres' and engine_version like any (array ['10.11', '10.12', '10.13', '11.6', '11.7', '11.8']) then 'alarm'
        else 'ok'
      end as status,
      case
        when not engine = 'postgres'  then title || ' not PostgreSQL edition.'
        when engine = 'postgres'  and engine_version like any (array ['13.2','13.1','12.6','12.5','12.4','12.3','12.2','11.11','11.10','11.9','11.8','11.7','11.6','11.5','11.4','11.3','11.2','11.1','10.16','10.15','10.14','10.13','10.12','10.11','10.10','10.9','10.7','10.6','10.5','10.4','10.3','10.1','9.6.21','9.6.20','9.6.19','9.6.18','9.6.17','9.6.16','9.6.15','9.6.14','9.6.12','9.6.11','9.6.10','9.6.9','9.6.8','9.6.6','9.6.5','9.6.3','9.6.2','9.6.1','9.5','9.4','9.3']) then title || ' exposed to local file read vulnerability.'
        else title || ' not exposed to local file read vulnerability.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_instance;
  EOQ
}

query "rds_db_cluster_automatic_minor_version_upgrade_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when auto_minor_version_upgrade then 'ok'
        else 'alarm'
      end as status,
      case
        when auto_minor_version_upgrade then title || ' automatic minor version upgrades enabled.'
        else title || ' automatic minor version upgrades disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_cluster;
  EOQ
}

query "rds_db_cluster_aurora_mysql_audit_logging_enabled" {
  sql = <<-EOQ
    with pg_with_audit_logging_enabled as (
      select
        pg.name,
        pg.account_id,
        pg.region
      from
        aws_rds_db_cluster as c,
        aws_rds_db_cluster_parameter_group as pg,
        jsonb_array_elements(parameters) as p
      where
        pg.name = c.db_cluster_parameter_group
        and pg.account_id = c.account_id
        and pg.region = c.region
        and p ->> 'ParameterName' = 'server_audit_logging'
        and p ->> 'ParameterValue' = '1'
    )
    select
      arn as resource,
      case
        when engine <> 'aurora-mysql' then 'skip'
        when p.name is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when engine <> 'aurora-mysql' then title || ' is not Aurora MySQL-compatible edition.'
        when p.name is not null then title || ' audit logging enabled.'
        else title || ' audit logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
    from
      aws_rds_db_cluster as i
      left join pg_with_audit_logging_enabled as p on p.name = i.db_cluster_parameter_group and p.account_id = i.account_id and p.region = i.region;
  EOQ
}

query "rds_db_instance_postgres_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when engine <> 'postgres' then 'skip'
        when enabled_cloudwatch_logs_exports ?& array ['postgresql','upgrade'] then 'ok'
        else 'alarm'
      end as status,
      case
        when engine <> 'postgres' then title || ' is of ' || engine || ' type.'
        when enabled_cloudwatch_logs_exports ?& array ['postgresql','upgrade'] then title || ' logging enabled.'
        else title || ' logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_instance;
  EOQ
}

query "rds_db_cluster_aurora_postgres_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when engine <> 'aurora-postgresql' then 'skip'
        when enabled_cloudwatch_logs_exports ?& array ['postgresql'] then 'ok'
        else 'alarm'
      end as status,
      case
        when engine <> 'aurora-postgresql' then title || ' is of ' || engine || ' type.'
        when enabled_cloudwatch_logs_exports ?& array ['postgresql'] then title || ' logging enabled.'
        else title || ' logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_cluster;
  EOQ
}

query "rds_db_instance_sql_server_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when not engine like 'sqlserver%' then 'skip'
        when enabled_cloudwatch_logs_exports ?& array ['error'] then 'ok'
        else 'alarm'
      end as status,
      case
        when not engine like 'sqlserver%' then title || ' is of ' || engine || ' type.'
        when enabled_cloudwatch_logs_exports ?& array ['error'] then title || ' logging enabled.'
        else title || ' logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_instance;
  EOQ
}

query "rds_db_instance_sql_server_encryption_in_transit_enabled" {
  sql = <<-EOQ
    with instance_pg as (
      select
        g ->> 'DBParameterGroupName' as pg_name,
        i.engine,
        i.title,
        i.arn,
        i.tags,
        i.region,
        i.account_id,
        i._ctx
      from
        aws_rds_db_instance as i,
        jsonb_array_elements(db_parameter_groups) as g
    ), pg_with_ssl_enabled as (
      select
        g.name
      from
        instance_pg as i,
        aws_rds_db_parameter_group as g,
        jsonb_array_elements(parameters) as p
      where
        i.pg_name = g.name
        and g.account_id = i.account_id
        and g.region = i.region
        and p ->> 'ParameterName' = 'rds.force_ssl'
        and p ->> 'ParameterValue' = '1'
    )
    select
      i.arn as resource,
      case
        when not i.engine like 'sqlserver%' then 'skip'
        when p.name is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when not i.engine like 'sqlserver%'  then title || ' has ' || engine || ' engine type.'
        when p.name is not null then title || ' encryption in transit enabled.'
        else title || ' encryption in transit disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      instance_pg as i
      left join pg_with_ssl_enabled as p on p.name = i.pg_name;
  EOQ
}

query "rds_db_instance_mariadb_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when engine <> 'mariadb' then 'skip'
        when enabled_cloudwatch_logs_exports ?& array ['audit','error','general','slowquery'] then 'ok'
        else 'alarm'
      end as status,
      case
        when engine <> 'mariadb' then title || ' is of ' || engine || ' type.'
        when enabled_cloudwatch_logs_exports ?& array ['audit','error','general','slowquery'] then title || ' logging enabled.'
        else title || ' logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_instance;
  EOQ
}

query "rds_db_instance_mariadb_encryption_in_transit_enabled" {
  sql = <<-EOQ
     with instance_pg as (
      select
        g ->> 'DBParameterGroupName' as pg_name,
        i.engine,
        i.title,
        i.arn,
        i.tags,
        i.region,
        i.account_id,
        i._ctx
      from
        aws_rds_db_instance as i,
        jsonb_array_elements(db_parameter_groups) as g
    ), pg_with_encryption_in_transit_enabled as (
      select
        g.name,
        g.account_id,
        g.region
      from
        instance_pg as i,
        aws_rds_db_parameter_group as g,
        jsonb_array_elements(parameters) as p
      where
        i.pg_name = g.name
        and g.account_id = i.account_id
        and g.region = i.region
        and p ->> 'ParameterName' = 'require_secure_transport'
        and p ->> 'ParameterValue' = '1'
    )
    select
      i.arn as resource,
      engine,
      case
        when engine <> 'mariadb' then 'skip'
        when p.name is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when engine <> 'mariadb' then title || ' is of ' || engine || ' type.'
        when p.name is not null then title || ' encryption in transit enabled.'
        else title || ' encryption in transit disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
    from
      instance_pg as i
      left join pg_with_encryption_in_transit_enabled as p on p.name = i.pg_name and p.account_id = i.account_id and p.region = i.region;
  EOQ
}

query "rds_db_cluster_aurora_mysql_publish_audit_log_to_cloudwatch" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when engine <> 'aurora-mysql' then 'skip'
        when enabled_cloudwatch_logs_exports ?& array ['audit'] then 'ok'
        else 'alarm'
      end as status,
      case
        when engine <> 'aurora-mysql' then title || ' is of ' || engine || ' type.'
        when enabled_cloudwatch_logs_exports ?& array ['audit'] then title || ' publish audit logs to CloudWatch.'
        else title || ' does not publish audit logs to CloudWatch.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_cluster;
  EOQ
}

query "rds_db_cluster_aurora_mysql_copy_tags_to_snapshot_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when engine <> 'aurora-mysql' then 'skip'
        when copy_tags_to_snapshot then 'ok'
        else 'alarm'
      end as status,
      case
        when engine <> 'aurora-mysql' then title || ' is of ' || engine || ' type.'
        when copy_tags_to_snapshot then title || ' copy tags to snapshot enabled.'
        else title || ' copy tags to snapshot disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_cluster;
  EOQ
}

query "rds_db_proxy_tls_encryption_enabled" {
  sql = <<-EOQ
    select
      db_proxy_arn as resource,
      case
        when require_tls then 'ok'
        else 'alarm'
      end as status,
      case
        when require_tls then title || ' requires TLS for all connections.'
        else title || ' does not require TLS for all connections.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_proxy;
  EOQ
}

query "rds_db_cluster_aurora_postgres_copy_tags_to_snapshot_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when engine <> 'aurora-postgresql' then 'skip'
        when copy_tags_to_snapshot then 'ok'
        else 'alarm'
      end as status,
      case
        when engine <> 'aurora-postgresql' then title || ' is of ' || engine || ' type.'
        when copy_tags_to_snapshot then title || ' copy tags to snapshot enabled.'
        else title || ' copy tags to snapshot disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_rds_db_cluster;
  EOQ
}