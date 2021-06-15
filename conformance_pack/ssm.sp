locals {
  conformance_pack_ssm_common_tags = {
    service = "ssm"
  }
}

control "ec2_instance_ssm_managed" {
  title       = "EC2 instances should be managed by AWS Systems Manager"
  description = "An inventory of the software platforms and applications within the organization is possible by managing Amazon Elastic Compute Cloud (Amazon EC2) instances with AWS Systems Manager."
  sql         = query.ec2_instance_ssm_managed.sql
  tags        = local.conformance_pack_ssm_common_tags
}