locals {
  conformance_pack_ecr_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/ECR"
  })
}

control "ecr_repository_image_scan_on_push_enabled" {
  title       = "ECR repositories should have image scan on push enabled"
  description = "Ensure Amazon Elastic Container Registry (ECR) repositories have image scanning enabled. The rule is non compliant if image scanning is not enabled for the ECR repository."
  query       = query.ecr_repository_image_scan_on_push_enabled

  tags = merge(local.conformance_pack_ecr_common_tags, {
    nist_csf     = "true"
    other_checks = "true"
  })
}

control "ecr_repository_prohibit_public_access" {
  title       = "ECR repositories should prohibit public access"
  description = "Ensure there are no ECR repositories set as public."
  query       = query.ecr_repository_prohibit_public_access

  tags = merge(local.conformance_pack_ecr_common_tags, {
    other_checks = "true"
  })
}

control "ecr_repository_tag_immutability_enabled" {
  title       = "ECR private repositories should have tag immutability configured"
  description = "This control checks whether a private ECR repository has tag immutability enabled. This control fails if a private ECR repository has tag immutability disabled. This rule passes if tag immutability is enabled and has the value IMMUTABLE."
  query       = query.ecr_repository_tag_immutability_enabled

  tags = merge(local.conformance_pack_ecr_common_tags, {
    nist_csf = "true"
  })
}

control "ecr_repository_lifecycle_policy_configured" {
  title       = "ECR repositories should have lifecycle policies configured"
  description = "This control checks if ECR repositories have lifecycle policy configured. This rule fails if ECR repository lifecycle policy is not enabled."
  query       = query.ecr_repository_lifecycle_policy_configured

  tags = merge(local.conformance_pack_ecr_common_tags, {
    gxp_21_cfr_part_11 = "true"
    gxp_eu_annex_11    = "true"
    nist_csf           = "true"
  })
}

query "ecr_repository_image_scan_on_push_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when image_scanning_configuration ->> 'ScanOnPush' = 'true' then 'ok'
        else 'alarm'
      end as status,
      case
        when image_scanning_configuration ->> 'ScanOnPush' = 'true' then title || ' scan on push enabled.'
        else title || ' scan on push disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ecr_repository;
  EOQ
}

query "ecr_repository_prohibit_public_access" {
  sql = <<-EOQ
    with open_access_ecr_repo as(
      select
        distinct arn
      from
        aws_ecr_repository,
        jsonb_array_elements(policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'AWS') as p,
        string_to_array(p, ':') as pa,
        jsonb_array_elements_text(s -> 'Action') as a
      where
        s ->> 'Effect' = 'Allow'
        and (
          p = '*'
        )
    )
    select
      r.arn as resource,
      case
        when o.arn is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when o.arn is not null then r.title || ' allows public access.'
        else r.title || ' does not allow public access.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "r.")}
    from
      aws_ecr_repository as r
      left join open_access_ecr_repo as o on r.arn = o.arn
    group by
      resource, status, reason, r.region, r.account_id, r.tags, r._ctx;
  EOQ
}

query "ecr_repository_tag_immutability_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when image_tag_mutability = 'IMMUTABLE' then 'ok'
        else 'alarm'
      end as status,
      case
        when image_tag_mutability = 'IMMUTABLE' then title || ' tag immutability enabled.'
        else title || ' tag immutability disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ecr_repository;
  EOQ
}

query "ecr_repository_lifecycle_policy_configured" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when lifecycle_policy -> 'rules' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when lifecycle_policy -> 'rules' is not null then title || ' lifecycle policy configured.'
        else title || ' lifecycle policy not configured.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ecr_repository;
  EOQ
}
