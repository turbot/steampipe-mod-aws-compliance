locals {
  conformance_pack_rds_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/RDS"
  })
}

control "rds_db_instance_backup_enabled" {
  title       = "RDS DB instance backup should be enabled"
  description = "The backup feature of Amazon RDS creates backups of your databases and transaction logs."
  query       = query.rds_db_instance_backup_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
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
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "rds_db_instance_encryption_at_rest_enabled" {
  title       = "RDS DB instance encryption at rest should be enabled"
  description = "To help protect data at rest, ensure that encryption is enabled for your Amazon Relational Database Service (Amazon RDS) instances."
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
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "rds_db_instance_multiple_az_enabled" {
  title       = "RDS DB instance multiple az should be enabled"
  description = "Multi-AZ support in Amazon Relational Database Service (Amazon RDS) provides enhanced availability and durability for database instances."
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
  })
}

control "rds_db_instance_prohibit_public_access" {
  title       = "RDS DB instances should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon Relational Database Service (Amazon RDS) instances are not public."
  query       = query.rds_db_instance_prohibit_public_access

  tags = merge(local.conformance_pack_rds_common_tags, {
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
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "rds_db_snapshot_encrypted_at_rest" {
  title       = "RDS DB snapshots should be encrypted at rest"
  description = "Ensure that encryption is enabled for your Amazon Relational Database Service (Amazon RDS) snapshots."
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
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "rds_db_snapshot_prohibit_public_access" {
  title       = "RDS snapshots should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon Relational Database Service (Amazon RDS) instances are not public."
  query       = query.rds_db_snapshot_prohibit_public_access

  tags = merge(local.conformance_pack_rds_common_tags, {
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
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "rds_db_instance_logging_enabled" {
  title       = "Database logging should be enabled"
  description = "To help with logging and monitoring within your environment, ensure Amazon Relational Database Service (Amazon RDS) logging is enabled."
  query       = query.rds_db_instance_logging_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
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
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "rds_db_instance_in_backup_plan" {
  title       = "RDS DB instances should be in a backup plan"
  description = "To help with data back-up processes, ensure your Amazon Relational Database Service (Amazon RDS) instances are a part of an AWS Backup plan."
  query       = query.rds_db_instance_in_backup_plan

  tags = merge(local.conformance_pack_rds_common_tags, {
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
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "rds_db_instance_and_cluster_enhanced_monitoring_enabled" {
  title       = "RDS DB instance and cluster enhanced monitoring should be enabled"
  description = "Enable Amazon Relational Database Service (Amazon RDS) to help monitor Amazon RDS availability. This provides detailed visibility into the health of your Amazon RDS database instances."
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
  })
}

control "rds_db_instance_deletion_protection_enabled" {
  title       = "RDS DB instances should have deletion protection enabled"
  description = "Ensure Amazon Relational Database Service (Amazon RDS) instances have deletion protection enabled."
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
    soc_2                                  = "true"
  })
}

control "rds_db_instance_iam_authentication_enabled" {
  title       = "RDS DB instances should have iam authentication enabled"
  description = "Checks if an Amazon Relational Database Service (Amazon RDS) instance has AWS Identity and Access Management (IAM) authentication enabled."
  query       = query.rds_db_instance_iam_authentication_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    soc_2                                  = "true"
  })
}

control "rds_db_cluster_iam_authentication_enabled" {
  title       = "IAM authentication should be configured for RDS clusters"
  description = "Checks if an Amazon RDS Cluster has AWS Identity and Access Management (IAM) authentication enabled. The rule is non compliant if an RDS Cluster does not have IAM authentication enabled."
  query       = query.rds_db_cluster_iam_authentication_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
    nist_800_171_rev_2 = "true"
    nist_csf           = "true"
  })
}

control "rds_db_cluster_aurora_protected_by_backup_plan" {
  title       = "RDS Aurora clusters should be protected by backup plan"
  description = "Checks if Amazon Aurora DB clusters are protected by a backup plan. The rule is non compliant if the Amazon Relational Database Service (Amazon RDS) Database Cluster is not protected by a backup plan."
  query       = query.rds_db_cluster_aurora_protected_by_backup_plan

  tags = merge(local.conformance_pack_rds_common_tags, {
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
    pci_dss_v321                           = "true"
    soc_2                                  = "true"
  })
}

control "rds_db_instance_protected_by_backup_plan" {
  title       = "RDS DB instance should be protected by backup plan"
  description = "Ensure if Amazon Relational Database Service (Amazon RDS) instances are protected by a backup plan. The rule is non compliant if the Amazon RDS Database instance is not covered by a backup plan."
  query       = query.rds_db_instance_protected_by_backup_plan

  tags = merge(local.conformance_pack_rds_common_tags, {
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
    pci_dss_v321                           = "true"
    soc_2                                  = "true"
  })
}

control "rds_db_instance_automatic_minor_version_upgrade_enabled" {
  title       = "RDS DB instance automatic minor version upgrade should be enabled"
  description = "Ensure if Amazon Relational Database Service (RDS) database instances are configured for automatic minor version upgrades. The rule is non compliant if the value of 'autoMinorVersionUpgrade' is false."
  query       = query.rds_db_instance_automatic_minor_version_upgrade_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
    cisa_cyber_essentials = "true"
    ffiec                 = "true"
    nist_csf              = "true"
    pci_dss_v321          = "true"
    rbi_cyber_security    = "true"
  })
}

control "rds_db_cluster_deletion_protection_enabled" {
  title       = "RDS clusters should have deletion protection enabled"
  description = "This control checks whether RDS clusters have deletion protection enabled. This control is intended for RDS DB instances. However, it can also generate findings for Aurora DB instances, Neptune DB instances, and Amazon DocumentDB clusters. If these findings are not useful,then you can suppress them."
  severity    = "low"
  query       = query.rds_db_cluster_deletion_protection_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
    nist_csf = "true"
  })
}

