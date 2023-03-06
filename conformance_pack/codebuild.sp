locals {
  conformance_pack_codebuild_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/CodeBuild"
  })
}

control "codebuild_project_plaintext_env_variables_no_sensitive_aws_values" {
  title       = "CodeBuild project plaintext environment variables should not contain sensitive AWS values"
  description = "Ensure authentication credentials AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY do not exist within AWS CodeBuild project environments. Do not store these variables in clear text. Storing these variables in clear text leads to unintended data exposure and unauthorized access."
  query       = query.codebuild_project_plaintext_env_variables_no_sensitive_aws_values

  tags = merge(local.conformance_pack_codebuild_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_csf               = "true"
    soc_2                  = "true"
  })
}

control "codebuild_project_source_repo_oauth_configured" {
  title       = "CodeBuild GitHub or Bitbucket source repository URLs should use OAuth"
  description = "Ensure the GitHub or Bitbucket source repository URL does not contain personal access tokens, user name and password within AWS Codebuild project environments."
  query       = query.codebuild_project_source_repo_oauth_configured

  tags = merge(local.conformance_pack_codebuild_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_csf               = "true"
    soc_2                  = "true"
  })
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
      -- Required Columns
      a.arn as resource,
      case
        when b.arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.arn is null then a.title || ' has no plaintext environment variables with sensitive AWS values.'
        else a.title || ' has plaintext environment variables with sensitive AWS values.'
      end as reason
      -- Additional Dimensions
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
      -- Required Columns
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
      -- Additional Dimensions
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "p.")}
    from
      aws_codebuild_project as p
      left join aws_codebuild_source_credential as c on (p.region = c.region and p.source ->> 'Type' = c.server_type);
  EOQ
}
