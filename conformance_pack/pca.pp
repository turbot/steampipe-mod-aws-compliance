locals {
  conformance_pack_pca_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/PrivateCertificateAuthority"
  })
}

control "acmpca_root_certificate_authority_disabled" {
  title       = "AWS Private CA root certificate authority should be disabled"
  description = "This control checks if AWS Private CA has a root certificate authority (CA) that is disabled. The control fails if the root CA is enabled."
  query       = query.acmpca_root_certificate_authority_disabled

  tags = local.conformance_pack_pca_common_tags
}

query "acmpca_root_certificate_authority_disabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when type <> 'ROOT' then 'skip'
        when status = 'DISABLED' then 'ok'
        else 'alarm'
      end as status,
      case
        when type <> 'ROOT' then title || ' is not root CA.'
        when status = 'DISABLED' then title || ' root CA disabled.'
        else title || ' root CA not disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_acmpca_certificate_authority;
  EOQ
}
