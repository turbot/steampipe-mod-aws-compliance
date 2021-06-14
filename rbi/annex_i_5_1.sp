locals {
  rbi_annex_i_5_1_common_tags = merge(local.rbi_common_tags, {
    rbi_item_id = "annex_i_5_1"
  })
}

benchmark "rbi_annex_i_5_1" {
  title       = "Annex_I(5.1)"
  description = "TODO"
  children = [
    control.rbi_annex_i_5_1_elb_application_waf_enabled,
    control.rbi_annex_i_5_1_vpc_default_security_group_restricts_all_traffic,
    control.rbi_annex_i_5_1_vpc_security_group_authorized_port
  ]
  tags = local.rbi_annex_i_5_1_common_tags
}

control "rbi_annex_i_5_1_elb_application_waf_enabled" {
  title       = "Web Application Firewall (WAF) should be enabled on Application Load Balancers"
  description = "Ensure AWS WAF is enabled on Elastic Load Balancers (ELB) to help protect web applications."
  sql         = query.elb_application_waf_enabled.sql

  tags = merge(local.rbi_annex_i_5_1_common_tags, {
    service = "elb"
  })
}

control "rbi_annex_i_5_1_vpc_default_security_group_restricts_all_traffic" {
  title       = "VPC default security group should prohibit inbound and outbound traffic"
  description = "Amazon Elastic Compute Cloud (Amazon EC2) security groups can help in the management of network access by providing stateful filtering of ingress and egress network traffic to AWS resources."
  sql         = query.vpc_default_security_group_restricts_all_traffic.sql

  tags = merge(local.rbi_annex_i_5_1_common_tags, {
    service = "vpc"
  })
}

control "rbi_annex_i_5_1_vpc_security_group_authorized_port" {
  title       = "Security groups with inbound 0.0.0.0/0 should not have TCP or UDP ports accessible"
  description = "Manage access to resources in the AWS Cloud by ensuring common ports are restricted on Amazon Elastic Compute Cloud (Amazon EC2) Security Groups."
  sql         = query.vpc_security_group_no_ingress_tcp_udp_all.sql

  tags = merge(local.rbi_annex_i_5_1_common_tags, {
    service = "vpc"
  })
}