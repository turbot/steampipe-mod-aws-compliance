locals {
  extra_checks_vpc_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_vpc" {
  title       = "VPC Extra Checks"
  description = "TODO"
  children = [
    control.vpc_security_group_restrict_ingress_redis_port
  ]

  tags = local.extra_checks_vpc_common_tags
}
