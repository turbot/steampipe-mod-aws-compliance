locals {
  conformance_pack_codebuild_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/CodeBuild"
  })
}

control "codebuild_project_build_greater_then_90_days" {
  title       = "CodeBuild projects should not be unused for 90 days or greater"
  description = "Ensure CodeBuild projects are curently in use. It is recommended to remove the stale ones."
  query       = query.codebuild_project_build_greater_then_90_days

  tags = merge(local.conformance_pack_codebuild_common_tags, {
    other_checks = "true"
  })
}

control "codebuild_project_plaintext_env_variables_no_sensitive_aws_values" {
  title       = "CodeBuild project plaintext environment variables should not contain sensitive AWS values"
  description = "Ensure authentication credentials AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY do not exist within AWS CodeBuild project environments. Do not store these variables in clear text. Storing these variables in clear text leads to unintended data exposure and unauthorized access."
  query       = query.codebuild_project_plaintext_env_variables_no_sensitive_aws_values

  tags = merge(local.conformance_pack_codebuild_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_53_rev_4                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    soc_2                                  = "true"
  })
}

control "codebuild_project_source_repo_oauth_configured" {
  title       = "CodeBuild GitHub or Bitbucket source repository URLs should use OAuth"
  description = "Ensure the GitHub or Bitbucket source repository URL does not contain personal access tokens, user name and password within AWS Codebuild project environments."
  query       = query.codebuild_project_source_repo_oauth_configured

  tags = merge(local.conformance_pack_codebuild_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_53_rev_4                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    soc_2                                  = "true"
  })
}

control "codebuild_project_with_user_controlled_buildspec" {
  title       = "CodeBuild projects should not use an user controlled buildspec"
  description = "This control checks if buildspec.yml is used from a trusted source which user cant interfere with."
  query       = query.codebuild_project_with_user_controlled_buildspec

  tags = merge(local.conformance_pack_codebuild_common_tags, {
    other_checks = "true"
  })
}

control "codebuild_project_environment_privileged_mode_disabled" {
  title       = "CodeBuild project environments should not have privileged mode enabled"
  description = "This control checks if an AWS CodeBuild project environment has privileged mode enabled. This control fails when an AWS CodeBuild project environment has privileged mode enabled."
  query       = query.codebuild_project_environment_privileged_mode_disabled
  tags = merge(local.conformance_pack_codebuild_common_tags, {
    nist_csf     = "true"
    pci_dss_v321 = "true"
  })
}

control "codebuild_project_logging_enabled" {
  title       = "CodeBuild projects should have logging enabled"
  description = "This control checks if an AWS CodeBuild project environment has at least one log option enabled. The rule is non compliant if the status of all present log configurations is set to 'DISABLED'."
  query       = query.codebuild_project_logging_enabled

  tags = merge(local.conformance_pack_codebuild_common_tags, {
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_csf                               = "true"
  })
}

control "codebuild_project_artifact_encryption_enabled" {
  title       = "CodeBuild project artifact encryption should be enabled"
  description = "This control checks if a CodeBuild project has encryption enabled for all of its artifacts. The rule is non compliant if 'encryptionDisabled' is set to 'true' for any primary or secondary (if present) artifact configurations."
  query       = query.codebuild_project_artifact_encryption_enabled

  tags = merge(local.conformance_pack_codebuild_common_tags, {
    gxp_21_cfr_part_11  = "true"
    gxp_eu_annex_11     = "true"
    nist_csf            = "true"
  })
}

control "codebuild_project_s3_logs_encryption_enabled" {
  title       = "CodeBuild project S3 logs should be encrypted"
  description = "This control checks if S3 logs for a CodeBuild project are encrypted. The control fails if encryption is deactivated for S3 logs for a CodeBuild project."
  query       = query.codebuild_project_s3_logs_encryption_enabled

  tags = merge(local.conformance_pack_codebuild_common_tags, {
    gxp_21_cfr_part_11 = "true"
    gxp_eu_annex_11    = "true"
    nist_csf           = "true"
  })
}

query "codebuild_project_build_greater_then_90_days" {
  sql = <<-EOQ
    with latest_codebuild_build as (
      select
        project_name,
        region,
        account_id,
        min(date_part('day', now() - end_time)) as build_time
      from
        aws_codebuild_build
      group by
        project_name,
        region,
        account_id
    )
    select
      p.arn as resource,
      case
        when b.build_time is null then 'alarm'
        when b.build_time < 90 then 'ok'
        else 'alarm'
      end as status,
      case
        when b.build_time is null then p.title || ' has no builds.'
        else p.title || ' was build ' || build_time || ' day(s) before.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "p.")}
    from
      aws_codebuild_project as p
      left join latest_codebuild_build as b on p.name = b.project_name and p.region = b.region and p.account_id = b.account_id;
  EOQ
}

