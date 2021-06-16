locals {
  rbi_annex_i_5_1_common_tags = merge(local.rbi_common_tags, {
    rbi_item_id = "annex_i_5_1"
  })
}

benchmark "rbi_annex_i_5_1" {
  title       = "Annex_I(5.1)"
  description = "TODO"
  children = [
    control.elb_application_lb_waf_enabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]
  tags = local.rbi_annex_i_5_1_common_tags
}
