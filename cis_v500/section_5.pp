locals {
  cis_v500_5_common_tags = merge(local.cis_v500_common_tags, {
    cis_section_id = "5"
  })
}

locals {
  cis_v500_5_1_common_tags = merge(local.cis_v500_5_common_tags, {
    cis_section_id = "5.1"
  })
}

benchmark "cis_v500_5" {
  title         = "5 Networking"
  documentation = file("./cis_v500/docs/cis_v500_5.md")
  children = [
    benchmark.cis_v500_5_1,
    control.cis_v500_5_2,
    control.cis_v500_5_3,
    control.cis_v500_5_4,
    control.cis_v500_5_5,
    control.cis_v500_5_6,
    control.cis_v500_5_7
  ]

  tags = merge(local.cis_v500_5_common_tags, {
    service = "AWS/VPC"
    type    = "Benchmark"
  })
}

benchmark "cis_v500_5_1" {
  title         = "5.1 Elastic Compute Cloud (EC2)"
  documentation = file("./cis_v500/docs/cis_v500_5_1.md")
  children = [
    control.cis_v500_5_1_1,
    control.cis_v500_5_1_2
  ]

  tags = merge(local.cis_v500_5_common_tags, {
    service = "AWS/EC2"
    type    = "Benchmark"
  })
}

control "cis_v500_5_1_1" {
  title         = "5.1.1 Ensure EBS Volume Encryption is Enabled in all Regions"
  description   = "Elastic Compute Cloud (EC2) supports encryption at rest when using the Elastic Block Store (EBS) service. While disabled by default, forcing encryption at EBS volume creation is supported."
  documentation = file("./cis_v500/docs/cis_v500_5_1_1.md")
  query         = query.ebs_encryption_by_default_enabled

  tags = merge(local.cis_v500_5_1_common_tags, {
    cis_item_id = "5.1.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/EBS"
  })
}

control "cis_v500_5_1_2" {
  title         = "5.1.2 Ensure CIFS access is restricted to trusted networks to prevent unauthorized access"
  description   = "Common Internet File System (CIFS) is a network file-sharing protocol that allows systems to share files over a network. However, unrestricted CIFS access can expose your data to unauthorized users, leading to potential security risks. It is important to restrict CIFS access to only trusted networks and users to prevent unauthorized access and data breaches."
  documentation = file("./cis_v500/docs/cis_v500_5_1_2.md")
  query         = query.vpc_security_group_restrict_ingress_cifs_port_all

  tags = merge(local.cis_v500_5_1_common_tags, {
    cis_item_id = "5.1.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/VPC"
  })
}

control "cis_v500_5_2" {
  title         = "5.2 Ensure no Network ACLs allow ingress from 0.0.0.0/0 to remote server administration ports"
  description   = "The Network Access Control List (NACL) function provides stateless filtering of ingress and egress network traffic to AWS resources. It is recommended that no NACL allows unrestricted ingress access to remote server administration ports, such as SSH on port 22 and RDP on port 3389, using either the TCP (6), UDP (17), or ALL (-1) protocols."
  query         = query.vpc_network_acl_remote_administration
  documentation = file("./cis_v500/docs/cis_v500_5_2.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/VPC"
  })
}

control "cis_v500_5_3" {
  title         = "5.3 Ensure no security groups allow ingress from 0.0.0.0/0 to remote server administration ports"
  description   = "Security groups provide stateful filtering of ingress and egress network traffic to AWS resources. It is recommended that no security group allows unrestricted ingress access to remote server administration ports, such as SSH on port 22 and RDP on port 3389, using either the TCP (6), UDP (17), or ALL (-1) protocols."
  query         = query.vpc_security_group_remote_administration_ipv4
  documentation = file("./cis_v500/docs/cis_v500_5_3.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/VPC"
  })
}

control "cis_v500_5_4" {
  title         = "5.4 Ensure no security groups allow ingress from ::/0 to remote server administration ports"
  description   = "Security groups provide stateful filtering of ingress and egress network traffic to AWS resources. It is recommended that no security group allows unrestricted ingress access to remote server administration ports, such as SSH on port 22 and RDP on port 3389."
  query         = query.vpc_security_group_remote_administration_ipv6
  documentation = file("./cis_v500/docs/cis_v500_5_3.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/VPC"
  })
}

control "cis_v500_5_5" {
  title         = "5.5 Ensure the default security group of every VPC restricts all traffic"
  description   = "A VPC comes with a default security group whose initial settings deny all inbound traffic, allow all outbound traffic, and allow all traffic between instances assigned to the security group. If a security group is not specified when an instance is launched, it is automatically assigned to this default security group. Security groups provide stateful filtering of ingress/egress network traffic to AWS resources. It is recommended that the default security group restrict all traffic, both inbound and outbound."
  query         = query.vpc_default_security_group_restricts_all_traffic
  documentation = file("./cis_v500/docs/cis_v500_5_5.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.5"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "AWS/VPC"
  })
}

control "cis_v500_5_6" {
  title         = "5.6 Ensure routing tables for VPC peering are \"least access\""
  description   = "Once a VPC peering connection is established, routing tables must be updated to enable any connections between the peered VPCs. These routes can be as specific as desired, even allowing for the peering of a VPC to only a single host on the other side of the connection."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_5_6.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.6"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "AWS/VPC"
  })
}

control "cis_v500_5_7" {
  title         = "5.7 Ensure that the EC2 Metadata Service only allows IMDSv2"
  description   = "When enabling the Metadata Service on AWS EC2 instances, users have the option of using either Instance Metadata Service Version 1 (IMDSv1; a request/response method) or Instance Metadata Service Version 2 (IMDSv2; a session-oriented method)."
  query         = query.ec2_instance_uses_imdsv2
  documentation = file("./cis_v500/docs/cis_v500_5_7.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.7"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/EC2"
  })
}