query "codebuild_project_plaintext_env_variables_no_sensitive_aws_values" {
  sql = <<-EOQ
    with invalid_key_name as (
      select
        distinct arn,
        name
      from
        aws_codebuild_project,
        jsonb_array_elements(environment -> 'EnvironmentVariables') as env
      where
        env ->> 'Name' ilike any(array['%AWS_ACCESS_KEY_ID%', '%AWS_SECRET_ACCESS_KEY%', '%PASSWORD%'])
        and env ->> 'Type' = 'PLAINTEXT'
    )
    select
      a.arn as resource,
      case
        when b.arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.arn is null then a.title || ' has no plaintext environment variables with sensitive AWS values.'
        else a.title || ' has plaintext environment variables with sensitive AWS values.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
    from
      aws_codebuild_project as a
      left join invalid_key_name b on a.arn = b.arn;
  EOQ
}

query "codebuild_project_source_repo_oauth_configured" {
  sql = <<-EOQ
    select
      p.arn as resource,
      case
        when p.source ->> 'Type' not in ('GITHUB', 'BITBUCKET') then 'skip'
        when c.auth_type = 'OAUTH' then 'ok'
        else 'alarm'
      end as status,
      case
        when p.source ->> 'Type' = 'NO_SOURCE' then p.title || ' doesn''t have input source code.'
        when p.source ->> 'Type' not in ('GITHUB', 'BITBUCKET') then p.title || ' source code isn''t in GitHub/Bitbucket repository.'
        when c.auth_type = 'OAUTH' then p.title || ' using OAuth to connect source repository.'
        else p.title || ' not using OAuth to connect source repository.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "p.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "p.")}
    from
      aws_codebuild_project as p
      left join aws_codebuild_source_credential as c on (p.region = c.region and p.source ->> 'Type' = c.server_type);
  EOQ
}

query "codebuild_project_with_user_controlled_buildspec" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when split_part(source ->> 'Buildspec', '.', -1) = 'yml' then 'alarm'
        else 'ok'
      end as status,
      case
        when split_part(source ->> 'Buildspec', '.', -1) = 'yml' then title || ' uses a user controlled buildspec.'
        else title || ' does not uses a user controlled buildspec.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_codebuild_project;
  EOQ
}

query "codebuild_project_environment_privileged_mode_disabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when environment ->> 'PrivilegedMode' = 'true' then 'alarm'
        else 'ok'
      end as status,
      case
        when environment ->> 'PrivilegedMode' = 'true' then title || ' environment privileged mode enabled.'
        else title || ' environment privileged mode disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_codebuild_project;
  EOQ
}

query "codebuild_project_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when logs_config -> 'CloudWatchLogs' ->> 'Status' = 'ENABLED' or logs_config -> 'S3Logs' ->> 'Status' = 'ENABLED' then 'ok'
        else 'alarm'
      end as status,
      case
        when logs_config -> 'CloudWatchLogs' ->> 'Status' = 'ENABLED' or logs_config -> 'S3Logs' ->> 'Status' = 'ENABLED' then title || ' logging enabled.'
        else title || ' logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_codebuild_project;
  EOQ
}

query "codebuild_project_artifact_encryption_enabled" {
  sql = <<-EOQ
    with secondary_artifact as (
      select
        distinct arn
      from
        aws_codebuild_project,
        jsonb_array_elements(secondary_artifacts) as a
      where
        a -> 'EncryptionDisabled' = 'true'
    )
    select
      a.arn as resource,
      case
        when p.artifacts ->> 'EncryptionDisabled' = 'false'
        and (p.secondary_artifacts is null or a.arn is null) then 'ok'
        else 'alarm'
      end as status,
      case
        when p.artifacts ->> 'EncryptionDisabled' = 'false'
        and (p.secondary_artifacts is null or a.arn is null) then p.title || ' all artifacts encryption enabled.'
        else p.title || ' all artifacts encryption not enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "p.")}
    from
      aws_codebuild_project as p
      left join secondary_artifact as a on a.arn = p.arn;
  EOQ
}

query "codebuild_project_s3_logs_encryption_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when not (logs_config -> 'S3Logs' ->> 'EncryptionDisabled')::bool then 'ok'
        else 'alarm'
      end as status,
      case
        when not (logs_config -> 'S3Logs' ->> 'EncryptionDisabled')::bool then title || ' S3Logs encryption enabled.'
        else title || ' S3Logs encryption disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_codebuild_project;
  EOQ
}
