locals {
  all_controls_servicecatalog_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/ServiceCatalog"
  })
}

benchmark "all_controls_servicecatalog" {
  title       = "Service Catalog"
  description = "This section contains recommendations for configuring Service Catalog resources."
  children = [
    control.servicecatalog_portfolio_shared_only_with_aws_organization
  ]

  tags = merge(local.all_controls_servicecatalog_common_tags, {
    type = "Benchmark"
  })
}
