locals {
  rbi_annex_i_5_1_common_tags = merge(local.rbi_common_tags, {
    rbi_item_id = "annex_i_5_1"
  })
}

benchmark "rbi_annex_i_5_1" {
  title       = "Annex_I(5.1)"
  description = "The firewall configurations should be set to the highest security level and evaluation of critical device (such as firewall, network switches, security devices, etc.) configurations should be done periodically."
  children = [
    control.elb_application_waf_enabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_no_ingress_tcp_udp_all
  ]
  tags = local.rbi_annex_i_5_1_common_tags
}