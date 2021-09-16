locals {
  extra_checks_ec2_common_tags = merge(local.extra_checks_common_tags, {
    service = "ec2"
  })
}

benchmark "group_ec2" {
  title       = "EC2 Checks"
  description = "This group of EC2 extra checks shows results of controls related to EC2 service."
  children = [
    control.vpc_security_group_restrict_ingress_rdp_all,
    control.ec2_ami_not_publicly_accessible,
    control.ebs_snapshot_encryption_enabled
  ]

  tags = local.extra_checks_ec2_common_tags
}

control "vpc_security_group_restrict_ingress_rdp_all" {
  title       = "Ensure no security groups allow ingress from 0.0.0.0/0 or ::/0 to port 3389"
  description = "Amazon Elastic Compute Cloud (Amazon EC2) Security Groups can help manage network access by providing stateful filtering of ingress and egress network traffic to AWS resources."
  sql         = query.vpc_security_group_restrict_ingress_rdp_all.sql

  tags = merge(local.extra_checks_ec2_common_tags, {
    extra_check_category = "infrastructure_security"
  })
}

control "ec2_ami_not_publicly_accessible" {
  title       = "Ensure there are no EC2 AMIs set as Public"
  description = "A shared AMI is an AMI that a developer created and made available for other developers to use. If AMIs have embedded information about the environment could pose a security risk. You use a shared AMI at your own risk. Amazon can not vouch for the integrity or security of AMIs shared by Amazon EC2 users."
  sql         = query.ec2_ami_not_publicly_accessible.sql

  tags = merge(local.extra_checks_ec2_common_tags, {
    extra_check_category = "infrastructure_security"
  })
}

control "ebs_snapshot_encryption_enabled" {
  title       = "Check if EBS snapshots are encrypted"
  description = "Encrypt all EBS snapshots and enable encryption by default. You can configure your AWS account to enforce the encryption of the new EBS volumes and snapshot copies that you create."
  sql         = query.ebs_snapshot_encryption_enabled.sql

  tags = merge(local.extra_checks_ec2_common_tags, {
    extra_check_category = "data_protection"
  })
}
