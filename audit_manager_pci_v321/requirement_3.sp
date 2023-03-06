locals {
  audit_manager_pci_v321_requirement_3_common_tags = merge(local.audit_manager_pci_v321_common_tags, {
    control_set = "pci_v321_requirement_3"
  })
}

benchmark "audit_manager_pci_v321_requirement_3" {
  title       = "Requirement 3: Protect stored cardholder data"
  description = ""

  children = [
    benchmark.audit_manager_pci_v321_requirement_3_1,
    benchmark.audit_manager_pci_v321_requirement_3_2,
    benchmark.audit_manager_pci_v321_requirement_3_4,
  ]

  tags = local.audit_manager_pci_v321_requirement_3_common_tags
}

benchmark "audit_manager_pci_v321_requirement_3_1" {
  title       = "3.1 Keep cardholder data storage to a minimum by implementing data retention and disposal policies, procedures and processes that include at least the following for all cardholder data (CHD) storage: • Limiting data storage amount and retention time to that which is required for legal, regulatory, and/or business requirements • Specific retention requirements for cardholder data • Processes for secure deletion of data when no longer needed • A quarterly process for identifying and securely deleting stored cardholder data that exceeds defined retention"
  description = "Identifying and deleting stored data that has exceeded its specified retention period prevents unnecessary retention of data that is no longer needed. This process may be automated or manual or a combination of both. For example, a programmatic procedure (automatic or manual) to locate and remove data and/or a manual review of data storage areas could be performed. Implementing secure deletion methods ensure that the data cannot be retrieved when it is no longer needed. Remember, if you don't need it, don't store it!"

  children = [
    benchmark.audit_manager_pci_v321_requirement_3_1_a,
    benchmark.audit_manager_pci_v321_requirement_3_1_c,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_3_common_tags, {
    audit_manager_pci_v321_item_id = "3.1"
  })
}

benchmark "audit_manager_pci_v321_requirement_3_1_a" {
  title       = "3.1.a Examine the data retention and disposal policies, procedures and processes to verify they include the following for all cardholder data (CHD) storage: • Limiting data storage amount and retention time to that which is required for legal, regulatory, and/or business requirements. • Specific requirements for retention of cardholder data (for example, cardholder data needs to be held for X period for Y business reasons). • Processes for secure deletion of cardholder data when no longer needed for legal, regulatory, or business reasons. • A quarterly process for identifying and securely deleting stored cardholder data that exceeds defined retention requirements"
  description = "Identifying and deleting stored data that has exceeded its specified retention period prevents unnecessary retention of data that is no longer needed. This process may be automated or manual or a combination of both. For example, a programmatic procedure (automatic or manual) to locate and remove data and/or a manual review of data storage areas could be performed. Implementing secure deletion methods ensure that the data cannot be retrieved when it is no longer needed. Remember, if you don't need it, don't store it!"

  children = [
    control.s3_lifecycle_policy_enabled
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_3_common_tags, {
    audit_manager_pci_v321_item_id = "3.1.a"
  })
}

benchmark "audit_manager_pci_v321_requirement_3_1_c" {
  title       = "3.1.c For a sample of system components that store cardholder data: • Examine files and system records to verify that the data stored does not exceed the requirements defined in the data retention policy • Observe the deletion mechanism to verify data is deleted securely"
  description = "Identifying and deleting stored data that has exceeded its specified retention period prevents unnecessary retention of data that is no longer needed. This process may be automated or manual or a combination of both. For example, a programmatic procedure (automatic or manual) to locate and remove data and/or a manual review of data storage areas could be performed. Implementing secure deletion methods ensure that the data cannot be retrieved when it is no longer needed. Remember, if you don't need it, don't store it!"

  children = [
    control.rds_db_instance_backup_enabled,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ec2_instance_ebs_optimized,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled,
    control.dynamodb_table_in_backup_plan,
    control.ebs_volume_in_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_protected_by_backup_plan,
    control.dynamodb_table_protected_by_backup_plan,
    control.ec2_instance_protected_by_backup_plan,
    control.ebs_volume_protected_by_backup_plan,
    control.efs_file_system_protected_by_backup_plan,
    control.fsx_file_system_protected_by_backup_plan,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_manual_deletion_disabled,
    control.backup_recovery_point_min_retention_35_days,
    control.backup_recovery_point_encryption_enabled,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_3_common_tags, {
    audit_manager_pci_v321_item_id = "3.1.a"
  })
}

benchmark "audit_manager_pci_v321_requirement_3_2" {
  title       = "3.2 Do not store sensitive authentication data after authorization (even if encrypted). If sensitive authentication data is received, render all data unrecoverable upon completion of the authorization process. It is permissible for issuers and companies that support issuing services to store sensitive authentication data if: • There is a business justification and • The data is stored securely. Sensitive authentication data includes the data as cited in the following Requirements 3.2.1 through 3.2.3"
  description = "Sensitive authentication data consists of full track data, card validation code or value, and PIN data. Storage of sensitive authentication data after authorization is prohibited! This data is very valuable to malicious individuals as it allows them to generate counterfeit payment cards and create fraudulent transactions. Entities that issue payment cards or that perform or support issuing services will often create and control sensitive authentication data as part of the issuing function. It is allowable for companies that perform, facilitate, or support issuing services to store sensitive authentication data ONLY IF they have a legitimate business need to store such data. It should be noted that all PCI DSS requirements apply to issuers, and the only exception for issuers and issuer processors is that sensitive authentication data may be retained if there is a legitimate reason to do so. A legitimate reason is one that is necessary for the performance of the function being provided for the issuer and not one of convenience. Any such data must be stored securely and in accordance with all PCI DSS and specific payment brand requirements."

  children = [
    benchmark.audit_manager_pci_v321_requirement_3_2_3,
    benchmark.audit_manager_pci_v321_requirement_3_2_c,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_3_common_tags, {
    audit_manager_pci_v321_item_id = "3.2"
  })
}

