locals {
  cis_v600_6_common_tags = merge(local.cis_v600_common_tags, {
    cis_section_id = "6"
  })
}

locals {
  cis_v600_6_1_common_tags = merge(local.cis_v600_6_common_tags, {
    cis_section_id = "6.1"
  })
}

benchmark "cis_v600_6" {
  title         = "6 Networking"
  documentation = file("./cis_v600/docs/cis_v600_6.md")
  children = [
    benchmark.cis_v600_6_1,
    control.cis_v600_6_2,
    control.cis_v600_6_3,
    control.cis_v600_6_4,
    control.cis_v600_6_5,
    control.cis_v600_6_6,
    control.cis_v600_6_7
  ]

  tags = merge(local.cis_v600_6_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_v600_6_1" {
  title         = "6.1 Elastic Compute Cloud (EC2)"
  documentation = file("./cis_v600/docs/cis_v600_6_1.md")
  children = [
    control.cis_v600_6_1_1,
    control.cis_v600_6_1_2
  ]

  tags = merge(local.cis_v600_6_1_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v600_6_1_1" {
  title         = "6.1.1 Ensure EBS volume encryption is enabled in all regions"
  description   = "Elastic Compute Cloud (EC2) supports encryption at rest when using the Elastic Block Store (EBS) service. While disabled by default, forcing encryption at EBS volume creation is supported."
  query         = query.ebs_encryption_by_default_enabled
  documentation = file("./cis_v600/docs/cis_v600_6_1_1.md")

  tags = merge(local.cis_v600_6_1_common_tags, {
    cis_item_id = "6.1.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/EC2"
  })
}

control "cis_v600_6_1_2" {
  title         = "6.1.2 Ensure CIFS access is restricted to trusted networks to prevent unauthorized access"
  description   = "CIFS access should be restricted to trusted networks to prevent unauthorized access."
  query         = query.vpc_security_group_restrict_ingress_cifs_port_all
  documentation = file("./cis_v600/docs/cis_v600_6_1_2.md")

  tags = merge(local.cis_v600_6_1_common_tags, {
    cis_item_id = "6.1.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/EC2"
  })
}

control "cis_v600_6_2" {
  title         = "6.2 Ensure no Network ACLs allow ingress from 0.0.0.0/0 to remote server administration ports"
  description   = "The Network Access Control List (NACL) function provides stateless filtering of ingress and egress network traffic to AWS resources. It is recommended that no NACL allows unrestricted ingress access to remote server administration ports, such as SSH on port 22 and RDP on port 3389, using either the TCP (6), UDP (17), or ALL (-1) protocols."
  query         = query.vpc_network_acl_remote_administration
  documentation = file("./cis_v600/docs/cis_v600_6_2.md")

  tags = merge(local.cis_v600_6_common_tags, {
    cis_item_id = "6.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/VPC"
  })
}

control "cis_v600_6_3" {
  title         = "6.3 Ensure no security groups allow ingress from 0.0.0.0/0 to remote server administration ports"
  description   = "Security groups should not allow ingress from 0.0.0.0/0 to remote server administration ports."
  query         = query.vpc_security_group_remote_administration_ipv4
  documentation = file("./cis_v600/docs/cis_v600_6_3.md")

  tags = merge(local.cis_v600_6_common_tags, {
    cis_item_id = "6.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/VPC"
  })
}

control "cis_v600_6_4" {
  title         = "6.4 Ensure no security groups allow ingress from ::/0 to remote server administration ports"
  description   = "Security groups provide stateful filtering of ingress and egress network traffic to AWS resources. It is recommended that no security group allows unrestricted ingress access to remote server administration ports, such as SSH on port 22 and RDP on port 3389"
  query         = query.vpc_security_group_remote_administration_ipv6
  documentation = file("./cis_v600/docs/cis_v600_6_4.md")

  tags = merge(local.cis_v600_6_common_tags, {
    cis_item_id = "6.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/VPC"
  })
}

control "cis_v600_6_5" {
  title         = "6.5 Ensure the default security group of every VPC restricts all traffic"
  description   = "A VPC comes with a default security group whose initial settings deny all inbound traffic, allow all outbound traffic, and allow all traffic between instances assigned to the security group. If a security group is not specified when an instance is launched, it is automatically assigned to this default security group. Security groups provide stateful filtering of ingress/egress network traffic to AWS resources. It is recommended that the default security group restrict all traffic, both inbound and outbound."
  query         = query.vpc_default_security_group_restricts_all_traffic
  documentation = file("./cis_v600/docs/cis_v600_6_5.md")

  tags = merge(local.cis_v600_6_common_tags, {
    cis_item_id = "6.5"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "AWS/VPC"
  })
}

control "cis_v600_6_6" {
  title         = "6.6 Ensure routing tables for VPC peering are 'least access'"
  description   = "Routing tables for VPC peering should be 'least access'."
  query         = query.manual_control
  documentation = file("./cis_v600/docs/cis_v600_6_6.md")

  tags = merge(local.cis_v600_6_common_tags, {
    cis_item_id = "6.6"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "AWS/VPC"
  })
}

control "cis_v600_6_7" {
  title         = "6.7 Ensure that the EC2 Metadata Service only allows IMDSv2"
  description   = "When enabling the Metadata Service on AWS EC2 instances, users have the option of using either Instance Metadata Service Version 1 (IMDSv1; a request/response method) or Instance Metadata Service Version 2 (IMDSv2; a session-oriented method)."
  query         = query.ec2_instance_uses_imdsv2
  documentation = file("./cis_v600/docs/cis_v600_6_7.md")

  tags = merge(local.cis_v600_6_common_tags, {
    cis_item_id = "6.7"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/EC2"
  })
}
