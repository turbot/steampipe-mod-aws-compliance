locals {
  foundational_security_servicecatalog_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/ServiceCatalog"
  })
}

benchmark "foundational_security_servicecatalog" {
  title         = "Service Catalog"
  documentation = file("./foundational_security/docs/foundational_security_servicecatalog.md")
  children = [
    control.foundational_security_servicecatalog_1
  ]

  tags = merge(local.foundational_security_servicecatalog_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_servicecatalog_1" {
  title         = "1 Service Catalog portfolios should be shared within an AWS organization only"
  description   = "This control checks whether AWS Service Catalog shares portfolios within an organization when the integration with AWS Organizations is enabled. The control fails if portfolios aren't shared within an organization."
  severity      = "high"
  query         = query.servicecatalog_portfolio_shared_only_with_aws_organization
  documentation = file("./foundational_security/docs/foundational_security_servicecatalog_1.md")

  tags = merge(local.foundational_security_servicecatalog_common_tags, {
    foundational_security_item_id  = "servicecatalog_1"
    foundational_security_category = "secure_access_management"
  })
}

