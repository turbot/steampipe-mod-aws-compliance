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
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gdpr                   = "true"
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

control "redshift_cluster_encryption_logging_enabled" {
  title       = "Redshift cluster audit logging and encryption should be enabled"
  description = "To protect data at rest, ensure that encryption is enabled for your Amazon Redshift clusters. You must also ensure that required configurations are deployed on Amazon Redshift clusters. The audit logging should be enabled to provide information about connections and user activities in the database."
  query       = query.redshift_cluster_encryption_logging_enabled

  tags = merge(local.conformance_pack_redshift_common_tags, {
    cis_controls_v8_ig1    = "true"
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gdpr                   = "true"
    gxp_21_cfr_part_11     = "true"
    gxp_eu_annex_11        = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
    soc_2                  = "true"
  })
}

control "redshift_cluster_prohibit_public_access" {
  title       = "Redshift clusters should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon Redshift clusters are not public."
  query       = query.redshift_cluster_prohibit_public_access

  tags = merge(local.conformance_pack_redshift_common_tags, {
    cis_controls_v8_ig1    = "true"
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

control "redshift_cluster_automatic_snapshots_min_7_days" {
  title       = "Amazon Redshift clusters should have automatic snapshots enabled"
  description = "This control checks whether Amazon Redshift clusters have automated snapshots enabled. It also checks whether the snapshot retention period is greater than or equal to seven."
  query       = query.redshift_cluster_automatic_snapshots_min_7_days

  tags = merge(local.conformance_pack_redshift_common_tags, {
    cis_controls_v8_ig1    = "true"
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gdpr                   = "true"
    gxp_21_cfr_part_11     = "true"
    gxp_eu_annex_11        = "true"
    hipaa                  = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
    soc_2                  = "true"
  })
}

control "redshift_cluster_kms_enabled" {
  title       = "Amazon Redshift clusters should be encrypted with KMS"
  description = "Ensure if Amazon Redshift clusters are using a specified AWS Key Management Service (AWS KMS) key for encryption. The rule is compliant if encryption is enabled and the cluster is encrypted with the key provided in the kmsKeyArn parameter. The rule is non compliant if the cluster is not encrypted or encrypted with another key."
  query       = query.redshift_cluster_kms_enabled

  tags = merge(local.conformance_pack_redshift_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    gxp_21_cfr_part_11     = "true"
    nist_800_53_rev_5      = "true"
    rbi_cyber_security     = "true"
  })
}

control "redshift_cluster_maintenance_settings_check" {
  title       = "Amazon Redshift should have required maintenance settings"
  description = "Ensure whether Amazon Redshift clusters have the specified maintenance settings. Redshift clusters `allowVersionUpgrade` should be set to `true` and `automatedSnapshotRetentionPeriod` should be greater than 7."
  query       = query.redshift_cluster_maintenance_settings_check

  tags = merge(local.conformance_pack_redshift_common_tags, {
    cis_controls_v8_ig1   = "true"
    cisa_cyber_essentials = "true"
    ffiec                 = "true"
    nist_800_53_rev_5     = "true"
    rbi_cyber_security    = "true"
  })
}

control "redshift_cluster_enhanced_vpc_routing_enabled" {
  title       = "Amazon Redshift enhanced VPC routing should be enabled"
  description = "Ensure if Amazon Redshift cluster has 'enhancedVpcRouting' enabled. The rule is non  compliant if 'enhancedVpcRouting' is not enabled or if the configuration.enhancedVpcRouting field is 'false'."
  query       = query.redshift_cluster_enhanced_vpc_routing_enabled

  tags = merge(local.conformance_pack_redshift_common_tags, {
    ffiec              = "true"
    gxp_21_cfr_part_11 = "true"
    nist_800_171_rev_2 = "true"
    nist_800_53_rev_5  = "true"
  })
}

control "redshift_cluster_audit_logging_enabled" {
  title       = "Amazon Redshift audit logging should be enabled"
  description = "This control ensures if redshift clusters are logging audits to a specific bucket. The rule is no compliant if audit logging is not enabled for a redshift cluster or if the 'bucketNames' parameter is provided but the audit logging destination does not match."
  query       = query.redshift_cluster_audit_logging_enabled

  tags = merge(local.conformance_pack_redshift_common_tags, {
    soc_2 = "true"

  })
}