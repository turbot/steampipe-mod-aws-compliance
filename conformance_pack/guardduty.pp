locals {
  conformance_pack_guardduty_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/GuardDuty"
  })
}

control "guardduty_enabled" {
  title       = "GuardDuty should be enabled"
  description = "AWS GuardDuty can help to monitor and detect potential cybersecurity events by using threat intelligence feeds."
  query       = query.guardduty_enabled

  tags = merge(local.conformance_pack_guardduty_common_tags, {
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
    nist_csf_v2                            = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "guardduty_finding_archived" {
  title       = "GuardDuty findings should be archived"
  description = "AWS GuardDuty helps you understand the impact of an incident by classifying findings by severity: low, medium, and high."
  query       = query.guardduty_finding_archived

  tags = merge(local.conformance_pack_guardduty_common_tags, {
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "guardduty_no_high_severity_findings" {
  title       = "GuardDuty Detector should not have high severity findings"
  description = "GuardDuty generates a finding whenever it detects unexpected and potentially malicious activity in your AWS environment. If critical findings are not addressed threats can spread in the environment. This rule is non-compliant if there are high severity findings."
  query       = query.guardduty_no_high_severity_findings

  tags = merge(local.conformance_pack_guardduty_common_tags, {
    nist_csf_v2 = "true"
  })
}

control "guardduty_centrally_configured" {
  title       = "GuardDuty Detector should be centrally configured"
  description = "Ensure that GuardDuty is centrally configured, if GuardDuty is not under central management, it becomes impossible to centrally manage GuardDuty findings, settings, and member accounts."
  query       = query.guardduty_centrally_configured

  tags = local.conformance_pack_guardduty_common_tags
}

control "guardduty_detector_eks_audit_log_monitoring_enabled" {
  title         = "GuardDuty EKS audit log monitoring should be enabled"
  description   = "This control checks whether GuardDuty EKS audit log monitoring is enabled. For a standalone account, the control fails if GuardDuty EKS audit log monitoring is disabled in the account. In a multi-account environment, the control fails if the delegated GuardDuty administrator account and all member accounts don't have EKS audit log monitoring enabled."
  query         = query.guardduty_detector_eks_audit_log_monitoring_enabled

  tags = local.conformance_pack_guardduty_common_tags
}

control "guardduty_detector_lambda_protection_enabled" {
  title         = "GuardDuty Lambda protection should be enabled"
  description   = "This control checks whether GuardDuty Lambda protection is enabled. For a standalone account, the control fails if GuardDuty Lambda protection is disabled in the account. In a multi-account environment, the control fails if the delegated GuardDuty administrator account and all member accounts don't have Lambda protection enabled."
  query         = query.guardduty_detector_lambda_protection_enabled

  tags = local.conformance_pack_guardduty_common_tags
}

control "guardduty_detector_eks_runtime_monitoring_enabled" {
  title         = "GuardDuty EKS runtime monitoring should be enabled"
  description   = "This control checks whether GuardDuty EKS runtime monitoring with automated agent management is enabled. For a standalone account, the control fails if GuardDuty EKS runtime monitoring with automated agent management is disabled in the account. In a multi-account environment, the control fails if the delegated GuardDuty administrator account and all member accounts don't have EKS runtime monitoring with automated agent management enabled."
  query         = query.guardduty_detector_eks_runtime_monitoring_enabled

  tags = local.conformance_pack_guardduty_common_tags
}

control "guardduty_detector_ec2_malware_protection_enabled" {
  title         = "GuardDuty Malware protection for EC2 should be enabled"
  description   = "This control checks whether GuardDuty Malware protection is enabled. For a standalone account, the control fails if GuardDuty Malware protection is disabled in the account. In a multi-account environment, the control fails if the delegated GuardDuty administrator account and all member accounts don't have Malware protection enabled."
  query         = query.guardduty_detector_ec2_malware_protection_enabled

  tags = local.conformance_pack_guardduty_common_tags
}

control "guardduty_detector_rds_protection_enabled" {
  title         = "GuardDuty RDS protection should be enabled"
  description   = "This control checks whether GuardDuty RDS protection is enabled. For a standalone account, the control fails if GuardDuty RDS protection is disabled in the account. In a multi-account environment, the control fails if the delegated GuardDuty administrator account and all member accounts don't have RDS protection enabled."
  query         = query.guardduty_detector_rds_protection_enabled

  tags = local.conformance_pack_guardduty_common_tags
}

control "guardduty_detector_s3_protection_enabled" {
  title         = "GuardDuty S3 protection should be enabled"
  description   = "This control checks whether GuardDuty S3 protection is enabled. For a standalone account, the control fails if GuardDuty S3 protection is disabled in the account. In a multi-account environment, the control fails if the delegated GuardDuty administrator account and all member accounts don't have S3 protection enabled."
  query         = query.guardduty_detector_s3_protection_enabled

  tags = local.conformance_pack_guardduty_common_tags
}

control "guardduty_detector_runtime_monitoring_enabled" {
  title         = "GuardDuty runtime monitoring should be enabled"
  description   = "This control checks whether runtime monitoring is enabled in Amazon GuardDuty. For a standalone account, the control fails if GuardDuty runtime monitoring is disabled for the account. In a multi-account environment, the control fails if GuardDuty runtime monitoring is disabled for the delegated GuardDuty administrator account and all member accounts."
  query         = query.guardduty_detector_runtime_monitoring_enabled

  tags = local.conformance_pack_guardduty_common_tags
}

control "guardduty_detector_ecs_runtime_monitoring_enabled" {
  title         = "GuardDuty ECS runtime monitoring should be enabled"
  description   = "This control checks whether the Amazon GuardDuty automated security agent is enabled for runtime monitoring of Amazon ECS clusters on AWS Fargate. For a standalone account, the control fails if the security agent is disabled for the account. In a multi-account environment, the control fails if the security agent is disabled for the delegated GuardDuty administrator account and all member accounts."
  query         = query.guardduty_detector_ecs_runtime_monitoring_enabled

  tags = local.conformance_pack_guardduty_common_tags
}

control "guardduty_detector_ec2_runtime_monitoring_enabled" {
  title         = "GuardDuty EC2 runtime monitoring should be enabled"
  description   = "This control checks whether the Amazon GuardDuty automated security agent is enabled for runtime monitoring of Amazon EC2 instances. For a standalone account, the control fails if the security agent is disabled for the account. In a multi-account environment, the control fails if the security agent is disabled for the delegated GuardDuty administrator account and all member accounts."
  query         = query.guardduty_detector_ec2_runtime_monitoring_enabled

  tags = local.conformance_pack_guardduty_common_tags
}

query "guardduty_enabled" {
  sql = <<-EOQ
    select
      'arn:' || r.partition || '::' || r.region || ':' || r.account_id as resource,
      case
        when r.steampipe_available = false then 'skip'
        when r.region = any(array['af-south-1', 'ap-northeast-3', 'ap-southeast-3', 'eu-south-1', 'cn-north-1', 'cn-northwest-1', 'me-south-1', 'us-gov-east-1']) then 'skip'
        when r.opt_in_status = 'not-opted-in' then 'skip'
        when d.status = 'ENABLED' and d.master_account ->> 'AccountId' is null then 'ok'
        when d.status = 'ENABLED' and d.master_account ->> 'AccountId' is not null then 'info'
        else 'alarm'
      end as status,
      case
        when r.steampipe_available = false then r.region || ' is not available in the current connection configuration.'
        when r.region = any(array['af-south-1', 'ap-northeast-3', 'ap-southeast-3', 'eu-south-1', 'cn-north-1', 'cn-northwest-1', 'me-south-1', 'us-gov-east-1']) then r.region || ' region not supported.'
        when r.opt_in_status = 'not-opted-in' then r.region || ' region is disabled.'
        when d.status is null then 'No GuardDuty detector found in ' || r.region || '.'
        when d.status = 'ENABLED' and d.master_account ->> 'AccountId' is null then r.region || ' detector ' || d.title || ' enabled.'
        when d.status = 'ENABLED' and d.master_account ->> 'AccountId' is not null then r.region || ' detector ' || d.title || ' is managed by account ' || (d.master_account ->> 'AccountId') ||  ' via delegated admin.'
        else r.region || ' detector ' || d.title || ' disabled.'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "r.")}
    from
      aws_region as r
      left join aws_guardduty_detector d on r.account_id = d.account_id and r.name = d.region;
  EOQ
}

query "guardduty_no_high_severity_findings" {
  sql = <<-EOQ
    with detectors as (
      select
        d.detector_id,
        d.arn,
        d.title,
        d.region,
        d.account_id,
        d.tags,
        d.status,
        d._ctx
      from
        aws_guardduty_detector d
        join aws_region r on d.account_id = r.account_id and d.region = r.name
      where
        r.steampipe_available = true
    ),
    finding_count as (
      select
        f.detector_id,
        count(*) as count
      from
        aws_guardduty_finding as f
      group by
        f.detector_id
    )
    select
      d.arn as resource,
      case
        when d.status <> 'ENABLED' then 'skip'
        when fc.count = 0 or fc.count is null then 'ok'
        else 'alarm'
      end as status,
      case
        when d.status <> 'ENABLED' then d.detector_id || ' is disabled.'
        when fc.count = 0 or fc.count is null then d.detector_id || ' is enabled and does not have high severity findings.'
        else d.detector_id || ' is enabled and has ' || fc.count || ' high severity findings.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "d.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "d.")}
    from
      detectors as d
      left join finding_count as fc on fc.detector_id = d.detector_id;
  EOQ
}

query "guardduty_finding_archived" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when service ->> 'Archived' = 'false' then 'alarm'
        else 'ok'
      end as status,
      case
        when service ->> 'Archived' = 'false' then title || ' not archived.'
        else title || ' archived.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_guardduty_finding;
  EOQ
}

query "guardduty_centrally_configured" {
  sql = <<-EOQ
    select
      'arn:' || r.partition || '::' || r.region || ':' || r.account_id as resource,
      case
        -- Skip if region is is not available in the current connection configuration (i.e., not available to Steampipe)
        when r.steampipe_available = false then 'skip'
        when r.region = any(array['af-south-1', 'ap-northeast-3', 'ap-southeast-3', 'eu-south-1', 'cn-north-1', 'cn-northwest-1', 'me-south-1', 'us-gov-east-1']) then 'skip'
        when r.opt_in_status = 'not-opted-in' then 'skip'
        when d.status is null then 'info'
        when d.status = 'DISABLED' then 'alarm'
        when d.status = 'ENABLED' and d.master_account ->> 'AccountId' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when r.steampipe_available = false then r.region || ' is not available in the current connection configuration.'
        when r.region = any(array['af-south-1', 'ap-northeast-3', 'ap-southeast-3', 'eu-south-1', 'cn-north-1', 'cn-northwest-1', 'me-south-1', 'us-gov-east-1']) then r.region || ' region not supported.'
        when r.opt_in_status = 'not-opted-in' then r.region || ' region is disabled.'
        when d.status is null then 'No GuardDuty detector found in ' || r.region || '.'
        when d.status = 'DISABLED' then r.region || ' detector ' || d.title || ' disabled.'
        when d.status = 'ENABLED' and d.master_account ->> 'AccountId' is not null then r.region || ' detector ' || d.title || ' centrally configured.'
        else r.region || ' detector ' || d.title || ' not centrally configured.'
      end as reason
    ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "r.")}
    from
      aws_region as r
      left join aws_guardduty_detector d on r.account_id = d.account_id and r.name = d.region;
  EOQ
}

query "guardduty_detector_eks_audit_log_monitoring_enabled" {
  sql = <<-EOQ
    with eks_audit_log_monitoring as (
      select
        arn
      from
        aws_guardduty_detector,
        jsonb_array_elements(features) as f
      where
        f ->> 'Name' = 'EKS_AUDIT_LOGS'
        and f ->> 'Status' = 'ENABLED'
    )
    select
      d.arn as resource,
      case
        when m.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when m.arn is not null then title || ' has EKS audit log monitoring enabled.'
        else title || ' has EKS audit log monitoring disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_guardduty_detector as d
      left join eks_audit_log_monitoring as m on m.arn = d.arn
  EOQ
}

query "guardduty_detector_lambda_protection_enabled" {
  sql = <<-EOQ
    with lambda_protection as (
      select
        arn
      from
        aws_guardduty_detector,
        jsonb_array_elements(features) as f
      where
        f ->> 'Name' = 'LAMBDA_NETWORK_LOGS'
        and f ->> 'Status' = 'ENABLED'
    )
    select
      d.arn as resource,
      case
        when m.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when m.arn is not null then title || ' has Lambda protection enabled.'
        else title || ' has Lambda protection disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_guardduty_detector as d
      left join lambda_protection as m on m.arn = d.arn
  EOQ
}

query "guardduty_detector_eks_runtime_monitoring_enabled" {
  sql = <<-EOQ
    with eks_runtime_monitoring as (
      select
        arn
      from
        aws_guardduty_detector,
        jsonb_array_elements(features) as f
      where
        f ->> 'Name' = 'EKS_RUNTIME_MONITORING'
        and f ->> 'Status' = 'ENABLED'
    )
    select
      d.arn as resource,
      case
        when m.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when m.arn is not null then title || ' has EKS runtime monitoring enabled.'
        else title || ' has EKS runtime monitoring disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_guardduty_detector as d
      left join eks_runtime_monitoring as m on m.arn = d.arn
  EOQ
}

query "guardduty_detector_rds_protection_enabled" {
  sql = <<-EOQ
    with rds_protection as (
      select
        arn
      from
        aws_guardduty_detector,
        jsonb_array_elements(features) as f
      where
        f ->> 'Name' = 'RDS_LOGIN_EVENTS'
        and f ->> 'Status' = 'ENABLED'
    )
    select
      d.arn as resource,
      case
        when m.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when m.arn is not null then title || ' has RDS protection enabled.'
        else title || ' has RDS protection disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_guardduty_detector as d
      left join rds_protection as m on m.arn = d.arn
  EOQ
}

query "guardduty_detector_s3_protection_enabled" {
  sql = <<-EOQ
    with s3_protection as (
      select
        arn
      from
        aws_guardduty_detector,
        jsonb_array_elements(features) as f
      where
        f ->> 'Name' = 'S3_DATA_EVENTS'
        and f ->> 'Status' = 'ENABLED'
    )
    select
      d.arn as resource,
      case
        when m.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when m.arn is not null then title || ' has S3 protection enabled.'
        else title || ' has S3 protection disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_guardduty_detector as d
      left join s3_protection as m on m.arn = d.arn
  EOQ
}

query "guardduty_detector_runtime_monitoring_enabled" {
  sql = <<-EOQ
    with runtime_monitoring as (
      select
        arn
      from
        aws_guardduty_detector,
        jsonb_array_elements(features) as f
      where
        f ->> 'Name' = 'RUNTIME_MONITORING'
        and f ->> 'Status' = 'ENABLED'
    )
    select
      d.arn as resource,
      case
        when m.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when m.arn is not null then title || ' has runtime monitoring enabled.'
        else title || ' has runtime monitoring disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_guardduty_detector as d
      left join runtime_monitoring as m on m.arn = d.arn
  EOQ
}

query "guardduty_detector_ecs_runtime_monitoring_enabled" {
  sql = <<-EOQ
    with ecs_runtime_monitoring as (
      select
        arn
      from
        aws_guardduty_detector,
        jsonb_array_elements(features) as f,
        jsonb_array_elements(f -> 'AdditionalConfiguration') as c
      where
        f ->> 'Name' = 'RUNTIME_MONITORING'
        and c ->> 'Name' = 'ECS_FARGATE_AGENT_MANAGEMENT'
        and c ->> 'Status' = 'ENABLED'
    )
    select
      d.arn as resource,
      case
        when m.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when m.arn is not null then title || ' has ECS runtime monitoring enabled.'
        else title || ' has ECS runtime monitoring disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_guardduty_detector as d
      left join ecs_runtime_monitoring as m on m.arn = d.arn
  EOQ
}

query "guardduty_detector_ec2_runtime_monitoring_enabled" {
  sql = <<-EOQ
    with ec2_runtime_monitoring as (
      select
        arn
      from
        aws_guardduty_detector,
        jsonb_array_elements(features) as f,
        jsonb_array_elements(f -> 'AdditionalConfiguration') as c
      where
        f ->> 'Name' = 'RUNTIME_MONITORING'
        and c ->> 'Name' = 'EC2_AGENT_MANAGEMENT'
        and c ->> 'Status' = 'ENABLED'
    )
    select
      d.arn as resource,
      case
        when m.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when m.arn is not null then title || ' has EC2 runtime monitoring enabled.'
        else title || ' has EC2 runtime monitoring disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_guardduty_detector as d
      left join ec2_runtime_monitoring as m on m.arn = d.arn
  EOQ
}

query "guardduty_detector_ec2_malware_protection_enabled" {
  sql = <<-EOQ
    with ec2_malware_protection as (
      select
        arn
      from
        aws_guardduty_detector,
        jsonb_array_elements(features) as f
      where
        f ->> 'Name' = 'EBS_MALWARE_PROTECTION'
        and f ->> 'Status' = 'ENABLED'
    )
    select
      d.arn as resource,
      case
        when m.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when m.arn is not null then title || ' has EC2 malware protection enabled.'
        else title || ' has EC2 malware protection disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_guardduty_detector as d
      left join ec2_malware_protection as m on m.arn = d.arn
  EOQ
}