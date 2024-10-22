locals {
  cis_v120_4_common_tags = merge(local.cis_v120_common_tags, {
    cis_section_id = "4"
  })
}

benchmark "cis_v120_4" {
  title         = "4 Networking"
  documentation = file("./cis_v120/docs/cis_v120_4.md")
  children = [
    control.cis_v120_4_1,
    control.cis_v120_4_2,
    control.cis_v120_4_3,
    control.cis_v120_4_4
  ]

  tags = merge(local.cis_v120_4_common_tags, {
    service = "AWS/VPC"
    type    = "Benchmark"
  })
}

control "cis_v120_4_1" {
  title         = "4.1 Ensure no security groups allow ingress from 0.0.0.0/0 to port 22"
  description   = "Security groups provide stateful filtering of ingress/egress network traffic to AWS resources. It is recommended that no security group allows unrestricted ingress access to port 22."
  query          = query.vpc_security_group_restrict_ingress_ssh_all
  documentation = file("./cis_v120/docs/cis_v120_4_1.md")

  tags = merge(local.cis_v120_4_common_tags, {
    cis_item_id = "4.1"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/VPC"
  })
}

control "cis_v120_4_2" {
  title         = "4.2 Ensure no security groups allow ingress from 0.0.0.0/0 to port 3389"
  description   = "Security groups provide stateful filtering of ingress/egress network traffic to AWS resources. It is recommended that no security group allows unrestricted ingress access to port 3389."
  query         = query.vpc_security_group_restrict_ingress_rdp_all
  documentation = file("./cis_v120/docs/cis_v120_4_2.md")

  tags = merge(local.cis_v120_4_common_tags, {
    cis_item_id = "4.2"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/VPC"
  })
}

control "cis_v120_4_3" {
  title         = "4.3 Ensure the default security group of every VPC restricts all traffic"
  description   = "A VPC comes with a default security group whose initial settings deny all inbound traffic, allow all outbound traffic, and allow all traffic between instances assigned to the security group. If you don't specify a security group when you launch an instance, the instance is automatically assigned to this default security group. Security groups provide stateful filtering of ingress/egress network traffic to AWS resources. It is recommended that the default security group restrict all traffic. The default VPC in every region should have its default security group updated to comply. Any newly created VPCs will automatically contain a default security group that will need remediation to comply with this recommendation."
  query         = query.vpc_default_security_group_restricts_all_traffic
  documentation = file("./cis_v120/docs/cis_v120_4_3.md")

  tags = merge(local.cis_v120_4_common_tags, {
    cis_item_id = "4.3"
    cis_level   = "2"
    cis_type    = "scored"
    service     = "AWS/VPC"
  })
}

control "cis_v120_4_4" {
  title         = "4.4 Ensure routing tables for VPC peering are \"least access\""
  description   = "Once a VPC peering connection is established, routing tables must be updated to establish any connections between the peered VPCs. These routes can be as specific as desired - even peering a VPC to only a single host on the other side of the connection."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_4_4.md")

  tags = merge(local.cis_v120_4_common_tags, {
    cis_item_id = "4.4"
    cis_level   = "2"
    cis_type    = "scored"
    service     = "AWS/VPC"
  })
}
