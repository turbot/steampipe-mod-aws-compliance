locals {
  foundational_security_route53_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/Route53"
  })
}

benchmark "foundational_security_route53" {
  title         = "Route53"
  documentation = file("./foundational_security/docs/foundational_security_route53.md")
  children = [
    control.foundational_security_route53_2
  ]

  tags = merge(local.foundational_security_route53_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_route53_2" {
  title         = "2 Route 53 public hosted zones should log DNS queries"
  description   = "This control checks if DNS query logging is enabled for an Amazon Route 53 public hosted zone. The control fails if DNS query logging isn't enabled for a Route 53 public hosted zone."
  severity      = "medium"
  query         = query.route53_zone_query_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_route53_2.md")

  tags = merge(local.foundational_security_route53_common_tags, {
    foundational_security_item_id  = "route53_2"
    foundational_security_category = "logging"
  })
}
