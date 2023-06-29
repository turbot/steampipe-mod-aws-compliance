locals {
  conformance_pack_drs_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/DRS"
  })
}

control "drs_job_enabled" {
  title       = "DRS jobs should be enabled"
  description = "Ensure if DRS is enabled with jobs. This rule is non-compliant if DRS is not enabled with jobs for a particular region."
  query       = query.drs_job_enabled

  tags = merge(local.conformance_pack_drs_common_tags, {
    other_checks = "true"
  })
}

query "drs_job_enabled" {
  sql = <<-EOQ
    with drs_job_count as (
      select
        count(*) as count,
        region,
        account_id,
        _ctx
      from
        aws_drs_job
      group by
        region,
        account_id,
        _ctx
    )
    select
      'arn:' || r.partition || '::' || r.region || ':' || r.account_id as resource,
      case
        when drs_job_count.count = 0 or drs_job_count.count is null then 'alarm'
        else 'ok'
      end as status,
      case
        when drs_job_count.count = 0 or drs_job_count.count is null then 'DRS job not enabled for region ' || r.region || '.'
        else 'DRS job enabled for region ' || r.region || '.'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "drs_job_count.")}
    from
      aws_region as r
      left join drs_job_count on r.region = drs_job_count.region;
  EOQ
}