locals {
  conformance_pack_ssm_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/SSM"
  })
}

control "ec2_instance_ssm_managed" {
  title       = "EC2 instances should be managed by AWS Systems Manager"
  description = "An inventory of the software platforms and applications within the organization is possible by managing Amazon Elastic Compute Cloud (Amazon EC2) instances with AWS Systems Manager."
  query       = query.ec2_instance_ssm_managed

  tags = merge(local.conformance_pack_ssm_common_tags, {
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

control "ssm_managed_instance_compliance_association_compliant" {
  title       = "SSM managed instance associations should be compliant"
  description = "Use AWS Systems Manager Associations to help with inventory of software platforms and applications within an organization."
  query       = query.ssm_managed_instance_compliance_association_compliant

  tags = merge(local.conformance_pack_ssm_common_tags, {
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

control "ssm_managed_instance_compliance_patch_compliant" {
  title       = "SSM managed instance patching should be compliant"
  description = "Enable this rule to help with identification and documentation of Amazon Elastic Compute Cloud (Amazon EC2) vulnerabilities."
  query       = query.ssm_managed_instance_compliance_patch_compliant

  tags = merge(local.conformance_pack_ssm_common_tags, {
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

control "ssm_document_prohibit_public_access" {
  title       = "SSM documents should not be public"
  description = "This control checks whether AWS Systems Manager documents that are owned by the account are public. This control fails if SSM documents with the owner Self are public."
  query       = query.ssm_document_prohibit_public_access

  tags = merge(local.conformance_pack_ssm_common_tags, {
    cis_controls_v8_ig1                    = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_171_rev_2                     = "true"
    nist_csf                               = "true"
  })
}

query "ec2_instance_ssm_managed" {
  sql = <<-EOQ
    select
      i.arn as resource,
      case
        when i.instance_state = 'stopped' then 'info'
        when m.instance_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when i.instance_state = 'stopped' then i.title || ' is in stopped state.'
        when m.instance_id is null then i.title || ' not managed by AWS SSM.'
        else i.title || ' managed by AWS SSM.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance i
      left join aws_ssm_managed_instance m on m.instance_id = i.instance_id;
  EOQ
}

query "ssm_managed_instance_compliance_association_compliant" {
  sql = <<-EOQ
    select
      id as resource,
      case
        when c.status = 'COMPLIANT' then 'ok'
        else 'alarm'
      end as status,
      case
        when c.status = 'COMPLIANT' then c.resource_id || ' association ' || c.title || ' is compliant.'
        else c.resource_id || ' association ' || c.title || ' is non-compliant.'
      end as reason

      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
    from
      aws_ssm_managed_instance as i,
      aws_ssm_managed_instance_compliance as c
    where
      c.resource_id = i.instance_id
      and c.compliance_type = 'Association';
  EOQ
}

query "ssm_managed_instance_compliance_patch_compliant" {
  sql = <<-EOQ
    select
      id as resource,
      case
        when c.status = 'COMPLIANT' then 'ok'
        else 'alarm'
      end as status,
      case
        when c.status = 'COMPLIANT' then c.resource_id || ' patch ' || c.title || ' is compliant.'
        else c.resource_id || ' patch ' || c.title || ' is non-compliant.'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
    from
      aws_ssm_managed_instance as i,
      aws_ssm_managed_instance_compliance as c
    where
      c.resource_id = i.instance_id
      and c.compliance_type = 'Patch';
  EOQ
}

query "ssm_document_prohibit_public_access" {
  sql = <<-EOQ
    select
      'arn:' || partition || ':ssm:' || region || ':' || account_id || ':document/' || name as resource,
      case
        when account_ids :: jsonb ? 'all' then 'alarm'
        else 'ok'
      end as status,
      case
        when account_ids :: jsonb ? 'all' then title || ' publicly accesible.'
        else title || ' not publicly accesible.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ssm_document
    where
      owner_type = 'Self';
  EOQ
}