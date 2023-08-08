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

control "ebs_volume_encryption_at_rest_enabled" {
  title       = "EBS volume encryption at rest should be enabled"
  description = "Because sensitive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elastic Block Store (Amazon EBS) volumes."
  query       = query.ebs_volume_encryption_at_rest_enabled

  tags = merge(local.conformance_pack_ebs_common_tags, {
    fedramp_moderate_rev_4 = "true"
    gdpr                   = "true"
    nist_800_53_rev_5      = "true"
    rbi_cyber_security     = "true"
  })
}

control "ebs_attached_volume_encryption_enabled" {
  title       = "Attached EBS volumes should have encryption enabled"
  description = "Because sensitive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elastic Block Store (Amazon EBS) volumes."
  query       = query.ebs_attached_volume_encryption_enabled

  tags = merge(local.conformance_pack_ebs_common_tags, {
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

control "ebs_volume_in_backup_plan" {
  title       = "EBS volumes should be in a backup plan"
  description = "To help with data back-up processes, ensure your Amazon Elastic Block Store (Amazon EBS) volumes are a part of an AWS Backup plan."
  query       = query.ebs_volume_in_backup_plan

  tags = merge(local.conformance_pack_ebs_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
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

control "ebs_attached_volume_delete_on_termination_enabled" {
  title       = "Attached EBS volumes should have delete on termination enabled"
  description = "This rule ensures that Amazon Elastic Block Store volumes that are attached to Amazon Elastic Compute Cloud (Amazon EC2) instances are marked for deletion when an instance is terminated."
  query       = query.ebs_attached_volume_delete_on_termination_enabled

  tags = merge(local.conformance_pack_ebs_common_tags, {
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    nist_800_53_rev_4      = "true"
  })
}

control "ebs_volume_protected_by_backup_plan" {
  title       = "EBS volumes should be protected by a backup plan"
  description = "Ensure if Amazon Elastic Block Store (Amazon EBS) volumes are protected by a backup plan. The rule is non compliant if the Amazon EBS volume is not covered by a backup plan."
  query       = query.ebs_volume_protected_by_backup_plan

  tags = merge(local.conformance_pack_ebs_common_tags, {
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

control "ebs_volume_unused" {
  title       = "EBS volumes should be attached to EC2 instances"
  description = "Checks if EBS volumes are attached to EC2 instances."
  query       = query.ebs_volume_unused

  tags = merge(local.conformance_pack_ebs_common_tags, {
    audit_manager_control_tower = "true"
    cis_controls_v8_ig1         = "true"
    cisa_cyber_essentials       = "true"
    fedramp_low_rev_4           = "true"
    fedramp_moderate_rev_4      = "true"
    ffiec                       = "true"
    gxp_21_cfr_part_11          = "true"
    nist_800_171_rev_2          = "true"
    nist_800_53_rev_5           = "true"
    nist_csf                    = "true"
  })
}

control "ebs_snapshot_encryption_enabled" {
  title       = "EBS snapshots should be encrypted"
  description = "Ensure that EBS snapshots are encrypted. This rule is non-compliant if the EBS snapshot is not encrypted."
  query       = query.ebs_snapshot_encryption_enabled

  tags = merge(local.conformance_pack_ebs_common_tags, {
    other_checks = "true"
  })
}

query "ebs_snapshot_not_publicly_restorable" {
  sql = <<-EOQ
    select
      'arn:' || partition || ':ec2:' || region || ':' || account_id || ':snapshot/' || snapshot_id as resource,
      case
        when create_volume_permissions @> '[{"Group": "all", "UserId": null}]' then 'alarm'
        else 'ok'
      end as status,
      case
        when create_volume_permissions @> '[{"Group": "all", "UserId": null}]' then title || ' is publicly restorable.'
        else title || ' is not publicly restorable.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ebs_snapshot;
  EOQ
}

query "ebs_volume_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when encrypted then 'ok'
        else 'alarm'
      end as status,
      case
        when encrypted then volume_id || ' encrypted.'
        else volume_id || ' not encrypted.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ebs_volume;
  EOQ
}

query "ebs_attached_volume_encryption_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when state != 'in-use' then 'skip'
        when encrypted then 'ok'
        else 'alarm'
      end as status,
      case
        when state != 'in-use' then volume_id || ' not attached.'
        when encrypted then volume_id || ' encrypted.'
        else volume_id || ' not encrypted.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ebs_volume;
  EOQ
}

query "ebs_volume_in_backup_plan" {
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
    backed_up_volume as (
      select
        v.volume_id
      from
        aws_ebs_volume as v
        join mapped_with_id as t on t.mapped_ids ?| array[v.arn]
      union
      select
        v.volume_id
      from
        aws_ebs_volume as v
        join mapped_with_tags as t on t.mapped_tags ?| array(select jsonb_object_keys(tags))
    )
    select
      v.arn as resource,
      case
        when b.volume_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when b.volume_id is null then v.title || ' not in backup plan.'
        else v.title || ' in backup plan.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "v.")}
    from
      aws_ebs_volume as v
      left join backed_up_volume as b on v.volume_id = b.volume_id;
  EOQ
}

query "ebs_attached_volume_delete_on_termination_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when state != 'in-use' then 'skip'
        when attachment ->> 'DeleteOnTermination' = 'true' then 'ok'
        else 'alarm'
      end as status,
      case
        when state != 'in-use' then title || ' not attached to EC2 instance.'
        when attachment ->> 'DeleteOnTermination' = 'true' then title || ' attached to ' || (attachment ->> 'InstanceId') || ', delete on termination enabled.'
        else title || ' attached to ' || (attachment ->> 'InstanceId') || ', delete on termination disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ebs_volume
      left join jsonb_array_elements(attachments) as attachment on true;
  EOQ
}

query "ebs_volume_protected_by_backup_plan" {
  sql = <<-EOQ
    with backup_protected_volume as (
      select
        resource_arn as arn
      from
        aws_backup_protected_resource as b
      where
        resource_type = 'EBS'
    )
    select
      v.arn as resource,
      case
        when b.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.arn is not null then v.title || ' is protected by backup plan.'
        else v.title || ' is not protected by backup plan.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "v.")}
    from
      aws_ebs_volume as v
      left join backup_protected_volume as b on v.arn = b.arn;
  EOQ
}

query "ebs_volume_unused" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when state = 'in-use' then 'ok'
        else 'alarm'
      end as status,
      case
        when state = 'in-use' then title || ' attached to EC2 instance.'
        else title || ' not attached to EC2 instance.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ebs_volume;
  EOQ
}

query "ebs_snapshot_encryption_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when encrypted then 'ok'
        else 'alarm'
      end as status,
      case
        when encrypted then title || ' encryption enabled.'
        else title || ' encryption disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ebs_snapshot;
  EOQ
}