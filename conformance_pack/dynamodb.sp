locals {
  conformance_pack_dynamodb_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/DynamoDB"
  })
}

control "dynamodb_table_auto_scaling_enabled" {
  title       = "DynamoDB table auto scaling should be enabled"
  description = "Amazon DynamoDB auto scaling uses the AWS Application Auto Scaling service to adjust provisioned throughput capacity that automatically responds to actual traffic patterns."
  query       = query.dynamodb_table_auto_scaling_enabled

  tags = merge(local.conformance_pack_dynamodb_common_tags, {
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

control "dynamodb_table_point_in_time_recovery_enabled" {
  title       = "DynamoDB table point-in-time recovery should be enabled"
  description = "Enable this rule to check that information has been backed up. It also maintains the backups by ensuring that point-in-time recovery is enabled in Amazon DynamoDB."
  query       = query.dynamodb_table_point_in_time_recovery_enabled

  tags = merge(local.conformance_pack_dynamodb_common_tags, {
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

control "dynamodb_table_encrypted_with_kms" {
  title       = "DynamoDB table should be encrypted with AWS KMS"
  description = "Ensure that encryption is enabled for your Amazon DynamoDB tables. Because sensitive data can exist at rest in these tables, enable encryption at rest to help protect that data."
  query       = query.dynamodb_table_encrypted_with_kms

  tags = merge(local.conformance_pack_dynamodb_common_tags, {
    cisa_cyber_essentials                  = "true"
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
  })
}

control "dynamodb_table_in_backup_plan" {
  title       = "DynamoDB tables should be in a backup plan"
  description = "To help with data back-up processes, ensure your Amazon DynamoDB tables are a part of an AWS Backup plan."
  query       = query.dynamodb_table_in_backup_plan

  tags = merge(local.conformance_pack_dynamodb_common_tags, {
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

control "dynamodb_table_encryption_enabled" {
  title       = "DynamoDB table should have encryption enabled"
  description = "Ensure that encryption is enabled for your Amazon DynamoDB tables. Because sensitive data can exist at rest in these tables, enable encryption at rest to help protect that data."
  query       = query.dynamodb_table_encryption_enabled

  tags = merge(local.conformance_pack_dynamodb_common_tags, {
    gdpr                                   = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
  })
}

control "dynamodb_table_protected_by_backup_plan" {
  title       = "DynamoDB table should be protected by backup plan"
  description = "Ensure if Amazon DynamoDB tables are protected by a backup plan. The rule is non compliant if the DynamoDB Table is not covered by a backup plan."
  query       = query.dynamodb_table_protected_by_backup_plan

  tags = merge(local.conformance_pack_dynamodb_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
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

query "dynamodb_table_auto_scaling_enabled" {
  sql = <<-EOQ
    with table_with_autocaling as (
      select
        t.resource_id as resource_id,
        count(t.resource_id) as count
      from
        aws_appautoscaling_target as t where service_namespace = 'dynamodb'
        group by t.resource_id
    )
    select
      d.arn as resource,
      case
        when d.billing_mode = 'PAY_PER_REQUEST' then 'ok'
        when t.resource_id is null then 'alarm'
        when t.count < 2 then 'alarm'
        else 'ok'
      end as status,
      case
        when d.billing_mode = 'PAY_PER_REQUEST' then d.title || ' on-demand mode enabled.'
        when t.resource_id is null then d.title || ' autoscaling not enabled.'
        when t.count < 2 then d.title || ' auto scaling not enabled for both read and write capacity.'
        else d.title || ' autoscaling enabled for both read and write capacity.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "d.")}
    from
      aws_dynamodb_table as d
      left join table_with_autocaling as t on concat('table/', d.name) = t.resource_id;
  EOQ
}

query "dynamodb_table_point_in_time_recovery_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when lower( point_in_time_recovery_description ->> 'PointInTimeRecoveryStatus' ) = 'disabled' then 'alarm'
        else 'ok'
      end as status,
      case
        when lower( point_in_time_recovery_description ->> 'PointInTimeRecoveryStatus' ) = 'disabled' then title || ' point-in-time recovery not enabled.'
        else title || ' point-in-time recovery enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_dynamodb_table;
  EOQ
}

query "dynamodb_table_encrypted_with_kms" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when sse_description is null then 'alarm'
        else 'ok'
      end as status,
      case
        when sse_description is null then title || ' not encrypted with KMS.'
        else title || ' encrypted with KMS.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_dynamodb_table;
  EOQ
}

query "dynamodb_table_in_backup_plan" {
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
    backed_up_table as (
      select
        t.name
      from
        aws_dynamodb_table as t
        join mapped_with_id as m on m.mapped_ids ?| array[t.arn]
      union
      select
        t.name
      from
        aws_dynamodb_table as t
        join mapped_with_tags as m on m.mapped_tags ?| array(select jsonb_object_keys(tags))
    )
    select
      t.arn as resource,
      case
        when b.name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when b.name is null then t.title || ' not in backup plan.'
        else t.title || ' in backup plan.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      aws_dynamodb_table as t
      left join backed_up_table as b on t.name = b.name;
  EOQ
}

query "dynamodb_table_encryption_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when sse_description is not null and sse_description ->> 'SSEType' = 'KMS' then 'ok'
        when sse_description is null then 'ok'
        else 'alarm'
      end as status,
      case
        when sse_description is not null and sse_description ->> 'SSEType' = 'KMS'
          then title || ' encrypted with AWS KMS.'
        when sse_description is null then title || ' encrypted with DynamoDB managed CMK.'
        else title || ' not encrypted with CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_dynamodb_table;
  EOQ
}

query "dynamodb_table_protected_by_backup_plan" {
  sql = <<-EOQ
    with backup_protected_table as (
      select
        resource_arn as arn
      from
        aws_backup_protected_resource as b
      where
        resource_type = 'DynamoDB'
    )
    select
      t.arn as resource,
      case
        when b.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.arn is not null then t.title || ' is protected by backup plan.'
        else t.title || ' is not protected by backup plan.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      aws_dynamodb_table as t
      left join backup_protected_table as b on t.arn = b.arn;
  EOQ
}