benchmark "audit_manager_pci_v321_requirement_3_2_3" {
  title       = "3.2.3 For a sample of system components, examine data sources, including but not limited to the following and verify that PINs and encrypted PIN blocks are not stored after authorization: • Incoming transaction data • All logs (for example, transaction, history, debugging, error) • History files • Trace files • Several database schemas • Database contents"
  description = "These values should be known only to the card owner or bank that issued the card. If this data is stolen, malicious individuals can execute fraudulent PIN-based debit transactions (for example, ATM withdrawals)."

  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.elb_application_classic_lb_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.rds_db_instance_logging_enabled,
    control.waf_web_acl_logging_enabled,
    control.wafv2_web_acl_logging_enabled,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_3_common_tags, {
    audit_manager_pci_v321_item_id = "3.2.3"
  })
}

benchmark "audit_manager_pci_v321_requirement_3_2_c" {
  title       = "3.2.c For all other entities, if sensitive authentication data is received, review policies and procedures, and examine system configurations to verify the data is not retained after authorization"
  description = "Sensitive authentication data consists of full track data, card validation code or value, and PIN data. Storage of sensitive authentication data after authorization is prohibited! This data is very valuable to malicious individuals as it allows them to generate counterfeit payment cards and create fraudulent transactions. Entities that issue payment cards or that perform or support issuing services will often create and control sensitive authentication data as part of the issuing function. It is allowable for companies that perform, facilitate, or support issuing services to store sensitive authentication data ONLY IF they have a legitimate business need to store such data. It should be noted that all PCI DSS requirements apply to issuers, and the only exception for issuers and issuer processors is that sensitive authentication data may be retained if there is a legitimate reason to do so. A legitimate reason is one that is necessary for the performance of the function being provided for the issuer and not one of convenience. Any such data must be stored securely and in accordance with all PCI DSS and specific payment brand requirements."

  children = [
    control.s3_lifecycle_policy_enabled
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_3_common_tags, {
    audit_manager_pci_v321_item_id = "3.2.c"
  })
}

benchmark "audit_manager_pci_v321_requirement_3_4" {
  title       = "3.4 Render PAN unreadable anywhere it is stored (including on portable digital media, backup media, and in logs) by using any of the following approaches: • One-way hashes based on strong cryptography, (hash must be of the entire PAN) • Truncation (hashing cannot be used to replace the truncated segment of PAN) • Index tokens and pads (pads must be securely stored) • Strong cryptography with associated key-management processes and procedures. Note: It is a relatively trivial effort for a malicious individual to reconstruct original PAN data if they have access to both the truncated and hashed version of a PAN. Where hashed and truncated versions of the same PAN are present in an entity's environment, additional controls must be in place to ensure that the hashed and truncated versions cannot be correlated to reconstruct the original PAN"
  description = "PANs stored in primary storage (databases, or flat files such as text files spreadsheets) as well as non-primary storage (backup, audit logs, exception or troubleshooting logs) must all be protected. One-way hash functions based on strong cryptography can be used to render cardholder data unreadable. Hash functions are appropriate when there is no need to retrieve the original number (one-way hashes are irreversible). It is recommended, but not currently a requirement, that an additional, random input value be added to the cardholder data prior to hashing to reduce the feasibility of an attacker comparing the data against (and deriving the PAN from) tables of pre- computed hash values. The intent of truncation is to permanently remove a segment of PAN data so that only a portion (generally not to exceed the first six and last four digits) of the PAN is stored. An index token is a cryptographic token that replaces the PAN based on a given index for an unpredictable value. A one-time pad is a system in which a randomly generated private key is used only once to encrypt a message that is then decrypted using a matching one-time pad and key. The intent of strong cryptography (as defined in the PCI DSS and PA-DSS Glossary of Terms, Abbreviations, and Acronyms) is that the encryption be based on an industry-tested and accepted algorithm (not a proprietary or "home- grown" algorithm) with strong cryptographic keys. By correlating hashed and truncated versions of a given PAN, a malicious individual may easily derive the original PAN value. Controls that prevent the correlation of this data will help ensure that the original PAN remains unreadable."

  children = [
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.log_group_encryption_at_rest_enabled,
    control.efs_file_system_encrypted_with_cmk,
    control.es_domain_encryption_at_rest_enabled,
    control.ebs_attached_volume_encryption_enabled,
    control.ebs_volume_protected_by_backup_plan,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_default_encryption_enabled,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.sns_topic_encrypted_at_rest,
    control.ec2_ebs_default_encryption_enabled,
    control.dynamodb_table_encrypted_with_kms,
    control.dynamodb_table_encryption_enabled,
    control.rds_db_snapshot_encrypted_at_rest,
    control.s3_bucket_default_encryption_enabled_kms,
    control.dax_cluster_encryption_at_rest_enabled,
    control.eks_cluster_secrets_encrypted
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_3_common_tags, {
    audit_manager_pci_v321_item_id = "3.4"
  })
}
