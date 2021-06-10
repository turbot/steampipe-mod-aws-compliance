locals {
  foundational_security_ssm_common_tags = merge(local.foundational_security_common_tags, {
    service = "ssm"
  })
}

benchmark "foundational_security_ssm" {
  title         = "SSM"
  documentation = file("./foundational_security/docs/foundational_security_ssm.md")
  children = [
    control.foundational_security_ssm_1
  ]
  tags          = local.foundational_security_ssm_common_tags
}

control "foundational_security_ssm_1" {
  title         = "1 EC2 instances should be managed by AWS Systems Manager"
  description   = "This control checks whether the EC2 instances in your account are managed by AWS Systems Manager. Systems Manager is an AWS service that you can use to view and control your AWS infrastructure. To help you to maintain security and compliance, Systems Manager scans your managed instances. A managed instance is a machine that is configured for use with Systems Manager. Systems Manager then reports or takes corrective action on any policy violations that it detects. Systems Manager also helps you to configure and maintain your managed instances."
  severity      = "medium"
  sql           = query.ec2_instance_ssm_managed.sql
  documentation = file("./foundational_security/docs/foundational_security_ssm_1.md")

  tags = merge(local.foundational_security_ssm_common_tags, {
    foundational_security_item_id  = "ssm_1"
    foundational_security_category = "inventory"
  })
}
