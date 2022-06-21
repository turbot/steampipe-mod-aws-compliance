locals {
  extra_checks_vpc_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_vpc" {
  title       = "VPC"
  description = "This benchmark contains additional checks for AWS VPC servcice, these checks are out of the scope of any predefined benchmarks for AWS."
  children = [
    control.vpc_security_group_restrict_ingress_redis_port
  ]

  tags = local.extra_checks_vpc_common_tags
}
