locals {
  conformance_pack_guardduty_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/GuardDuty"
  })
}

control "guardduty_enabled" {
  title       = "GuardDuty should be enabled"
  description = "Amazon GuardDuty can help to monitor and detect potential cybersecurity events by using threat intelligence feeds."
  query       = query.guardduty_enabled

  tags = merge(local.conformance_pack_guardduty_common_tags, {
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
    soc_2                  = "true"
  })
}

control "guardduty_finding_archived" {
  title       = "GuardDuty findings should be archived"
  description = "Amazon GuardDuty helps you understand the impact of an incident by classifying findings by severity: low, medium, and high."
  query       = query.guardduty_finding_archived

  tags = merge(local.conformance_pack_guardduty_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    hipaa                  = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
    soc_2                  = "true"
  })
}

query "guardduty_enabled" {
  sql = <<-EOQ
    select
      -- Required Columns
      'arn:' || r.partition || '::' || r.region || ':' || r.account_id as resource,
      case
        when r.region = any(array['af-south-1', 'ap-northeast-3', 'ap-southeast-3', 'eu-south-1', 'cn-north-1', 'cn-northwest-1', 'me-south-1', 'us-gov-east-1']) then 'skip'
        -- Skip any regions that are disabled in the account.
        when r.opt_in_status = 'not-opted-in' then 'skip'
        when status = 'ENABLED' and master_account ->> 'AccountId' is null then 'ok'
        when status = 'ENABLED' and master_account ->> 'AccountId' is not null then 'info'
        else 'alarm'
      end as status,
      case
        when r.region = any(array['af-south-1', 'ap-northeast-3', 'ap-southeast-3', 'eu-south-1', 'cn-north-1', 'cn-northwest-1', 'me-south-1', 'us-gov-east-1']) then r.region || ' region not supported.'
        when r.opt_in_status = 'not-opted-in' then r.region || ' region is disabled.'
        when status is null then 'No GuardDuty detector found in ' || r.region || '.'
        when status = 'ENABLED' and master_account ->> 'AccountId' is null then r.region || ' detector ' || d.title || ' enabled.'
        when status = 'ENABLED' and master_account ->> 'AccountId' is not null then r.region || ' detector ' || d.title || ' is managed by account ' || (master_account ->> 'AccountId') ||  ' via delegated admin.'
        else r.region || ' detector ' || d.title || ' disabled.'
      end as reason,
      -- Additional Dimensions
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "r.")}
    from
      aws_region as r
      left join aws_guardduty_detector d on r.account_id = d.account_id and r.name = d.region;
  EOQ
}

query "guardduty_finding_archived" {
  sql = <<-EOQ
    select
      -- Required Columns
      arn as resource,
      case
        when service ->> 'Archived' = 'false' then 'alarm'
        else 'ok'
      end as status,
      case
        when service ->> 'Archived' = 'false' then title || ' not archived.'
        else title || ' archived.'
      end as reason,
      -- Additional Dimensions
      ${local.common_dimensions_sql}
    from
      aws_guardduty_finding;
  EOQ
}
