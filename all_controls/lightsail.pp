locals {
  all_controls_lightsail_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/Lightsail"
  })
}

benchmark "all_controls_lightsail" {
  title       = "Lightsail"
  description = "This section contains recommendations for configuring Lightsail resources."
  children = [
    control.lightsail_instance_ipv6_networking_disabled,
    control.lightsail_instance_rdp_restricted_ip,
    control.lightsail_instance_ssh_rdp_http_ports_disabled,
    control.lightsail_instance_ssh_restricted_ip
  ]

  tags = merge(local.all_controls_lightsail_common_tags, {
    type = "Benchmark"
  })
}
