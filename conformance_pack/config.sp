locals {
  conformance_pack_config_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Config"
  })
}

control "config_enabled_all_regions" {
  title       = "AWS Config should be enabled"
  description = "This control checks whether AWS Config is enabled in the account for the local Region and is recording all resources."
  query       = query.config_enabled_all_regions

  tags = merge(local.conformance_pack_config_common_tags, {
    gdpr                                   = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    soc_2                                  = "true"
  })
}

query "config_enabled_all_regions" {
  sql = <<-EOQ
    -- pgFormatter-ignore
    -- Get count for any region with all matching criteria
    with global_recorders as (
      select
        count(*) as global_config_recorders
      from
        aws_config_configuration_recorder
      where
        recording_group -> 'IncludeGlobalResourceTypes' = 'true'
        and recording_group -> 'AllSupported' = 'true'
        and status ->> 'Recording' = 'true'
        and status ->> 'LastStatus' = 'SUCCESS'
    )
    select
      'arn:aws::' || a.region || ':' || a.account_id as resource,
      case
      -- When any of the region satisfies with above CTE
      -- In left join of <aws_config_configuration_recorder> table, regions now having
      -- 'Recording' and 'LastStatus' matching criteria can be considered as OK
        when
          g.global_config_recorders >= 1
          and status ->> 'Recording' = 'true'
          and status ->> 'LastStatus' = 'SUCCESS'
        then 'ok'
      -- Skip any regions that are disabled in the account.
        when a.opt_in_status = 'not-opted-in' then 'skip'
        else 'alarm'
      end as status,
      -- Below cases are for citing respective reasons for control state
      case
        when a.opt_in_status = 'not-opted-in' then a.region || ' region is disabled.'
        else
      case
        when recording_group -> 'IncludeGlobalResourceTypes' = 'true' then a.region || ' IncludeGlobalResourceTypes enabled,'
        else a.region || ' IncludeGlobalResourceTypes disabled,'
      end ||
      case
        when recording_group -> 'AllSupported' = 'true' then ' AllSupported enabled,'
        else ' AllSupported disabled,'
      end ||
      case
        when status ->> 'Recording' = 'true' then ' Recording enabled'
        else ' Recording disabled'
      end ||
      case
        when status ->> 'LastStatus' = 'SUCCESS' then ' and LastStatus is SUCCESS.'
        else ' and LastStatus is not SUCCESS.'
      end
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
    from
      global_recorders as g,
      aws_region as a
      left join aws_config_configuration_recorder as r on r.account_id = a.account_id and r.region = a.name;
  EOQ
}
