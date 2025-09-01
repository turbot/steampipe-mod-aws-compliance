locals {
  conformance_pack_servicecatalog_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/ServiceCatalog"
  })
}

control "servicecatalog_portfolio_shared_only_with_aws_organization" {
  title       = "Service Catalog portfolios should be shared only within an AWS organization"
  description = "This control checks whether AWS Service Catalog shares portfolios within an organization when the integration with AWS Organizations is enabled. The control fails if portfolios aren't shared within an organization."
  query       = query.servicecatalog_portfolio_shared_only_with_aws_organization

  tags = local.conformance_pack_servicecatalog_common_tags
}

query "servicecatalog_portfolio_shared_only_with_aws_organization" {
  sql = <<-EOQ
    with account_type_servicecatalog_portfolio_share as (
      select
        portfolio_id,
        account_id,
        principal_id,
        portfolio_display_name,
        region
      from
        aws_servicecatalog_portfolio_share
      where
        type = 'ACCOUNT'
    )
    select
      coalesce (t.portfolio_id, a.arn) as resource,
      case
        when t.portfolio_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when t.portfolio_id is null then a.title || ' has no shared portfolios.'
        else t.portfolio_display_name || ' shared portfolio with AWS account ' || t.principal_id || '.'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join account_type_servicecatalog_portfolio_share t on t.account_id = a.account_id;
  EOQ
}