control "rds_db_instance_cloudwatch_logs_enabled" {
  title       = "RDS DB instances should be integrated with CloudWatch logs"
  description = "Use Amazon CloudWatch to centrally collect and manage RDS DB instance activity."
  query       = query.rds_db_instance_cloudwatch_logs_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
    other_checks = "true"
  })
}

control "rds_db_instance_ca_certificate_expires_7_days" {
  title       = "RDS DB instances CA certificates should not expire within next 7 days"
  description = "Ensure RDS DB instances CA certificates are not getting expired within the next 7 days."
  query       = query.rds_db_instance_ca_certificate_expires_7_days

  tags = merge(local.conformance_pack_rds_common_tags, {
    other_checks = "true"
  })
}

control "rds_db_instance_no_default_admin_name" {
  title       = "RDS database instances should use a custom administrator username"
  description = "This control checks whether you've changed the administrative username for Amazon Relational Database Service (Amazon RDS) database instances from the default value. The control fails if the administrative username is set to the default value."
  query       = query.rds_db_instance_no_default_admin_name

  tags = merge(local.conformance_pack_rds_common_tags, {
    nist_csf     = "true"
    pci_dss_v321 = "true"
  })
}

control "rds_db_cluster_no_default_admin_name" {
  title       = "RDS database clusters should use a custom administrator username"
  description = "This control checks whether an Amazon RDS database cluster has changed the admin username from its default value. This rule will fail if the admin username is set to the default value."
  query       = query.rds_db_cluster_no_default_admin_name

  tags = merge(local.conformance_pack_rds_common_tags, {
    nist_csf     = "true"
    pci_dss_v321 = "true"
  })
}

control "rds_db_cluster_aurora_backtracking_enabled" {
  title       = "RDS Aurora clusters should have backtracking enabled"
  description = "This control checks whether Amazon Aurora clusters have backtracking enabled. Backups help you to recover more quickly from a security incident. They also strengthen the resilience of your systems. Aurora backtracking reduces the time to recover a database to a point in time. It does not require a database restore to so."
  query       = query.rds_db_cluster_aurora_backtracking_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
    nist_csf = "true"
  })
}

control "rds_db_cluster_multiple_az_enabled" {
  title       = "RDS DB clusters should be configured for multiple Availability Zones"
  description = "This control checks whether high availability is enabled for your RDS DB clusters. RDS DB clusters should be configured for multiple Availability Zones to ensure availability of the data that is stored."
  query       = query.rds_db_cluster_multiple_az_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
    nist_csf = "true"
  })
}

control "rds_db_instance_connections_encryption_enabled" {
  title       = "RDS DB instances connections should be encrypted"
  description = "This control checks if RDS DB instance connections are encrypted. Secure Sockets Layer (SSL) is used to encrypt between client applications and Amazon RDS DB instances running Microsoft SQL Server or PostgreSQL."
  query       = query.rds_db_instance_connections_encryption_enabled

  tags = merge(local.conformance_pack_rds_common_tags, {
    other_checks = "true"
  })
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

# Non-Config rule query

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