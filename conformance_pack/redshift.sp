locals {
  conformance_pack_redshift_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Redshift"
  })
}

control "redshift_cluster_encryption_in_transit_enabled" {
  title       = "Redshift cluster encryption in transit should be enabled"
  description = "Ensure that your Amazon Redshift clusters require TLS/SSL encryption to connect to SQL clients."
  query       = query.redshift_cluster_encryption_in_transit_enabled

  tags = merge(local.conformance_pack_redshift_common_tags, {
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

control "redshift_cluster_encryption_logging_enabled" {
  title       = "Redshift cluster audit logging and encryption should be enabled"
  description = "To protect data at rest, ensure that encryption is enabled for your Amazon Redshift clusters. You must also ensure that required configurations are deployed on Amazon Redshift clusters. The audit logging should be enabled to provide information about connections and user activities in the database."
  query       = query.redshift_cluster_encryption_logging_enabled

  tags = merge(local.conformance_pack_redshift_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
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

control "redshift_cluster_prohibit_public_access" {
  title       = "Redshift clusters should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon Redshift clusters are not public."
  query       = query.redshift_cluster_prohibit_public_access

  tags = merge(local.conformance_pack_redshift_common_tags, {
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

control "redshift_cluster_automatic_snapshots_min_7_days" {
  title       = "Amazon Redshift clusters should have automatic snapshots enabled"
  description = "This control checks whether Amazon Redshift clusters have automated snapshots enabled. It also checks whether the snapshot retention period is greater than or equal to seven."
  query       = query.redshift_cluster_automatic_snapshots_min_7_days

  tags = merge(local.conformance_pack_redshift_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "redshift_cluster_kms_enabled" {
  title       = "Amazon Redshift clusters should be encrypted with KMS"
  description = "Ensure if Amazon Redshift clusters are using a specified AWS Key Management Service (AWS KMS) key for encryption. The rule is compliant if encryption is enabled and the cluster is encrypted with the key provided in the kmsKeyArn parameter. The rule is non compliant if the cluster is not encrypted or encrypted with another key."
  query       = query.redshift_cluster_kms_enabled

  tags = merge(local.conformance_pack_redshift_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    rbi_cyber_security                     = "true"
  })
}

control "redshift_cluster_maintenance_settings_check" {
  title       = "Amazon Redshift should have required maintenance settings"
  description = "Ensure whether Amazon Redshift clusters have the specified maintenance settings. Redshift clusters `allowVersionUpgrade` should be set to `true` and `automatedSnapshotRetentionPeriod` should be greater than 7."
  query       = query.redshift_cluster_maintenance_settings_check

  tags = merge(local.conformance_pack_redshift_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    ffiec                                  = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    rbi_cyber_security                     = "true"
  })
}

control "redshift_cluster_enhanced_vpc_routing_enabled" {
  title       = "Amazon Redshift enhanced VPC routing should be enabled"
  description = "Ensure if Amazon Redshift cluster has 'enhancedVpcRouting' enabled. The rule is non  compliant if 'enhancedVpcRouting' is not enabled or if the configuration.enhancedVpcRouting field is 'false'."
  query       = query.redshift_cluster_enhanced_vpc_routing_enabled

  tags = merge(local.conformance_pack_redshift_common_tags, {
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
  })
}

control "redshift_cluster_no_default_admin_name" {
  title       = "Amazon Redshift clusters should not use the default Admin username"
  description = "This control checks whether a Amazon Redshift cluster has changed the admin username from its default value. This control will fail if the admin username for a Redshift cluster is set to awsuser."
  query       = query.redshift_cluster_no_default_admin_name

  tags = merge(local.conformance_pack_redshift_common_tags, {
    nist_csf     = "true"
    pci_dss_v321 = "true"
  })
}

control "redshift_cluster_audit_logging_enabled" {
  title       = "Amazon Redshift audit logging should be enabled"
  description = "This control ensures if redshift clusters are logging audits to a specific bucket. The rule is no compliant if audit logging is not enabled for a redshift cluster or if the 'bucketNames' parameter is provided but the audit logging destination does not match."
  query       = query.redshift_cluster_audit_logging_enabled

  tags = merge(local.conformance_pack_redshift_common_tags, {
    gxp_21_cfr_part_11 = "true"
    nist_csf           = "true"
    pci_dss_v321       = "true"
    soc_2              = "true"
  })
}

control "redshift_cluster_no_default_database_name" {
  title       = "Redshift clusters should not use the default database name"
  description = "This control checks whether an Amazon Redshift cluster has changed the database name from its default value. The control will fail if the database name for a Redshift cluster is set to dev."
  query       = query.redshift_cluster_no_default_database_name

  tags = merge(local.conformance_pack_redshift_common_tags, {
    nist_csf = "true"
  })
}

query "redshift_cluster_encryption_in_transit_enabled" {
  sql = <<-EOQ
    with pg_with_ssl as (
    select
      name as pg_name,
      p ->> 'ParameterName' as parameter_name,
      p ->> 'ParameterValue' as parameter_value
    from
      aws_redshift_parameter_group,
      jsonb_array_elements(parameters) as p
    where
      p ->> 'ParameterName' = 'require_ssl'
      and p ->> 'ParameterValue' = 'true'
    )
    select
      arn as resource,
      case
        when cpg ->> 'ParameterGroupName' in (select pg_name from pg_with_ssl ) then 'ok'
        else 'alarm'
      end as status,
      case
        when cpg ->> 'ParameterGroupName' in (select pg_name from pg_with_ssl ) then title || ' encryption in transit enabled.'
        else title || ' encryption in transit disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_redshift_cluster,
      jsonb_array_elements(cluster_parameter_groups) as cpg;
  EOQ
}

query "redshift_cluster_encryption_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when not encrypted then 'alarm'
        when not (logging_status ->> 'LoggingEnabled') :: boolean then 'alarm'
        else 'ok'
      end as status,
      case
        when not encrypted then title || ' not encrypted.'
        when not (logging_status ->> 'LoggingEnabled')::boolean then title || ' audit logging not enabled.'
        else title || ' audit logging and encryption enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_redshift_cluster;
  EOQ
}

query "redshift_cluster_prohibit_public_access" {
  sql = <<-EOQ
    select
      cluster_namespace_arn as resource,
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
      aws_redshift_cluster;
  EOQ
}

query "redshift_cluster_automatic_snapshots_min_7_days" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when automated_snapshot_retention_period >= 7 then 'ok'
        else 'alarm'
      end as status,
      case
        when automated_snapshot_retention_period >= 7 then title || ' automatic snapshots enabled with retention period greater than equals 7 days.'
        else title || ' automatic snapshots enabled with retention period less than 7 days.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_redshift_cluster;
  EOQ
}

query "redshift_cluster_kms_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when encrypted and kms_key_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when encrypted and kms_key_id is not null then title || ' encrypted with KMS.'
        else title || ' not encrypted with KMS'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_redshift_cluster;
  EOQ
}

query "redshift_cluster_maintenance_settings_check" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when allow_version_upgrade and automated_snapshot_retention_period >= 7 then 'ok'
        else 'alarm'
      end as status,
      case
        when allow_version_upgrade and automated_snapshot_retention_period >= 7 then title || ' has the required maintenance settings.'
        else title || ' does not have required maintenance settings.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_redshift_cluster;
  EOQ
}

query "redshift_cluster_enhanced_vpc_routing_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when enhanced_vpc_routing then 'ok'
        else 'alarm'
      end as status,
      case
        when enhanced_vpc_routing then title || ' enhanced VPC routing enabled.'
        else title || ' enhanced VPC routing disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_redshift_cluster;
  EOQ
}

query "redshift_cluster_no_default_admin_name" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when master_username = 'awsuser' then 'alarm'
        else 'ok'
      end as status,
      case
        when master_username = 'awsuser' then title || ' using default master user name.'
        else title || ' not using default master user name.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_redshift_cluster;
  EOQ
}

query "redshift_cluster_audit_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when logging_status ->> 'LoggingEnabled' = 'true' then 'ok'
        else 'alarm'
      end as status,
      case
        when logging_status ->> 'LoggingEnabled' = 'true' then title || ' logging enabled.'
        else title || ' logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_redshift_cluster;
  EOQ
}

query "redshift_cluster_no_default_database_name" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when db_name = 'dev' then 'alarm'
        else 'ok'
      end as status,
      case
        when db_name = 'dev' then title || ' using default database name.'
        else title || ' not using default database name.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_redshift_cluster;
  EOQ
}

# Non-Config rule query

query "redshift_cluster_automatic_upgrade_major_versions_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when allow_version_upgrade then 'ok'
        else 'alarm'
      end as status,
      case
        when allow_version_upgrade then title || ' automatic upgrades to major versions enabled.'
        else title || ' automatic upgrades to major versions disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_redshift_cluster;
  EOQ
}
