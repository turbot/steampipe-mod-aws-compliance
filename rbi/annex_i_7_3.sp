locals {
  rbi_annex_i_7_3_common_tags = merge(local.rbi_common_tags, {
    rbi_item_id = "annex_i_7_3"
  })
}

benchmark "rbi_annex_i_7_3" {
  title       = "Annex_I(7.3)"
  description = "TODO"
  children = [
    control.rbi_annex_i_7_3_vpc_security_group_restrict_ssh
  ]
  tags = local.rbi_annex_i_7_3_common_tags
}

control "rbi_annex_i_7_3_vpc_security_group_restrict_ssh" {
  title       = "VPC security group should restrict SSH"
  description = "Amazon Elastic Compute Cloud (Amazon EC2) Security Groups can help manage network access by providing stateful filtering of ingress and egress network traffic to AWS resources. Not allowing ingress (or remote) traffic from 0.0.0.0/0 to port 22 on your resources help you restricting remote access."
  sql         = query.vpc_security_group_restrict_ssh.sql

  tags = merge(local.rbi_annex_i_7_3_common_tags, {
    service = "vpc"
  })
}