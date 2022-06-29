benchmark "ffiec_d_4_c" {
  title       = "Connections (C)"
  description = "Connections incorporate the identification, monitoring, and management of external connections and data flows to third parties."
  children = [
    benchmark.ffiec_d_4_c_co_b_2
  ]

  # tags = local.ffiec_d_4_common_tags
  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_4_c_co_b_2" {
  title       = "D4.C.Co.B.2"
  description = "The institution ensures that third-party connections are authorized."
  children = [
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  # tags = merge(local.ffiec_d_4_common_tags, {
  #   ffiec_item_id = "ffiec_d_4_c_co_b_2"
  # })
  tags = local.ffiec_common_tags
}
