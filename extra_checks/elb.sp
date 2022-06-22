locals {
  extra_checks_elb_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_elb" {
  title       = "ELB"
  description = "This benchmark contains additional checks for AWS ELB servcice, these checks are out of the scope of any predefined benchmarks for AWS."
  children = [
    control.elb_listener_use_secure_ssl_cipher,
    control.elb_application_classic_network_lb_prohibit_public_access
  ]

  tags = local.extra_checks_elb_common_tags
}
