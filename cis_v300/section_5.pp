locals {
  cis_v300_5_common_tags = merge(local.cis_v300_common_tags, {
    cis_section_id = "5"
  })
}

benchmark "cis_v300_5" {
  title         = "5 Networking"
  documentation = file("./cis_v300/docs/cis_v300_5.md")
  children = [
    control.cis_v300_5_1,
    control.cis_v300_5_2,
    control.cis_v300_5_3,
    control.cis_v300_5_4,
    control.cis_v300_5_5,
    control.cis_v300_5_6
  ]

  tags = merge(local.cis_v300_5_common_tags, {
    service = "AWS/VPC"
    type    = "Benchmark"
  })
}

control "cis_v300_5_1" {
  title         = "5.1 Ensure no Network ACLs allow ingress from 0.0.0.0/0 to remote server administration ports"
  description   = "The Network Access Control List (NACL) function provide stateless filtering of ingress and egress network traffic to AWS resources. It is recommended that no NACL allows unrestricted ingress access to remote server administration ports, such as SSH to port 22 and RDP to port 3389, using either the TCP (6), UDP (17) or ALL (-1) protocols."
  query         = query.vpc_network_acl_remote_administration
  documentation = file("./cis_v300/docs/cis_v300_5_1.md")

  tags = merge(local.cis_v300_5_common_tags, {
    cis_item_id = "5.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/VPC"
  })
}

control "cis_v300_5_2" {
  title         = "5.2 Ensure no security groups allow ingress from 0.0.0.0/0 to remote server administration ports"
  description   = "Security groups provide stateful filtering of ingress and egress network traffic to AWS resources. It is recommended that no security group allows unrestricted ingress access to remote server administration ports, such as SSH to port 22 and RDP to port 3389, using either the TCP (6), UDP (17) or ALL (-1) protocols."
  query         = query.vpc_security_group_remote_administration_ipv4
  documentation = file("./cis_v300/docs/cis_v300_5_2.md")

  tags = merge(local.cis_v300_5_common_tags, {
    cis_item_id = "5.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/VPC"
  })
}

control "cis_v300_5_3" {
  title         = "5.3 Ensure no security groups allow ingress from ::/0 to remote server administration ports"
  description   = "Security groups provide stateful filtering of ingress and egress network traffic to AWS resources. It is recommended that no security group allows unrestricted ingress access to remote server administration ports, such as SSH to port 22 and RDP to port 3389."
  query         = query.vpc_security_group_remote_administration_ipv6
  documentation = file("./cis_v300/docs/cis_v300_5_3.md")

  tags = merge(local.cis_v300_5_common_tags, {
    cis_item_id = "5.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/VPC"
  })
}

control "cis_v300_5_4" {
  title         = "5.4 Ensure the default security group of every VPC restricts all traffic"
  description   = "A VPC comes with a default security group whose initial settings deny all inbound traffic, allow all outbound traffic, and allow all traffic between instances assigned to the security group. If you don't specify a security group when you launch an instance, the instance is automatically assigned to this default security group. Security groups provide stateful filtering of ingress/egress network traffic to AWS resources. It is recommended that the default security group restrict all traffic."
  query         = query.vpc_default_security_group_restricts_all_traffic
  documentation = file("./cis_v300/docs/cis_v300_5_4.md")

  tags = merge(local.cis_v300_5_common_tags, {
    cis_item_id = "5.4"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "AWS/VPC"
  })
}

control "cis_v300_5_5" {
  title         = "5.5 Ensure routing tables for VPC peering are \"least access\""
  description   = "Once a VPC peering connection is established, routing tables must be updated to establish any connections between the peered VPCs. These routes can be as specific as desired - even peering a VPC to only a single host on the other side of the connection."
  query         = query.manual_control
  documentation = file("./cis_v300/docs/cis_v300_5_5.md")

  tags = merge(local.cis_v300_5_common_tags, {
    cis_item_id = "5.5"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "AWS/VPC"
  })
}

control "cis_v300_5_6" {
  title         = "5.6 Ensure that EC2 Metadata Service only allows IMDSv2"
  description   = "When enabling the Metadata Service on AWS EC2 instances, users have the option of using either Instance Metadata Service Version 1 (IMDSv1; a request/response method) or Instance Metadata Service Version 2 (IMDSv2; a session-oriented method)."
  query         = query.ec2_instance_uses_imdsv2
  documentation = file("./cis_v300/docs/cis_v300_5_6.md")

  tags = merge(local.cis_v300_5_common_tags, {
    cis_item_id = "5.6"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/EC2"
  })
}
