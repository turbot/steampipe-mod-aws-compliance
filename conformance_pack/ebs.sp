locals {
  conformance_pack_ebs_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/EBS"
  })
}

control "ebs_snapshot_not_publicly_restorable" {
  title       = "EBS snapshots should not be publicly restorable"
  description = "Manage access to the AWS Cloud by ensuring EBS snapshots are not publicly restorable."
  query       = query.ebs_snapshot_not_publicly_restorable

  tags = merge(local.conformance_pack_ebs_common_tags, {
    audit_manager_pci_v321_requirement_1 = "true"
    audit_manager_pci_v321_requirement_2 = "true"
    audit_manager_pci_v321_requirement_7 = "true"
    cisa_cyber_essentials                = "true"
    fedramp_low_rev_4                    = "true"
    fedramp_moderate_rev_4               = "true"
    ffiec                                = "true"
    gxp_21_cfr_part_11                   = "true"
    hipaa                                = "true"
    nist_800_171_rev_2                   = "true"
    nist_800_53_rev_4                    = "true"
    nist_800_53_rev_5                    = "true"
    nist_csf                             = "true"
    rbi_cyber_security                   = "true"
  })
}

control "ebs_volume_encryption_at_rest_enabled" {
  title       = "EBS volume encryption at rest should be enabled"
  description = "Because sensitive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elastic Block Store (Amazon EBS) volumes."
  query       = query.ebs_volume_encryption_at_rest_enabled

  tags = merge(local.conformance_pack_ebs_common_tags, {
    fedramp_moderate_rev_4 = "true"
    gdpr                   = "true"
    gxp_eu_annex_11        = "true"
    hipaa                  = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_5      = "true"
    rbi_cyber_security     = "true"
  })
}

control "ebs_attached_volume_encryption_enabled" {
  title       = "Attached EBS volumes should have encryption enabled"
  description = "Because sensitive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elastic Block Store (Amazon EBS) volumes."
  query       = query.ebs_attached_volume_encryption_enabled

  tags = merge(local.conformance_pack_ebs_common_tags, {
    audit_manager_pci_v321_requirement_3 = "true"
    audit_manager_control_tower          = "true"
    cisa_cyber_essentials                = "true"
    fedramp_moderate_rev_4               = "true"
    ffiec                                = "true"
    gdpr                                 = "true"
    gxp_21_cfr_part_11                   = "true"
    hipaa                                = "true"
    nist_800_171_rev_2                   = "true"
    nist_800_53_rev_4                    = "true"
    nist_800_53_rev_5                    = "true"
    nist_csf                             = "true"
    rbi_cyber_security                   = "true"
  })
}

control "ebs_volume_in_backup_plan" {
  title       = "EBS volumes should be in a backup plan"
  description = "To help with data back-up processes, ensure your Amazon Elastic Block Store (Amazon EBS) volumes are a part of an AWS Backup plan."
  query       = query.ebs_volume_in_backup_plan

  tags = merge(local.conformance_pack_ebs_common_tags, {
    audit_manager_pci_v321_requirement_3 = "true"
    cisa_cyber_essentials                = "true"
    ffiec                                = "true"
    gxp_21_cfr_part_11                   = "true"
    gxp_eu_annex_11                      = "true"
    hipaa                                = "true"
    nist_800_171_rev_2                   = "true"
    nist_800_53_rev_4                    = "true"
    nist_800_53_rev_5                    = "true"
    nist_csf                             = "true"
    rbi_cyber_security                   = "true"
    soc_2                                = "true"
  })
}

control "ebs_attached_volume_delete_on_termination_enabled" {
  title       = "Attached EBS volumes should have delete on termination enabled"
  description = "This rule ensures that Amazon Elastic Block Store volumes that are attached to Amazon Elastic Compute Cloud (Amazon EC2) instances are marked for deletion when an instance is terminated."
  query       = query.ebs_attached_volume_delete_on_termination_enabled

  tags = merge(local.conformance_pack_ebs_common_tags, {
    audit_manager_control_tower = "true"
    fedramp_low_rev_4           = "true"
    fedramp_moderate_rev_4      = "true"
    ffiec                       = "true"
    nist_800_53_rev_4           = "true"
    nist_csf                    = "true"
  })
}

control "ebs_volume_protected_by_backup_plan" {
  title       = "EBS volumes should be protected by a backup plan"
  description = "Ensure if Amazon Elastic Block Store (Amazon EBS) volumes are protected by a backup plan. The rule is non compliant if the Amazon EBS volume is not covered by a backup plan."
  query       = query.ebs_volume_protected_by_backup_plan

  tags = merge(local.conformance_pack_ebs_common_tags, {
    audit_manager_pci_v321_requirement_3 = "true"
    fedramp_low_rev_4                    = "true"
    fedramp_moderate_rev_4               = "true"
    ffiec                                = "true"
    gxp_eu_annex_11                      = "true"
    hipaa                                = "true"
    nist_800_171_rev_2                   = "true"
    nist_csf                             = "true"
    soc_2                                = "true"
  })
}

control "ebs_volume_unused" {
  title       = "EBS volumes should be attached to EC2 instances"
  description = "Checks if EBS volumes are attached to EC2 instances."
  query       = query.ebs_volume_unused

  tags = merge(local.conformance_pack_ebs_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_5      = "true"
  })
}
