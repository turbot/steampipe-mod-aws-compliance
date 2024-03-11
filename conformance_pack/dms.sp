locals {
  conformance_pack_dms_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/DMS"
  })
}

control "dms_replication_instance_not_publicly_accessible" {
  title       = "DMS replication instances should not be publicly accessible"
  description = "Manage access to the AWS Cloud by ensuring DMS replication instances cannot be publicly accessed."
  query       = query.dms_replication_instance_not_publicly_accessible

  tags = merge(local.conformance_pack_dms_common_tags, {
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

control "dms_certificate_not_expired" {
  title       = "Ensure that all the expired DMS certificates are removed"
  description = "This control ensures that all expired DMS certificates are removed from AWS account."
  query       = query.dms_certificate_not_expired

  tags = local.conformance_pack_dms_common_tags
}

query "dms_replication_instance_not_publicly_accessible" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when publicly_accessible then 'alarm'
        else 'ok'
      end as status,
      case
        when publicly_accessible then title || ' publicly accessible.'
        else title || ' not publicly accessible.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_dms_replication_instance;
  EOQ
}

query "dms_certificate_not_expired" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when valid_to_date < (current_date - interval '1' second) then 'alarm'
        else 'ok'
      end as status,
      case
        when valid_to_date < (current_date - interval '1' second) then
        title || ' expired ' || to_char(valid_to_date, 'DD-Mon-YYYY') || '.'
        else
        title || ' valid until ' || to_char(valid_to_date, 'DD-Mon-YYYY')  || '.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_global_sql}
    from
      aws_dms_certificate;
  EOQ
}

query "dms_replication_instance_automatic_minor_version_upgrade_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when auto_minor_version_upgrade then 'ok'
        else 'alarm'
      end as status,
      case
        when auto_minor_version_upgrade then title || ' automatic minor version upgrade enabled.'
        else title || ' automatic minor version upgrade disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_dms_replication_instance;
  EOQ
}